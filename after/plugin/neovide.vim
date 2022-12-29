if exists("g:neovide")
	" Allow copy paste in neovim
	let g:neovide_input_use_logo = 1

	map <D-v> "+p<CR>
	map! <D-v> <C-R>+
	tmap <D-v> <C-R>+
	vmap <D-c> "+y<CR>

	let g:neovide_scale_factor = 1.2

	let g:neovide_transparency=0.9
"	let g:neovide_cursor_antialiasing=v:true
"	let g:neovide_cursor_vfx_mode = "wireframe"
	let g:neovide_cursor_vfx_mode = "pixiedust"
	
endif
