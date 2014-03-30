
Some tasks will behave differently depending on your current environment setting.

For example, some output files might be compressed in "production", but prettified
and with source maps in "development".

You can set the environment each time you run the build, such as

    $ environment=production tangle app build

Or you can set it in your project `tangle.json` instead

    $ tangle config -f ./tangle.json -k environment -v production

The default environment is "development".
