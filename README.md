# SeparateRecords' dotfiles

Managed with [chezmoi](https://chezmoi.io). All my other shell configuration is managed with [Fig](https://fig.io)'s dotfiles feature.

This repo mostly contains [my NeoVim configuration](dot_config/nvim/init.vim). It has some interesting snippets and makes for a much more sane experience. This includes:

#### Visibile whitespace that makes sense and isn't distracting

<img width="732" alt="NeoVim showing leading and trailing whitespace" src="https://user-images.githubusercontent.com/52195359/164973890-7b9a2a30-9785-4bd5-9f73-3df239bcaef7.png">

#### Changing iTerm's background when entering NeoVim

https://user-images.githubusercontent.com/52195359/164973651-853eee8e-2f17-4a31-8b00-58b8c6641be5.mov

#### Wrapped text looks good

<img width="617" alt="NeoVim open with lorem ipsum text, showing line breaks" src="https://user-images.githubusercontent.com/52195359/164973765-f9f01c6d-e79d-429d-aec2-9bf7abc7ad56.png">

#### Tree-style browsing with Vim's default browser, netrw

  <img width="734" alt="NeoVim showing netrw with tree-style browsing" src="https://user-images.githubusercontent.com/52195359/164973810-107e5d79-d260-49c4-8665-1a43b523ee35.png">

#### ... and some less flashy features!

- Delete a buffer without deleting the pane
- Keybinding to delete a buffer without closing the pane
- <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> move by visual line, which works better with text wrapping. _Unless_ you use a count, in which case they move by file line. Sounds weird, but trust me, this is better.
- Create intermediate directories on file save (you can just run `nvim path/to/new/file.txt` and save without worrying)

#### ... and also some unpopular decisions!

- `hidden` is not set. Setting `hidden` means that unused buffers are not abandoned, they're just... hidden. I'll leave it up to you to reason about why this is suboptimal. It's not awful, but there's a reason it's not set by default in Regular Vim.
