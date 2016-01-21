Vim-Ohm
=======

Ohm syntax highlighting for vim!

About
-----

This contains the vim syntax file for `.ohm` files.

What is Ohm?
------------

Ohm is a language for prototyping programming languages.

Check out the project [on Github](https://github.com/cdglabs/ohm)

Installation
------------

### Using Vundle (recommended)

Put the following lines in your `.vimrc` file:

```Vim
Plugin 'nfischer/vim-ohm'
" ...

" Use this autocmd to recognize ohm files
augroup Ohm
  autocmd!
  autocmd BufNewFile,BufReadPost *.ohm set filetype=ohm
augroup END

syntax on
```

### Without a plugin manager

First, download the file:

```Bash
$ mkdir -p ~/.vim
$ cd ~/.vim
$ mkdir -p syntax/
$ cd syntax/
$ rm -rf vim-ohm/
$ git clone https://github.com/nfischer/vim-ohm.git
$ ln -s vim-ohm/syntax/ohm.vim ohm.vim
```

And then edit your `.vimrc`:

```Vim
augroup Ohm
  autocmd!
  autocmd BufNewFile,BufReadPost *.ohm set filetype=ohm
augroup END
syntax on
```
