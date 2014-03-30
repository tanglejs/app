define [
  'require'
  'backbone.marionette'
  'js/initializers/index'
  'js/modules/core/index'
], (require, Marionette, init) ->

  App = new Marionette.Application

  App.addInitializer init.logger

  App.on 'start', (options) ->
    App.logger.info 'Your application has started!'

  return App
