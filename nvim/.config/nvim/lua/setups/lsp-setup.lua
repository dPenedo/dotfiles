-- [[ Configure LSP ]]
local function map(mode, key, value, options, bufnr)
  -- Si se especifica un buffer, añadir la opción del buffer
  if bufnr then
    options = vim.tbl_extend('force', options or {}, { buffer = bufnr })
  end
  vim.keymap.set(mode, key, value, options or { silent = true })
end

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

-- Esta función se ejecuta cuando un LSP se conecta a un buffer particular
local on_attach = function(_, bufnr)
  -- Mapeos específicos del LSP
  map('n', '<leader>R', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame' }, bufnr)
  map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'LSP: [R]e[n]ame' }, bufnr)
  map('n', 'gd', ':Tele lsp_definitions<CR>', { desc = 'LSP: [G]oto [D]efinition' }, bufnr)
  map('n', 'gI', require('telescope.builtin').lsp_implementations, { desc = 'LSP: [G]oto [I]mplementation' }, bufnr)
  map('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, { desc = 'LSP: Type [D]efinition' }, bufnr)
  map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = 'LSP: [D]ocument [S]ymbols' }, bufnr)
  map('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover Documentation' }, bufnr)
  map('n', '<M-k>', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Documentation' }, bufnr)
  map('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: [G]oto [D]eclaration' }, bufnr)

  -- Mapeos para diagnósticos
  map('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'LSP: Abrir mensaje de diagnóstico flotante' }, bufnr)
  map('n', ']d', diagnostic_goto(true), { desc = 'LSP: Next Diagnostic' }, bufnr)
  map('n', '[d', diagnostic_goto(false), { desc = 'LSP: Prev Diagnostic' }, bufnr)
  map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'LSP: Next Error' }, bufnr)
  map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'LSP: Prev Error' }, bufnr)
  map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'LSP: Next Warning' }, bufnr)
  map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'LSP: Prev Warning' }, bufnr)
  map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'LSP: Abrir lista de diagnósticos' }, bufnr)

  -- Comando local para formatear buffer con LSP
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Configuración de Mason y Mason-LSPconfig
require('mason').setup()
require('mason-lspconfig').setup()

-- Servidores LSP que queremos activar
local servers = {
  pyright = {},
  -- jdtls = {},
  ts_ls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },

    diagnostics = { globals = { 'vim' } },
  },
}

-- Habilidades adicionales para autocompletado
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Asegurar que los servidores anteriores están instalados
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

if server_name == 'tsserver' then
  server_name = 'ts_ls'
end

-- Configurar los servidores
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
