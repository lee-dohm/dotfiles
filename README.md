# Lee's Dotfile Customizations

These are my extensions to the [Thoughtbot dotfiles project](https://github.com/thoughtbot/dotfiles). They coexist with the Thoughtbot configuration files wherever possible. Where coexistence isn't possible, like with the `.gitignore` configuration, this project is designed to clobber Thoughtbot's configuration file.

This is intended to replace my [environment project](https://github.com/lee-dohm/environment).

## Prerequisites

* Install [Laptop](https://github.com/thoughtbot/laptop)

## Installation

Since I'm using the Thoughtbot dotfiles as a basis and keeping my customizations separate, this is a little more complicated than perhaps it should be.

1. Clone the Thoughtbot dotfiles:

    ```bash
    $ git clone git://github.com/lee-dohm/thoughtbot-dotfiles.git thoughtbot-dotfiles
    ```

1. Clone this project:

    ```bash
    $ git clone git@github.com:lee-dohm/dotfiles.git personal-dotfiles
    ```

1. Install the dotfiles (this has to be done in two steps currently due to a bug in rcm)

    ```bash
    $ rcup -d personal-dotfiles -x LICENSE.md -x README.md
    $ rcup
    ```

## Copyright

Copyright &copy; 2014 [Lee Dohm](http://www.lee-dohm.com), [Lifted Studios](http://www.liftedstudios.com). See [LICENSE](LICENSE.md) for details.
