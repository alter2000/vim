# Yet another Vim config

I've been careful to not step out of Vim's own file structure, but might have
overdone it with plugin settings. Function definitions in autoload, commands in
`plugin/commands.vim`, statusline in `plugin/status.vim`, keybindings in
`after/plugin/binds.vim`. Some colorschemes in `color/`, an INI plugin in
`pack/`, where the others will go once I get some extra time, and a shitload of
overtyped `set`.

This config covers all my use cases: programming in Python, C, YAML, some HTML
and shell; writing posts, emails, math, etc (English and French).

I mostly use neomutt, but vmail is there for a quick look at school email.

**Warning:**  
<kbd>;</kbd> and <kbd>:</kbd> are reversed. Arrow keys are used for aligning
buffers
