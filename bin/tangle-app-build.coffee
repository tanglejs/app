#!/usr/bin/env coffee

tangleUtil = require 'tangle-util'

exports.command =
  description: 'Build a tangle app'

if require.main is module
  path = require 'path'
  grunt = require 'grunt'

  grunt.help.display = ->
    tangleUtil.help.showLocalMan(
      path.join(
        __dirname, '..', 'man', 'tangle-app-build.1'))

  grunt.cli
    gruntfile: path.join(__dirname, '..', 'subcommands', 'build', 'index.coffee')
    base: process.cwd()
