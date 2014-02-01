conf = require('tangle-config').getConf()

module.exports.prompt =  ->
  done = @async()

  prompts = [
    type: 'input'
    name: 'author:name'
    message: 'Your name'
    default: =>
      conf.get 'user:name'
  ,
    type: 'input'
    name: 'author:email'
    message: 'Your email'
    default: =>
      conf.get 'user:email'
  ,
    type: 'input'
    name: 'author:url'
    message: 'Your homepage'
    default: =>
      conf.get 'user:url'
  ,
    type: 'input'
    name: 'author:github'
    message: 'Github username'
    default: =>
      conf.get 'user:github:username'
  ]

  @prompt prompts, (props) =>
    @author =
      name: props['author:name']
      email: props['author:email']
      url: props['author:url']
      github: props['author:github']
    done()
