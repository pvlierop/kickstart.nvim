if exists("g:neovide")
	" Allow copy paste in neovim
	let g:neovide_input_use_logo = 1

	map <D-v> "+p<CR>
	map! <D-v> <C-R>+
	tmap <D-v> <C-R>+
	vmap <D-c> "+y<CR>

	let g:neovide_scale_factor=1.0
	function! ChangeScaleFactor(delta)
			let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
	endfunction
	function! DefaultScaleFactor()
		let g:neovide_scale_factor=1.0
	endfunction

	nnoremap <expr><C-=> ChangeScaleFactor(1.10)
	nnoremap <expr><C--> ChangeScaleFactor(1/1.10)
	nnoremap <expr><C-0> DefaultScaleFactor() 
	let g:neovide_transparency=1.0


"	let g:neovide_cursor_antialiasing=v:true
"	let g:neovide_cursor_vfx_mode = "wireframe"
	let g:neovide_cursor_vfx_mode = "pixiedust"
	let g:neovide_cursor_vfx_particle_density = 15.0	
	let g:neovide_cursor_vfx_opacity = 200.0
	let g:neovide_cursor_vfx_particle_speed = 20.0

endif
