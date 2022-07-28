local options = {
	background = 'dark',
	cursorline = true,
	fileencoding = 'utf-8',
	hidden = true,
	number = true,
	relativenumber = true,
	showmatch = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true
	whichwrap = 'b,s,<,>,[,],h,l'
}

for i, j in pairs(options) do
	vim.opt[i] = j
end

