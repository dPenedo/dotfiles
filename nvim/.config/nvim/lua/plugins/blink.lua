return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "Kaiser-Yang/blink-cmp-dictionary",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
      list = { selection = { preselect = false } },
      --
    },
    sources = {
      -- Add 'dictionary' to the list
      default = { "dictionary", "lsp", "path", "buffer" },
      providers = {
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dict",
          -- Make sure this is at least 2.
          -- 3 is recommended
          min_keyword_length = 3,
          opts = {
            -- options for blink-cmp-dictionary
            dictionary_directories = function()
              if vim.bo.filetype == "markdown" then
                -- return { vim.fn.expand("~/.config/nvim/dictionary/") }
                -- return { vim.fn.expand("~/.config/nvim/dictionary/") }
                return {}
              else
                return {}
              end
            end,
          },
        },
      },
    },
  },
}
