# tangle-app-build 

> Build a tangle app

## OVERVIEW


**tangle app build** performs a series of tasks to prepare your app for the browser.

The result of this process can be found under the `build/` directory in your project.


## DEFAULT BEHAVIOR


By default, it will...

  * Clean the build directory
  * Convert your CoffeeScript files to JavaScript
  * Convert your Stylus files to CSS
  * Compile your Jade templates
  * Symlink your `bower_components/` directory
  * Apply your `config.js` and optimize for RequireJS


## ENVIRONMENTS


Some tasks will behave differently depending on your current environment setting.

For example, some output files might be compressed in "production", but prettified
and with source maps in "development".

You can set the environment each time you run the build, such as

    $ environment=production tangle app build

Or you can set it in your project `tangle.json` instead

    $ tangle config -f ./tangle.json -k environment -v production

The default environment is "development".


## TASKS


`tangle app build [task]` will run only the requested task.

Do not assume that all available tasks are included when you run `tangle app build`
without arguments - some extras are included that do not need to be run every build.

For a list of available build tasks, refer to...

  $ tangle app build tasks


