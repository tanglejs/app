#!/usr/bin/env coffee
require 'coffee-script/register'

path = require 'path'

exports.command =
  description: 'Tools for working with tangle apps'
  arguments: null # Optional arguments string to display

if require.main is module
  require path.join(__dirname, '..', 'index.coffee')
