Vim-Ohm
=======

Ohm syntax highlighting for vim!

![Vim screen shot](https://i.imgur.com/4622lKb.png "Ohm in technicolor!")

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

Put the following lines in your `vimrc` file:

```Vim
Plugin 'nfischer/vim-ohm'
" ...

syntax on
set background=dark " (optional) for better colors against a dark terminal
```

### Without a plugin manager

Download the file `ohm.vim` from the `syntax/` folder. Then copy it into your
folder `~/.vim/syntax`. If this folder does not exist, create it.

If you do not have a `vimrc` file, create it in your home directory:

```Bash
$ touch ~/.vimrc
```

Next, add these lines to your `vimrc`:

```Vim
syntax on
```
