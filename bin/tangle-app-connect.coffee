#!/usr/bin/env coffee

tangleUtil = require 'tangle-util'

exports.command =
  description: 'Start a webserver'

if require.main is module
  path = require 'path'
  grunt = require 'grunt'

  grunt.help.display = ->
    tangleUtil.help.showLocalMan(
      path.join(
        __dirname, '..', 'man', 'tangle-app-connect.1'))

  grunt.cli
    gruntfile: path.join(__dirname, '..', 'subcommands', 'connect', 'index.coffee')
    base: process.cwd()
