# SeparateRecords' dotfiles

Managed with [chezmoi](https://chezmoi.io). All my other shell configuration is managed with [Fig](https://fig.io)'s dotfiles feature.

This repo mostly contains [my NeoVim configuration](dot_config/nvim/init.vim). It has some interesting snippets and makes for a much more sane experience.

If you're new to Vim, I can _highly_ recommend you check out my config and take some inspiration from it. Each option is documented. But don't just take my word for it, always `:help '<OPTION-NAME>'` so you get a better understanding too.

## NeoVim features

### Changing iTerm's background when entering NeoVim

[See relevant lines](https://github.com/SeparateRecords/dotfiles/blob/f78f6fe84b673e9c4e0bda430bf18520a2dd2bae/dot_config/nvim/init.vim#L1-L14)

This is useful for people (like me) that want a margin between the terminal and the content. Just because it's text-based doesn't mean it can't be pretty.

<details open>
  <summary>Video</summary>
  
https://user-images.githubusercontent.com/52195359/164973651-853eee8e-2f17-4a31-8b00-58b8c6641be5.mov

</details>
  
<details>
  <summary>Compare to iTerm without this feature</summary>
  <img width="500" alt="NeoVim open in iTerm without a changed background, showing how the colors look wrong due to the margin of the terminal window" src="https://user-images.githubusercontent.com/52195359/165003844-08485046-e828-45e9-8815-d0ef175efb59.png">
</details>

---

### Visibile whitespace that makes sense and isn't distracting

[See relevant lines](https://github.com/SeparateRecords/dotfiles/blob/f78f6fe84b673e9c4e0bda430bf18520a2dd2bae/dot_config/nvim/init.vim#L48-L49)

<img width="500" alt="NeoVim showing leading and trailing whitespace" src="https://user-images.githubusercontent.com/52195359/164973890-7b9a2a30-9785-4bd5-9f73-3df239bcaef7.png">

Shows:
- Tabs (an arrow)
- Leading & trailing spaces (tiny dot)
- Non-breakable spaces (fat dot)

---
  
### Wrapped text looks good

[See relevant lines](https://github.com/SeparateRecords/dotfiles/blob/f78f6fe84b673e9c4e0bda430bf18520a2dd2bae/dot_config/nvim/init.vim#L75-L80)

<img width="500" alt="NeoVim open with lorem ipsum text, showing how line wrapping works" src="https://user-images.githubusercontent.com/52195359/164973765-f9f01c6d-e79d-429d-aec2-9bf7abc7ad56.png">

Use soft wrapping without fear. No longer shall your paragraphs be broken on letters!

Vim also understands how to wrap inside a markdown list correctly, but you just have to ask it nicely.

---

### Tree-style browsing with Vim's default browser, netrw

[See relevant lines](https://github.com/SeparateRecords/dotfiles/blob/f78f6fe84b673e9c4e0bda430bf18520a2dd2bae/dot_config/nvim/init.vim#L128-L129)

<img width="500" alt="NeoVim showing netrw with tree-style browsing" src="https://user-images.githubusercontent.com/52195359/164973810-107e5d79-d260-49c4-8665-1a43b523ee35.png">

NERDTree isn't necessary.

---

### ... and some less flashy features!

- Keybinding to delete a buffer without closing the pane. [See relevant lines](https://github.com/SeparateRecords/dotfiles/blob/f78f6fe84b673e9c4e0bda430bf18520a2dd2bae/dot_config/nvim/init.vim#L165-L166)
- <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> move by visual line, which works better with text wrapping. _Unless_ you use a count, in which case they move by file line. Sounds weird, but trust me, this is better. [See relevant lines](https://github.com/SeparateRecords/dotfiles/blob/f78f6fe84b673e9c4e0bda430bf18520a2dd2bae/dot_config/nvim/init.vim#L157-L161)
- Create intermediate directories on file save (you can just run `nvim path/to/new/file.txt` and save without worrying). [See relevant lines](https://github.com/SeparateRecords/dotfiles/blob/f78f6fe84b673e9c4e0bda430bf18520a2dd2bae/dot_config/nvim/init.vim#L177-L180)

### ... and also some unpopular decisions!

- `hidden` is not set. Setting `hidden` means that unused buffers are not abandoned, they're just... hidden. I'll leave it up to you to reason about why this is suboptimal. It's not awful, but there's a reason it's not set by default in Regular Vim.
- `expandtab` is not set. Hard tabs are more accessible. How is this even a debate anymore?
  - If you're working in a project that uses soft tabs, [create a local `.vimrc` / `.nvimrc` / `.exrc`](https://github.com/ii14/exrc.vim) and put `set et` in it.

## There's more!

Not _everything_ in this repo is vim stuff. Just most of it. Check out:

### My minimal prompt, featuring pinning

https://user-images.githubusercontent.com/52195359/165003709-f77a7201-4605-4d2e-ad1f-2a6da918a6bc.mov

Now you can guarantee the location of your prompt. No more having to look for the caret. This can also be disabled and re-enabled.

This functionality will be added to [brendanfalk/pin-prompt](https://github.com/brendanfalk/pin-prompt).
