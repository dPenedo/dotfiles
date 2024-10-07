require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    python = { 'black' },
    -- Use a sub-list to run only the first available formatter
    javascript = { 'prettierd', '--tab-width=4' },
    javascriptreact = { 'prettierd', '--tab-width=4' },
    typescript = { 'prettierd', '--tab-width=4' },
    jsx = { 'prettierd', '--tab-width=4' },
    html = { 'prettierd' },
    css = { 'prettierd' },
    -- java = { 'jdtls' },
  },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})
-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	group = vim.api.nvim_create_augroup('lsp', { clear = true }),
-- 	callback = function(args)
-- 		-- 2
-- 		vim.api.nvim_create_autocmd('BufWritePre', {
-- 			-- 3
-- 			buffer = args.buf,
-- 			callback = function()
-- 				-- 4 + 5
-- 				vim.lsp.buf.format { async = false, id = args.data.client_id }
-- 			end,
-- 		})
-- 	end,
-- })
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp', { clear = true }),
  callback = function(args)
    -- Deshabilitar el formateo LSP
    vim.lsp.buf.formatting_sync = function() end
  end,
})
