https://github.com/summivox/vim2

## Dependencies

Note: direct links might not be "latest".

* `gVim` : latest
	* Windows: [official installer](http://www.vim.org/download.php#pc)
* `python` : 2.7
	* Recommended distribution: [Anaconda](https://www.continuum.io/downloads)
* `git` : latest
	* Windows: [official `msysgit` installer](https://github.com/git-for-windows/git/releases/download/v2.6.1.windows.1/Git-2.6.1-64-bit.exe)
		* PATH: Use Git from the Windows Command Prompt
		* CrLf: Checkout as-is, commit Unix
* `ctags` : [latest](http://sourceforge.net/projects/ctags/files/ctags/5.8/ctags58.zip/download)

Optional:

* [YouCompleteMe](http://valloric.github.io/YouCompleteMe): *Compiled* plugin; depends on `libclang`
	* Windows: <https://github.com/kirtgoh/vim-ycm-windows> (TODO: non-functional yet)


## Installation

1. Clone this repo:

   ```bash
   git clone  --recursive https://github.com/summivox/vim2 ~/.vim
   ```

2. Windows: run `win.bat` in repo root

3. Fonts: Install all fonts under `_font`

4. open `gvim` then `:PluginInstall`


## Features

(TBD)
