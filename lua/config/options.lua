local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")
opt.splitright = true
opt.splitbelow = true
opt.swapfile = false

-- Force a visible horizontal split line
opt.laststatus = 3 -- Global statusline
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#444444", bold = true })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#1a1b26", fg = "#7aa2f7" })
