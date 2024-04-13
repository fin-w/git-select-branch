" Title:        Git Select Branch 
" Description:  Select Git Branch by using Telescope 
" Maintainer:   Laszlo Papp <https://github.com/nucc>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_gitselectbranch")
    finish
endif
let g:loaded_gitselectbranch = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/git-select-branch/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 GitSelectBranch lua require("git-select-branch").select_branch()
