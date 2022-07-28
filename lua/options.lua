local options = {
	background = 'dark',
	cmdheight = 2,
	cursorline = true,
	expandtab = true,
	fileencoding = 'utf-8',
	hidden = true,
	number = true,
	relativenumber = true,
	shiftwidth = 2,
	showmatch = true,
	smarttab = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	whichwrap = 'b,s,<,>,[,],h,l'
}

for i, j in pairs(options) do
	vim.opt[i] = j
end

