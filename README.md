# Dianciemacs

Dianciemacs is a minimal and elegant Emacs distribution for those who prefer simplicity and aesthetics.

The current default theme used is a custom theme called [hazakura](https://github.com/devraza/hazakura-emacs).
> The interface has been designed to work with this theme, so be careful when making changes!

Internal modules such as keybinds, macros, etc. are named with `diancite` for simplicity and readability.

## Prerequisites

Dianciemacs requires the following prerequisits to be installed or run:

- Git `2.38+`
- Emacs `28.2+`

## Installation

To install Dianciemacs, first clone the repository to your appropriate Emacs directory - generally `~/.emacs.d` for Linux and macOS - alternatively, `$XDG_CONFIG_HOME/emacs` may also be used (typically `~/.config/emacs`)

```
git clone https://github.com/devraza/dianciemacs ~/.emacs.d
```

## Configuration

If you wish to make your changes to the default configuration, simply make any desired changes to the the `init.el` file in the `user/` directory - this directory is (as implied by its name) reserved for user configuration, so feel free to add any extra files.

## Development

Dianciemacs, as of the time of writing, works well as an Emacs configuration - but that's about it. Feature-parity with other Emacs configuration *frameworks* is planned, but, truth be told, it's abysmal right now. I recommend you give this config a try nevertheless.

This project will definitely undergo several (likely **breaking**) changes as it matures - something you should note if you're using Dianciemacs.

### Roadmap

The following list contains the major features which are yet to be implemented:

- [ ] Configuration macros (such as `package!` or `hook!`)
- [ ] Command-line tool to manage configuration
- [X] User configuration in a user directory - `user/`

## Contribution

Contributions are very welcome! Honestly speaking, I don't know all there is to know about Emacs/lisp, so if you want a cool feature (that I may or may not have on the roadmap) and have the e-lisp proficiency, I'll happily consider it.

