define [
  'require'
  'backbone.marionette'
  'json!js/tangle.json'
], (require, Marionette, config) ->

  App = new Marionette.Application

  App.on 'start', (options) ->
    App.logger.info 'Your application has started!'

  require _.toArray(config.initializers), (initializers...) ->
    _.each initializers, (init) -> App.addInitializer init

    _.each config.modules, (dep, name) ->
      require [dep], (mod) -> App.module name, mod

    App.start()

  return App
