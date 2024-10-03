return {
	'sainnhe/gruvbox-material',
	lazy = false,
	config = function()
		vim.cmd [[
	        " https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
	        " Important!!
	        " For dark version.
	        " set background=dark
	        " Set contrast.
	        " This configuration option should be placed before `colorscheme gruvbox-material`.
	        " Available values: 'hard', 'medium'(default), 'soft'
	        let g:gruvbox_material_background = 'hard'
	        let g:gruvbox_material_transparent_background = 1
	        " For better performance
	        let g:gruvbox_material_ui_contrast = 'high'
	        let g:gruvbox_material_better_performance = 1
	        let g:gruvbox_material_enable_italic = 1
	        let  g:gruvbox_material_enable_bold = 1
	        let g:gruvbox_material_diagnostic_text_highlight = 1
	        " let g:gruvbox_material_diagnostic_line_highlight = 1
	        let g:gruvbox_material_diagnostic_virtual_text = "colored"
	        let g:gruvbox_material_sign_column_background = 'none'

	        colorscheme gruvbox-material
	        ]]
	end,
}
