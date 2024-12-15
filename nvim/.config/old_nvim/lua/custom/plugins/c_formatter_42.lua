return {
	{
		"cacharle/c_formatter_42.vim",
		ft = { "c", "h" },
		config = function()
			-- Create an autocommand group
			local group = vim.api.nvim_create_augroup("CFormatterGroup", { clear = true })

			-- Autocommand to run :CFormatter42 on saving .c and .h files
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = group,
				pattern = { "*.c", "*.h" }, -- Match .c and .h files
				callback = function()
					vim.cmd("CFormatter42") -- Run CFormatter42
				end,
			})
		end,
	},
}
