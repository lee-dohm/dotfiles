# Lee's Dotfile Customizations

These are my myriad [dotfiles](http://dotfiles.github.io/). It has grown, morphed, shifted and developed since I discovered the [Thoughtbot dotfiles project](https://github.com/thoughtbot/dotfiles) and based this off of that. Hats off to the Thoughtbot folks for making basing my stuff off of theirs so easy! :laughing:

## Prerequisites

* Install [Thoughtbot Laptop](https://github.com/thoughtbot/laptop)

## Installation

1. Clone this project:

    ```bash
    $ git clone git@github.com:lee-dohm/dotfiles.git personal-dotfiles
    ```

1. Install the dotfiles

    ```bash
    $ rcup -d personal-dotfiles
    ```

1. Create a symlink for the `packages` directory so Atom stylesheet stuff works correctly

    ```bash
    $ ln -s ~/.atom/packages ~/personal-dotfiles/atom/packages
    ```

## Copyright

Copyright &copy; 2014-2015 [Lee Dohm](http://www.lee-dohm.com), [Lifted Studios](http://www.liftedstudios.com). See [LICENSE](LICENSE.md) for details.
