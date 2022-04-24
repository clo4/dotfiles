# dotfiles

Managed with [chezmoi](https://chezmoi.io). All my other shell configuration is managed with [Fig](https://fig.io)'s dotfiles feature.

This repo mostly contains [my NeoVim configuration](dot_config/nvim/init.vim). It has some interesting snippets and makes for a much more sane experience. Some features:

- Changing iTerm's background when entering NeoVim
- Non-stupid line breaks
- Tree-style browsing with Vim's default browser, netrw
- Delete a buffer without deleting the pane
- Create intermediate directories on file save (you can just run `nvim path/to/new/file.txt` and save without worrying)
