local M = {}
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

local function get_branches()
    local branches = {}
    local current_branch = vim.fn.systemlist("git rev-parse --abbrev-ref HEAD")[1]
    local handle = io.popen("git branch --list")
    for branch in handle:lines() do
        branch = trim(branch:gsub("^%*%s", ""))
        if branch == current_branch then
            branch = "➤ " .. branch -- You can also use color here if you prefer
        end
        table.insert(branches, branch)
    end
    handle:close()
    return branches
end

local function checkout_branch(branch)
    branch = branch:gsub("➤ ", "") -- Remove the current branch indicator if present
    if branch then
        local check_branch_exists = vim.fn.system("git rev-parse --verify " .. branch)
        if vim.v.shell_error == 0 then
            print("Switching to existing branch: " .. branch)
            vim.fn.system("git checkout " .. branch)
        else
            if vim.fn.confirm("Branch does not exist. Create it?", "&Yes\n&No", 1) == 1 then
                print("Creating and switching to new branch: " .. branch)
                vim.fn.system("git checkout -b " .. branch)
            else
                print("Operation cancelled.")
            end
        end
    else
        print("No branch selected")
    end
end

function M.select_branch()
    local branches = get_branches()
    pickers
        .new({}, {
            prompt_title = "Select a Git branch",
            finder = finders.new_table({
                results = branches,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry,
                        ordinal = entry,
                    }
                end,
            }),
            sorter = conf.generic_sorter(),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    if selection then
                        checkout_branch(selection.value)
                    else
                        -- Handle empty selection or manual branch name input
                        local new_branch = action_state.get_current_line()
                        if new_branch ~= "" then
                            checkout_branch(new_branch)
                        else
                            print("No branch entered.")
                        end
                    end
                end)
                return true
            end,
        })
        :find()
end

vim.api.nvim_create_user_command("SelectGitBranch", M.select_branch, {})
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>SelectGitBranch<CR>", { noremap = true, silent = true })

return M
