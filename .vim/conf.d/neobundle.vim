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
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimproc.vim', {'build': {'mac': 'make -f make_mac.mak', 'unix' : 'make -f make_unix.mak'}}
NeoBundle 'Shougo/vimshell.vim'
NeoBundleLazy 'yuzuemon/jslint.vim', {"autoload": {"filetypes": 'javascript'}}
NeoBundleLazy 'yuzuemon/emmet-vim', {"autoload": {"filetypes": ['html', 'eruby']}}
NeoBundle 'nakatakeshi/jump2pm.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'itchyny/dictionary.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'taku-o/vim-catn'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-rails',{"autoload": {"filetypes": ['html', 'eruby']}}
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/capture.vim'

" from vim-scripts repository
NeoBundle 'taglist.vim'
NeoBundle 'sudo.vim'
NeoBundleLazy 'TwitVim'

filetype plugin indent on
NeoBundleCheck
