lua require("rwxd")

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>ff :lua require('telescope.builtin').find_files({ no_ignore = true, hidden = true })<CR>
nnoremap <leader>fl <cmd>Telescope file_browser<cr>
nnoremap <leader>fv <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

nnoremap <leader>fgg <cmd>Telescope git_files<cr>
nnoremap <leader>gc :lua require('rwxd.telescope').git_branches()<CR>

nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fd :lua require('rwxd.telescope').search_dotfiles()<CR>
nnoremap <leader>fW :lua require('rwxd.telescope').search_wiki()<CR>
