require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    -- Conform will run multiple formatters sequentially
    -- python = { "isort", "black" },
    python = { 'black' },
    -- Use a sub-list to run only the first available formatter
    javascript = { { 'prettierd', 'prettier', '--tab-width=4' } },
    typescript = { { 'prettierd', 'prettier', '--tab-width=4' } },
    html = { { 'prettierd', 'prettier' } },
    css = { { 'prettierd', 'prettier' } },
    java = { { 'jdtls' } },
  },
}
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})
