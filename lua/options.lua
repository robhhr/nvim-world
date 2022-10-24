-- set local options
local options = {
	background = 'dark',
	cmdheight = 2, -- for better readability
	cursorline = true, -- hightlight current cursor line
	expandtab = true,
	fileencoding = 'utf-8',
	hidden = true, -- multiple buffers
	number = true, -- show numbers on left
	relativenumber = true, -- for motions (10j/24k)
	shiftwidth = 2, -- spaces for autoindent
	showmatch = true, -- highlights matching parenthesis
	smarttab = true,
	swapfile = false, -- no backup files
	tabstop = 2, -- tab size
	termguicolors = true, -- for theming
	whichwrap = 'b,s,<,>,[,],h,l'
}

for i, j in pairs(options) do
	vim.opt[i] = j
end
