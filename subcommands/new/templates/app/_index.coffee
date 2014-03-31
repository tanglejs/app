define [
  'require'
  'backbone.marionette'
  'js/initializers/index'
#  'js/modules/core/index'
], (require, Marionette, initializers) ->

  App = new Marionette.Application

  _.each initializers, (fn, name) -> App.addInitializer fn

  App.on 'start', (options) ->
    App.logger.info 'Your application has started!'

  return App
