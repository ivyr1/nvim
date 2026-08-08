-- Set leader key before loading modules
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core configuration modules
require("config.option")
require("config.keymap")
require("config.lazy")
require("config.lsp")
