conf = require('tangle-config').getConf()

module.exports.prompt =  ->
  done = @async()

  prompts = [
    type: 'input'
    name: 'name'
    message: 'Your name'
    default: =>
      conf.get 'user:name'
  ,
    type: 'input'
    name: 'email'
    message: 'Your email'
    default: =>
      conf.get 'user:email'
  ,
    type: 'input'
    name: 'url'
    message: 'Your homepage'
    default: =>
      conf.get 'user:url'
  ,
    type: 'input'
    name: 'github'
    message: 'Github username'
    default: =>
      conf.get 'user:github:username'
  ]

  @prompt prompts, (props) =>
    @author =
      name: props.name
      email: props.email
      url: props.url
      github: props.github
    done()
