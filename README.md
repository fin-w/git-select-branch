# GitSelectBranch

## Description
**GitSelectBranch** is a Neovim plugin designed to enhance your Git workflow. It integrates with Telescope.nvim to allow users to seamlessly list, switch to, or create Git branches directly within Neovim.

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
