# dotfiles

Machine setup and dotfiles for macOS and Zsh.

## Install

Clone the repository, then run:

```sh
./install
```

The installer initializes every submodule, links the tracked configuration,
installs the Brewfile packages, and can be run again safely.

On a new machine, it creates `~/.ssh/id_ed25519` only when no key exists and
prompts for its passphrase. Add `~/.ssh/id_ed25519.pub` to GitHub and any
other services that should accept the workstation key. Private keys and OAuth
credentials are deliberately not tracked here.
