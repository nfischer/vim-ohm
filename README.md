Vim-Ohm
=======

Vim syntax highlighting for [Ohm grammars](https://github.com/pangloss/vim-javascript)!

![Vim screen shot](https://i.imgur.com/4622lKb.png "Ohm in technicolor!")

About
-----

This contains the vim syntax file for `.ohm` files.

What is Ohm?
------------

Ohm is a language for prototyping programming languages. Check out the project
[on Github](https://github.com/cdglabs/ohm)

Installation
------------

### Using Vundle (recommended)

Put the following lines in your `vimrc` file:

```Vim
Plugin 'nfischer/vim-ohm'

syntax on
set background=dark " recommended for terminals with a dark background
```

### Without a plugin manager

 - If on unix, run these commands:

  ```Bash
  $ mkdir -p ~/.vim/syntax ~/.vim/ftdetect
  $ wget https://raw.githubusercontent.com/nfischer/vim-ohm/master/syntax/ohm.vim
  $ mv ohm.vim ~/.vim/syntax
  $ wget https://raw.githubusercontent.com/nfischer/vim-ohm/master/ftdetect/ohm.vim
  $ mv ohm.vim ~/.vim/ftdetect
  ```

 - Otherwise:
    - Download the file `syntax/ohm.vim`. Copy it to the location
      `~/.vim/syntax/ohm.vim`.  If the folders do not already exist, create
      them.
    - Do the same with `ftdetect/ohm.vim` to the location
      `~/.vim/ftdetect/ohm.vim`.
    - Start vim. If you don't see any colors, type `:syntax on` and press enter.
