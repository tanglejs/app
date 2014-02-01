(function() {
  define(['require', 'backbone.marionette', 'js/initializers/index', 'js/modules/core/index'], function(require, Marionette, init) {
    var App;
    App = new Marionette.Application;
    App.addInitializer(init.logger);
    App.module('Core', require('js/modules/core/index'));
    App.on('start', function(options) {
      return App.log.info('App started. Do routing and stuff?');
    });
    return App;
  });

}).call(this);
