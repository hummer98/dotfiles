" for NeoBundle ------------------------
set nocompatible
if has('vim_starting')
  if filereadable(expand('$HOME/.vim/neobundle/neobundle.vim/autoload/neobundle.vim'))
    set rtp+=$HOME/.vim/neobundle/neobundle.vim
  elseif filereadable(expand('$HOME/.vim/neobundle.vim/autoload/neobundle.vim'))
    set rtp+=$HOME/.vim/neobundle.vim
  endif

  call neobundle#begin(expand('$HOME/.vim/neobundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" from github
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc.vim', {'build': {'mac': 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/unite-tag'
NeoBundleLazy 'Yggdroot/indentLine', {"autoload": {"filetypes": ['html']}}
NeoBundleLazy 'derekwyatt/vim-scala.git', {"autoload": {"filetypes": ['scala']}}
NeoBundleLazy 'itchyny/dictionary.vim'
NeoBundleLazy 'taku-o/vim-catn'
NeoBundleLazy 'tpope/vim-rails',{"autoload": {"filetypes": ['html', 'eruby']}}
NeoBundleLazy 'tyru/capture.vim'
NeoBundleLazy 'yuzuemon/emmet-vim', {"autoload": {"filetypes": ['html', 'eruby', 'php']}}

" from vim-scripts repository
NeoBundle 'Align'
NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck
