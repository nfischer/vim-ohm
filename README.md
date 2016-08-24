# Vim-Ohm

Vim syntax highlighting for [Ohm grammars](https://github.com/cdglabs/ohm)!

![Vim screen shot](https://i.imgur.com/4622lKb.png "Ohm in technicolor!")

## About

This contains the vim syntax file for `.ohm` files.

Like it? Let me know by giving it a star on Github. This is still under active
development, so if you find any bugs or have any feature requests, please let me
know by [filing an issue](https://github.com/nfischer/vim-ohm/issues/new) and
I'll deal with it quickly.

## What is Ohm?

Ohm is a language for prototyping programming languages. Check out the project
[on Github](https://github.com/cdglabs/ohm)

## Installation

### Using [vim-plug](https://github.com/junegunn/vim-plug) (recommended)

Put the following lines in your `vimrc` file:

```Vim
Plug 'nfischer/vim-ohm'

syntax on
set background=dark " recommended for terminals with a dark background
```

## Helper commands

This plugin now provides some helper commands for navigating around the files
(inspired by [vim-go](https://github.com/fatih/vim-go)). You can find
documentation on these commands and mappings from within vim by using `:help
vim-ohm`.
