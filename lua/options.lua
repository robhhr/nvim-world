local options = {
	background = 'dark',
	hidden = true,
	number = true,
	relativenumber = true,
	showmatch = true,
}

for i, j in pairs(options) do
	vim.opt[i] = j
end

