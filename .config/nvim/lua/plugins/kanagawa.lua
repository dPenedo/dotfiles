return {
  -- add kanagawa
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true, -- do not set background color
      compile = true,
      functionStyle = { bold = true },
      dimInactive = false,
      typeStyle = { bold = true },
      keywordStyle = { bold = true },
      colors = {
        palette = {
          -- fujiWhite = "#F1eed7",
          -- oldWhite = "#F1eed7",
          -- sumiInk3 = "#120309",
          autumnGreen = "#037971",
          -- springGreen = "#9EBC9F",
        },
      },
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
