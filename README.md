# tangle-app

> Tools for working with tangle apps

[![Travis Build Status](https://secure.travis-ci.org/tanglejs/app.png?branch=master)](http://travis-ci.org/tanglejs/app)
[![Dependency Status](https://david-dm.org/tanglejs/app.png)](https://david-dm.org/tanglejs/app)
[![devDependency Status](https://david-dm.org/tanglejs/app/dev-status.png)](https://david-dm.org/tanglejs/app#info=devDependencies)

[![NPM](https://nodei.co/npm/tangle-app.png?downloads=true)](https://nodei.co/npm/tangle-app/)

## Overview

[tangle](https://github.com/tanglejs/tangle) is a set of tools
for building web applications.

`tangle-app` implements the `app` subcommand for
[tangle](https://github.com/tanglejs/tangle).


## Usage

    --option, -o [String] - An example option.
    --help, -h - Display this message


## Examples

    # Executing app with no options
    $ tangle-app


## Contributing

To rebuild & run the tests

    $ git clone https://github.com/tanglejs/app.git
    $ cd app
    $ npm install
    $ grunt test

You can use `grunt watch` to automatically rebuild and run the test suite when
files are changed.

Use `npm link` from the project directory to tell `tangle` to use
your modified `app` during development.

To contribute back, fork the repo and open a pull request with your changes.


## License

Copyright (c) 2014 Logan Koester
Licensed under the MIT license.


