util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'

module.exports = class AppGenerator extends yeoman.generators.Base
  constructor: (args, options, config) ->
    super(args, options, config)
    @args = args
    @options = options

    @sourceRoot path.join __dirname, 'templates'

    @on 'end', ->
      console.log "Next steps...\n"

    @pkg = JSON.parse(@readFileAsString(path.join(__dirname, '../package.json')))

AppGenerator::appPrompts = require('./prompts/app').prompt

AppGenerator::copyFiles = ->
  @mkdir 'app'
  @mkdir 'build'
  @mkdir 'tests'
  @copy 'gitignore', '.gitignore'
