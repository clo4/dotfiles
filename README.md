# SeparateRecords' dotfiles

Managed with [chezmoi](https://chezmoi.io). All my other shell configuration is managed with [Fig](https://fig.io)'s dotfiles feature.

This repo mostly contains [my NeoVim configuration](dot_config/nvim/init.vim). It has some interesting snippets and makes for a much more sane experience.

## NeoVim features

#### Changing iTerm's background when entering NeoVim

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

#### Visibile whitespace that makes sense and isn't distracting

Shows:
- Tabs (an arrow)
- Leading & trailing spaces (tiny dot)
- Non-breakable spaces (fat dot)

<details>
  <summary>Screenshot</summary>
  <img width="500" alt="NeoVim showing leading and trailing whitespace" src="https://user-images.githubusercontent.com/52195359/164973890-7b9a2a30-9785-4bd5-9f73-3df239bcaef7.png">
</details>

---
  
#### Wrapped text looks good

Use soft wrapping without fear. No longer will your paragraphs be broken on letters. Vim also understands how to wrap inside a markdown list correctly, but you just have to ask it nicely.

<details>
  <summary>Screenshot</summary>
  <img width="617" alt="NeoVim open with lorem ipsum text, showing how line wrapping works" src="https://user-images.githubusercontent.com/52195359/164973765-f9f01c6d-e79d-429d-aec2-9bf7abc7ad56.png">
</details>

---

#### Tree-style browsing with Vim's default browser, netrw

NERDTree isn't necessary.

<details>
  <summary>Screenshot</summary>
  <img width="734" alt="NeoVim showing netrw with tree-style browsing" src="https://user-images.githubusercontent.com/52195359/164973810-107e5d79-d260-49c4-8665-1a43b523ee35.png">
</details>

---

#### ... and some less flashy features!

- Delete a buffer without deleting the pane
- Keybinding to delete a buffer without closing the pane
- <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> move by visual line, which works better with text wrapping. _Unless_ you use a count, in which case they move by file line. Sounds weird, but trust me, this is better.
- Create intermediate directories on file save (you can just run `nvim path/to/new/file.txt` and save without worrying)

#### ... and also some unpopular decisions!

- `hidden` is not set. Setting `hidden` means that unused buffers are not abandoned, they're just... hidden. I'll leave it up to you to reason about why this is suboptimal. It's not awful, but there's a reason it's not set by default in Regular Vim.

## There's more!

Not _everything_ in this repo is vim stuff. Just most of it. Check out:

#### Minimal prompt, featuring location pinning

Now you can guarantee the location of your prompt. No more having to look for the caret. This can also be disabled and re-enabled.

https://user-images.githubusercontent.com/52195359/165003709-f77a7201-4605-4d2e-ad1f-2a6da918a6bc.mov

This functionality will be added to [brendanfalk/pin-prompt](https://github.com/brendanfalk/pin-prompt).

