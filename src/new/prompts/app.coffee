path = require 'path'

module.exports.prompt =  ->
  done = @async()

  prompts = [
    type: 'input'
    name: 'app:name'
    message: 'App name'
    default: =>
      path.basename( process.cwd() )
  ,
    type: 'input'
    name: 'app:version'
    message: 'Current version'
    default: '0.0.0'
  ,
    type: 'input'
    name: 'app:description'
    message: 'Description'
  ,
    type: 'input'
    name: 'app:homepage'
    message: 'Homepage'
  ,
    type: 'confirm'
    name: 'app:isPrivate'
    message: 'Mark this package as private?'
    default: true
  ]

  @prompt prompts, (props) =>
    @app =
      name: props['app:name']
      version: props['app:version']
      description: props['app:description']
      homepage: props['app:homepage']
      isPrivate: props['app:isPrivate']
    done()
