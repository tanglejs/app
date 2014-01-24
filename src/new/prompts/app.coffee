path = require 'path'

module.exports.prompt =  ->
  done = @async()

  prompts = [
    type: 'input'
    name: 'name'
    message: 'App name'
    default: =>
      path.basename( process.cwd() )
  ]

  @prompt prompts, (props) =>
    @app =
      name: props.name
    done()
