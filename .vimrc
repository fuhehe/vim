
"==========================================
" 基本设置
"==========================================
" 取消备份
set nobackup
set noswapfile

" 文件编码
set encoding=utf-8

" 设置backspace键删除模式
set nocompatible
set backspace=indent,eol,start

" 查找
set ic
set hls
set is




"==========================================
"  显示设置
"==========================================
" 显示行号
set number

" 显示光标当前位置
set ruler

" 设置缩进
set cindent

set tabstop=4
set shiftwidth=4

" 突出显示当前行
set cursorline

" 左下角显示当前 vim 模式
set showmode

" 启动 vim 时关闭折叠代码
set nofoldenable

" 主题
syntax enable
"set background=dark
"colorscheme molokai

set tags=./.tags;,.tags





"==========================================
" vim-plug
"==========================================

call 	plug#begin('~/.vim/plugged')                                                                     





" -----------------------------------------------
" 树形目录
" -----------------------------------------------
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" 
" autocmd vimenter * NERDTree
" map <C-n> :NERDTreeToggle<CR>
" let NERDTreeMinimalUI = 1
" let NERDTreeShowHidden = 1
" 
" let g:nerdtree_tabs_open_on_console_startup = 1
" let g:nerdtree_tabs_focus_on_files = 1
" 
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "✹",
"     \ "Staged"    : "✚",
"     \ "Untracked" : "✭",
"     \ "Renamed"   : "➜",
"     \ "Unmerged"  : "═",
"     \ "Deleted"   : "✖",
"     \ "Dirty"     : "✗",
"     \ "Clean"     : "✔︎",
"     \ 'Ignored'   : '☒',
"     \ "Unknown"   : "?"
"     \ }





" -----------------------------------------------
" 多tab
" -----------------------------------------------
Plug 'fholgado/minibufexpl.vim'

let g:miniBufExplMapWindowNavVim =1
let g:miniBufExplMapWindowNavArrows =1
let g:miniBufExplMapCTabSwitchBufs =1
let g:miniBufExplModSelTarget =1




" -----------------------------------------------
" 代码，引号，路径自动补全
" -----------------------------------------------
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
 
noremap <c-z> <NOP>
 
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }





" -----------------------------------------------
" 语法高亮，检查
" -----------------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

let g:ale_linters = {
\	'javascript': ['eslint'],
\	'css': ['stylelint'],
\}
let g:ale_fixers = {
\	'javascript': ['eslint'],
\	'css': ['stylelint'],
\}
let g:ale_fix_on_save = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▶'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)





" -----------------------------------------------
" 文件，代码搜索，打开最近打开的文件
" -----------------------------------------------
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/mru.vim'

let g:ag_highlight=1
let g:ag_working_path_mode="r"

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|DS_Store|dist|build|coverage)|(\.(git|hg|svn)$)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Window_Height = 15





" -----------------------------------------------
" 加强版状态条
" -----------------------------------------------
Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }





" -----------------------------------------------
" 代码注释
" -----------------------------------------------
Plug 'scrooloose/nerdcommenter'

let g:mapleader = ","
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
			\ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
			\ 'less': { 'left': '/*', 'right': '*/' }
		\ }

let g:NERDAltDelims_javascript = 1
let g:NERDDefaultNesting = 1





" -----------------------------------------------
" git
" -----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'





" -----------------------------------------------
" html5
" -----------------------------------------------
Plug 'othree/html5.vim'





" -----------------------------------------------
" css3
" -----------------------------------------------
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END





" -----------------------------------------------
" JavaScript
" -----------------------------------------------
Plug 'pangloss/vim-javascript'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1





" -----------------------------------------------
" js-beautify
" -----------------------------------------------
Plug 'maksimr/vim-jsbeautify'

autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>





" -----------------------------------------------
" React
" -----------------------------------------------
Plug 'mxw/vim-jsx'

let g:jsx_ext_required = 0





" -----------------------------------------------
" Prettier
" -----------------------------------------------
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync





" -----------------------------------------------
" vim-gutentags
" -----------------------------------------------
Plug 'ludovicchabant/vim-gutentags'

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif





call plug#end()

" PlugInstall
" PlugUpdate
" PlugClean
" PlugUpgrade
" PlugStatus
" PlugDiff
" PlugSnapshot

