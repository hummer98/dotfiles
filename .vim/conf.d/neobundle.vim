" for NeoBundle ------------------------
set nocompatible
if has('vim_starting')
  if filereadable(expand('$HOME/dotfiles/.vim/neobundle/neobundle.vim/autoload/neobundle.vim'))
    set rtp+=$HOME/dotfiles/.vim/neobundle/neobundle.vim
  elseif filereadable(expand('$HOME/dotfiles/.vim/neobundle.vim/autoload/neobundle.vim'))
    set rtp+=$HOME/dotfiles/.vim/neobundle.vim
  endif

  call neobundle#rc(expand('$HOME/dotfiles/.vim/neobundle'))
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
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails',{"autoload": {"filetypes": ['html', 'eruby']}}
NeoBundle 'tpope/vim-surround'
NeoBundleLazy 'Yggdroot/indentLine', {"autoload": {"filetypes": ['html']}}
NeoBundleLazy 'itchyny/dictionary.vim'
NeoBundleLazy 'taku-o/vim-catn'
NeoBundleLazy 'tyru/capture.vim'
NeoBundleLazy 'yuzuemon/emmet-vim', {"autoload": {"filetypes": ['html', 'eruby', 'php']}}

" from vim-scripts repository
NeoBundle 'Align'
NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'
NeoBundleLazy 'TwitVim'

filetype plugin indent on
NeoBundleCheck
