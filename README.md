<div align="center">
  <h1>Neovim modular configuration using lua</h1>
</div>

## Features

- Use the new Features of NeoVim 0.7.0
- NeoVim as Python IDE with only the significant things
- Modular configuration (you could use different files to allocated your configurations)
- Configuration by file type using lua

## Motivations

By years, I used VSCode and IntelliJ IDEA as my principal IDE to software development, but both have wonderful things that the other doesn't have.
- VSCode have an excellent performance (not better of neovim in console), a good and freandly user integration with git, and really easy way to change behaviors and configurations.
- IntelliJ IDEA have an excellent refactor tools.

In my case, I couldn't achieve to:

- Use custom code formatters in IntelliJ IDEA in native way.
- Use specific tools like pipenv without need to pay for the premium version and could avoid error messages with the external imports and could check the code of these libraries.
- Have a similar fast way of VSCode to change between projects.

In the other hand:

- Not is possible to have a good experience making refactors in VSCode (not similar to use IntelliJ IDEA).
- Have a fast way to move between files, like as Idea.

Try to use one or other depend on my current task is hard because I really like to use the keybinding to features access and need to learn two keybinding for the same action in both ides is not viable.

And the principal reason, yes, exists plugins in both to use vim, but, vim is vim.

## Requirements

- **Neovim 0.7.0 or later** (the latest [nightly](https://github.com/neovim/neovim#install-from-source) recommended)
- [Packer](https://github.com/wbthomason/packer.nvim)

## Quick start

To use this neovim configuration, you only need to clone the repository in local and create a direct symbolic link of this repo with the neovim configuration folder in your local.

In this case, I will clone the repo in a "Repos" folder in my principal root
(you can change to your prefer location) and create a symbolic link with my
config folder for neovim.

```bash
mkdir ~/Repos && cd ~/Repos
git clone https://github.com/carloseguevara/nvim_conf.git

ln -s ~/Repos/nvim_conf ~/.config/nvim
```

# References

- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
    A basic documentation of how to use lua to configure neovim.
- https://www.lunarvim.org/configuration/01-settings.html#example-options
    Strongly recommended as references to find out the more important neovim configurations using lua.

<div align="center" id="madewithlua">

[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blue.svg?style=for-the-badge&logo=lua)](#madewithlua)

</div>
