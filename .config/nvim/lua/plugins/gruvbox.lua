return {
  {
    "sainnhe/gruvbox-material",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_visual = "red background"
      vim.g.gruvbox_material_ui_contrast = "hight"
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_show_eob = 0
      vim.g.gruvbox_material_statusline_style = "default"
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
      styles = {
        keyword = {
          bold = true,
        },
      },
    },
  },
}
