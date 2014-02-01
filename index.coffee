helmsman = require 'helmsman'

cli = helmsman
  localDir: 'bin'
  prefix: 'tangle-app'
  usePath: true

cli.on '--help', ->
  console.log "\ntangle-app - tools for working with tangle apps"
  console.log "\nFor detailed usage, view \"man tangle-app\"."

argv = process.argv

cli.parse(argv)
