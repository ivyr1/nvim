local opt = vim.opt

-- Tab & Indentation (4 spaces)
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Line Numbers (Relative Number)
opt.number = true
opt.relativenumber = true

-- Appearance & UI
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Window Splits
opt.splitright = true
opt.splitbelow = true

-- Backups & Undo History
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- System & Performance
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"
