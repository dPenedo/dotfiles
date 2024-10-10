-- Buen contraste, pero los colores más o menos

return {
  'miikanissi/modus-themes.nvim',
  priority = 1000,
  opts = {
    transparent = true, -- Transparent background (as supported by the terminal)

    on_colors = function(colors)
      colors.magenta_intense = '#73B5A4'
    end,
  },
}
