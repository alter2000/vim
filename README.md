# Yet another Vim config

I've been careful to not step out of Vim's own file structure, but might have
overdone it with plugin settings. Function definitions in autoload, commands in
`plugin/commands.vim`, statusline in `plugin/status.vim`, keybindings in
`after/plugin/binds.vim`. Some colorschemes in `color/`, an INI plugin in
`pack/`, where the other plugins are. Using submodules, but there's a [list of
plugins](./inpacks.py) too.

**Warning:**  
<kbd>;</kbd> and <kbd>:</kbd> are reversed. Arrow keys are used for aligning
buffers, not moving.
