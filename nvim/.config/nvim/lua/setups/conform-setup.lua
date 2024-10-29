require('conform').setup {
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'black' },
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    jsx = { 'prettier' },
    json = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    -- Puedes añadir más lenguajes y formateadores según sea necesario
  },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

-- Autocomando para deshabilitar el formateo LSP
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp', { clear = true }),
  callback = function(args)
    -- Deshabilitar el formateo LSP
    vim.lsp.buf.formatting_sync = function() end
  end,
})
