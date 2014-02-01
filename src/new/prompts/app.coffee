path = require 'path'

module.exports.prompt =  ->
  done = @async()

  prompts = [
    type: 'input'
    name: 'name'
    message: 'App name'
    default: =>
      path.basename( process.cwd() )
  ,
    type: 'input'
    name: 'version'
    message: 'Current version'
    default: '0.0.0'
  ,
    type: 'input'
    name: 'description'
    message: 'Description'
  ,
    type: 'input'
    name: 'homepage'
    message: 'Homepage'
  ,
    type: 'confirm'
    name: 'isPrivate'
    message: 'Mark this package as private?'
    default: true
  ]

  @prompt prompts, (props) =>
    @app =
      name: props.name
      version: props.version
      description: props.description
      homepage: props.homepage
      isPrivate: props.isPrivate
    done()
