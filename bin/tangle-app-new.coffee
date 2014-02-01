#!/usr/bin/env coffee

path = require 'path'
helpers = require('yeoman-generator').test

exports.command =
  description: 'Create a new tangle app'

if require.main is module
  generator = require(path.join(__dirname, '..', 'subcommands', 'new'))
  helpers.createGenerator('tangle:app', [[generator, 'tangle:app']]).run()
