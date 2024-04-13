# GitSelectBranch

## Description
**GitSelectBranch** is a Neovim plugin designed to enhance your Git workflow. It integrates with Telescope.nvim to allow users to seamlessly list, switch to, or create Git branches directly within Neovim.

<img width="1001" alt="Screenshot 2024-04-13 at 17 52 26" src="https://github.com/Nucc/git-select-branch/assets/327855/e4670f7a-2484-4893-912d-2136201b2f62">
<img width="1010" alt="Screenshot 2024-04-13 at 17 54 16" src="https://github.com/Nucc/git-select-branch/assets/327855/617ae5ad-f8f2-4ffb-9ba2-000b5fa65001">
<img width="394" alt="Screenshot 2024-04-13 at 17 52 05" src="https://github.com/Nucc/git-select-branch/assets/327855/a5f0cc74-c9c8-4bbc-ac40-ce6ea4eb7806">



## Features
- **List Branches**: View all available Git branches in a Telescope picker.
- **Switch Branches**: Easily switch between branches with a simple selection.
- **Create Branches**: Prompt to create a new branch if it doesn't exist and switch to it.

## Prerequisites
- Neovim (0.5.0 or newer)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Git installed on your system

## Installation
Ensure you have Telescope.nvim installed and configured before adding GitSelectBranch.

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'nucc/git-select-branch',
  requires = { {'nvim-telescope/telescope.nvim'} }
}
```

### Using vim-plug

```lua
Plug 'yourgithubusername/neobranch'
Plug 'nvim-telescope/telescope.nvim'
```

## Usage
After installation, you can use the plugin with the following command:

```lua
:SelectGitBranch
```

You can also bind this command to a keyboard shortcut in your init.vim or init.lua:

```
nnoremap <leader>gb :SelectGitBranch<CR>
```

```lua
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>SelectGitBranch<CR>', { noremap = true, silent = true })
```

## Configuration
No additional configuration is needed to start using GitSelectBranch. Customize the key bindings as needed.

## Contributing
Contributions are welcome! If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are warmly welcome.


## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
