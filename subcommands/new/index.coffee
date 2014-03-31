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
      @installDependencies
        bower: true
        npm: true

AppGenerator::appPrompts = require('./prompts/app').prompt
AppGenerator::authorPrompts = require('./prompts/author').prompt

AppGenerator::copyFiles = ->
  @mkdir 'build'
  @mkdir 'tests'
  @mkdir 'bower_components'
  @mkdir 'node_modules'
  @copy 'gitignore', '.gitignore'
  @copy '_bower.json', 'bower.json'
  @copy '_bowerrc', '.bowerrc'
  @copy '_tangle.json', 'tangle.json'
  @copy '_config.js', 'config.js'
  @copy '_package.json', 'package.json'

AppGenerator::createAppRoot = ->
  @mkdir 'app'
  @mkdir 'app/initializers'
  @mkdir 'app/modules'
  @mkdir 'app/primitives'
  @mkdir 'app/styl'
  @copy 'app/initializers/_index.coffee', 'app/initializers/index.coffee'
  @copy 'app/initializers/_logger.coffee', 'app/initializers/logger.coffee'
  @copy 'app/styl/_app.styl', 'app/styl/app.styl'
  @copy 'app/_index.coffee', 'app/index.coffee'
  @copy 'app/_index.jade', 'app/index.jade'
  @copy 'app/_main.coffee', 'app/main.coffee'
  @copy 'app/_tangle.json', 'app/tangle.json'
