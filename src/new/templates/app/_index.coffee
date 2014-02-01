define [
  'require',
  'backbone.marionette',
  'js/initializers/index',
  'js/modules/core/index'
], (require, Marionette, init) ->

  App = new Marionette.Application

  App.addInitializer init.logger

  App.module 'Core', require('js/modules/core/index')

  App.on 'start', (options) ->
    App.log.info 'App started. Do routing and stuff?'

  return App
