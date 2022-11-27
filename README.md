# Dianciemacs

Dianciemacs is a minimal and elegant Emacs distribution for those who prefer simplicity and aesthetics.

Internal modules such as keybinds, macros, etc. are named with `diancite` for simplicity and readability.

## Prerequisites

Dianciemacs requires the following prerequisits to be installed or run:

- Git `2.38+`
- Emacs `28.2+`

## Installation

To install Dianciemacs, first clone the repository to your appropriate Emacs directory - `~/.emacs.d` generally for Linux and macOS.

```
git clone https://github.com/devraza/dianciemacs ~/.emacs.d
```

## Configuration

If you wish to make your changes to the default configuration, simply make any changes to the the `init.el` file in the `user/` directory - this directory is reserved completely to users, so feel free to add any extra files.

## Development

Dianciemacs is currently walking it's first steps. As such, there's a lot of functionality it doesn't have that most Emacs configuration frameworks do.

This project will definitely undergo several (possibly **breaking**) changes as it matures - something you should note if you're considering using Dianciemacs.

### Roadmap

The following list contains the features which are yet to be implemented:

- Dashboard with icon
- Configuration macros (such as `package!` or `hook!`)
- Command-line tool to manage configuration
- User configuration in a user directory (something like `~/.diancite.d`)

## Contribution

Contributions are very welcome! I don't know much about Emacs lisp, so if you want a cool feature (that I may or may not have on the roadmap) and have the e-lisp proficiency, I'll happily accept it.

