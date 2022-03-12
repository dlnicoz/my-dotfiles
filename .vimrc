  "Map escape to jj
imap jj <Esc>

" Syntax highlighting
syntax on

" Set FZF Default to Ripgrep (must install ripgrep)
"let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs'
"easy finds files globally
nmap <silent> gff :<C-u>Files ~<CR> 
" Options viewable by using :options
" Set options viewable by using :set all
" Or help for individual configs can be accessed :help <name>
set nocompatible
"set mouse=nicr
"set mouse=a
set statusline=...%{battery#component()}...
set clipboard=unnamedplus
set tabline=...%{battery#component()}...
set noswapfile
set hlsearch
set hls
set showcmd
set autoread
set redrawtime=10000
set background=dark
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set hlsearch
set smartindent
set nu
set ignorecase
set smartcase
set nowrap
set nobackup
set undofile 
set undodir=~/.vim/undordir
set incsearch
set invlist
"shalu
noremap <Leader><Tab><Tab> :set invlist<CR>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

augroup VIMRC
  " this one is which you're most likely to use?
  autocmd BufLeave *.scss,*.css normal! mC
  autocmd BufLeave *.js,*.ts normal! mJ
  autocmd BufLeave *.html, normal! mH
  autocmd BufLeave *.vue, normal! mV
augroup end
"shalu
nmap ,t :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
nmap ,T :terminal<CR>
set relativenumber
"set cursorline
nmap ; 5j
nmap ' 5k
" Column set to column 100
"set colorcolumn=100
" 28 dec update
nmap P "0p
nmap ,P "0P
noremap <leader>w :up<cr>
inoremap <silent> <c-c> <c-c>:call tagalong#Apply()<cr>
" Column color set to grey
highlight ColorColumn ctermbg=NONE

" Plugins
call plug#begin('~/.vim/plugged')
"close tag 
Plug 'alvan/vim-closetag'
Plug  'AndrewRadev/tagalong.vim'
let g:tagalong_filetypes = ['eco', 'eelixir', 'ejs', 'eruby', 'html', 'htmldjango', 'javascriptreact', 'jsx', 'php', 'typescriptreact', 'xml']
let g:tagalong_mappings = [{'c': '_c'}, 'i', 'a']
let g:tagalong_verbose = 1
let g:tagalong_additional_filetypes = ['custom', 'another']
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Make your Vim/Neovim as smart as VSCode

let g:coc_global_extensions = ['coc-prettier', 'coc-tsserver', 'coc-git', 'coc-json',  'coc-tslint', 'coc-tslint-plugin', 'coc-pairs', 'coc-angular', 'coc-highlight', 'coc-html', 'coc-css', 'coc-vetur', 'coc-cssmodules','coc-python', 'coc-snippets', 'coc-yaml', 'coc-tailwindcss', 'coc-react-refactor', 'coc-svelte', 'coc-emmet','coc-eslint']
" color scheme

Plug 'KabbAmine/vCoolor.vim'
let g:vcoolor_map = '<F6>'
Plug 'drewtempelmeyer/palenight.vim'
" Formatter


Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'maxmellon/vim-jsx-pretty'

" framework specific plugins
Plug 'peitalin/vim-jsx-typescript'
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
Plug 'mlaursen/vim-react-snippets'

Plug 'Chiel92/vim-autoformat'
noremap <F5> :Autoformat<CR>

" Comment and uncomment lines
Plug 'preservim/nerdcommenter'
let NERDTreeShowHidden=1
" A light and configurable statusline/tabline plugin for Vim
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_pop'
nnoremap <leader>a <ESC>:AirlineTheme random<CR>
Plug 'vim-airline/vim-airline-themes'
"smarter tabline
Plug 'lambdalisue/battery.vim'
  let g:airline#extensions#battery#enabled = 1
" Directory tree
Plug 'scrooloose/nerdtree'
"{{ File management }}
    Plug 'vifm/vifm.vim'          "vifm
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     "Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      "Icons for Nerdtree
"{{ Productivity }}
    "Plug 'jreybert/vimagit'                            "Magit-like plugin for vim
  
" Visualize undo history tree (in vim undo is not linear)
Plug 'mbbill/undotree'
Plug 'vim-syntastic/syntastic'
" Syntax highlighting for languages
Plug 'sheerun/vim-polyglot'

" Fzf is a general-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" This plugin adds Go language support for Vim, with many features
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python code formatter
"Plug 'ambv/black'
Plug 'honza/vim-snippets'
" Gruvbox color theme
Plug 'morhetz/gruvbox'

" Vim-monokai-tasty color theme
Plug 'patstockwell/vim-monokai-tasty'
 
"css color preview
Plug 'ap/vim-css-color' 
"emmet plugin
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key=','
autocmd FileType vue,html,css,ts,js,ejs,javascriptreact,typescriptreact,svelte EmmetInstall

Plug 'valloric/MatchTagAlways'

call plug#end()
let mapleader = " "
" Maps
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>hk :vsplit ~/.vimrc<cr>
nmap <leader>hj :vsplit <cr>
nmap <leader>hl :sp <cr>
nmap <leader>hh :hide <cr>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>t :NERDTree<cr>
nmap <leader><leader>p :Prettier<cr>
nmap <leader><leader>g :GoFmt<cr>
nmap <leader><leader>b :Black<cr>
nmap <leader><leader>u :UndotreeToggle<cr>
" Files (runs $FZF_DEFAULT_COMMAND if defined)
nmap <leader><leader>f :Files<cr>
nmap <leader><leader><leader>g :GoMetaLinter<cr>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader><leader>c :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <leader><leader>c :call nerdcommenter#Comment(0,"toggle")<CR>
nnoremap mm :bnext<CR>
nnoremap nn :bprevious<CR>

nnoremap .. :bd<CR>
"synatically 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

""""""""""""""""""""""""coc nvim settings start""""""""""""""""""""""""

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

"battery status

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=200

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  
" GoTo code navigation.

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>x  <Plug>(coc-format-selected)
nmap <leader>x  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""coc nvim settings end""""""""""""""""""""""""
"""""""""""""""""""""""""iori"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vifm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"python mapping 
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"imap <F5> <Esc>:w<CR>:!clear;python %<CR>
"remapping by theprimeagen

"5
nnoremap Y y$
"4
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
"3
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
"inoremap [ [<c-g>u
inoremap ? ?<c-g>u
"2
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
"1
vnoremap J :m '>+1<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
nnoremap M :m .-2<CR>==
"nnoremap m :m .+1<CR>==

"airline from chrisatmachine
" enable tabline
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = ''


" enable powerline fonts
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

" Switch to your current theme
"let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
"set noshowmode

"move line by n m
"nmap n :m +1<CR>
"nmap m :m -2<CR>

"airline end
set splitbelow splitright

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <C-Right> :vertical resize +3<CR>
nnoremap <silent> <C-Left> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"set fillchars+=vert:\
set fillchars=""

"terminal 
map <leader>tt :vnew term://bash<CR>
"
"close tag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.xml,*.js,*.tsx)'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,js,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,xml,js,tsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"js
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
"augroup javascript_folding
    "au!
    "au FileType javascript setlocal foldmethod=syntax
"augroup END

"css syntax
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"""""""""""""""""""""""""""""""iori end iori end"""""""""""""""""""""""""""""""""""""""""""
" Set the prettier CLI executable path
let g:prettier#exec_cmd_path = "~/.vim/plugged/vim-prettier/node_modules/prettier"
" Max line length that prettier will wrap on: a number or 'auto'
let g:prettier#config#print_width = 100 " default is 'auto'

" Colorscheme (For gruvbox $TERM env var needs to be xterm-256color)
"autocmd vimenter * ++nested colorscheme vim-monokai-tasty "gruvbox

"autocmd vimenter * ++nested colorscheme gruvbox
colorscheme vim-monokai-tasty
"colorscheme palenight 
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE


