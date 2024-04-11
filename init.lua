-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local path_to_md = "~\\OneDrive\\Martin"

local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = "*", command = "cd " .. path_to_md, group = vim_enter_group })

local split = function()
	vim.cmd("set splitbelow")
	vim.cmd("sp")
	vim.cmd("res -5")
end

local compileRun = function()
	vim.cmd("w")
	-- check file type
	local ft = vim.bo.filetype
	if ft == "markdown" then
		vim.cmd(":InstantMarkdownPreview")
	elseif ft == 'c' then
		vim.cmd(":!gcc % -o %<.exe")
      vim.cmd(":! %<.exe")
      
	elseif ft == 'lua' then
		split()
		vim.cmd("term luajit %")
	elseif ft == 'tex' then
		vim.cmd(":VimtexCompile")
	end
end

vim.keymap.set('n', 'r', compileRun, { silent = true })