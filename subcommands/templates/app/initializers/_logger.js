(function() {
  define(['loglevel'], function(loglevel) {
    var initializer;
    return initializer = function(options) {
      this.logger = loglevel;
      return this.logger.setLevel(build.environment === 'development' ? 'trace' : 'warn');
    };
  });

}).call(this);
