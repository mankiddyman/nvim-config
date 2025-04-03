local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
  {"catppuccin/nvim", name= "catppuccin",priority=1000}, -- colour theme
  {"nvim-treesitter/nvim-treesitter", build= ":TSUpdate"}, -- syntax highlighting i believe
  {"github/copilot.vim",
	config = function()
		end,},
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { -- set to setup table
    },
}
}

require("lazy").setup(plugins, opts)





vim.cmd("set expandtab") --use spaces instead of tabs
vim.cmd("set tabstop=2") -- a tab visually is 2 spaces long
vim.cmd("set softtabstop=2") -- a tab actually is 2 spaces long
vim.cmd("set shiftwidth=2") -- indents are 2 spaces long 
vim.g.mapleader= " " 

vim.opt.number = true  -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers

-- i thought tabs should be 3 spaces long 


-- require catpuccin
require("catppuccin").setup()

--set as colorschme
vim.cmd.colorscheme "catppuccin"



-- treesitting
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "bash","python","r"},
  highlight = { enable = true },
  indent = { enable = true }
})


-- setting system clipboard? linux (just have xclip installed)
vim.opt.clipboard = "unnamedplus"
-- Map Ctrl+C to yank (copy)
vim.keymap.set('n', '<C-c>', '"+y', { desc = 'Copy to Clipboard' })
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy to Clipboard' })

-- Map Ctrl+V to paste
vim.keymap.set('n', '<C-v>', '"+p', { desc = 'Paste from Clipboard' })
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Paste from Clipboard' })


-- Map leader plus W to save
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save File' })
vim.keymap.set('v', '<leader>w', ':w<CR>', { desc = 'Save File' })

-- map leader + a to  select all
vim.keymap.set('n', '<leader>a', 'ggVG', { desc = 'Select All' })
vim.keymap.set('v', '<leader>a', 'ggVG', { desc = 'Select All' })

--map leader+ e to go to end of line
vim.keymap.set('n', '<leader>e', '$', { desc = 'Go to End of Line' })
--map leader+b to go to beginning of line
vim.keymap.set('n', '<leader>b', '0', { desc = 'Go to Beginning of Line' })
