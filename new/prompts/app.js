(function() {
  var path;

  path = require('path');

  module.exports.prompt = function() {
    var done, prompts;
    done = this.async();
    prompts = [
      {
        type: 'input',
        name: 'app:name',
        message: 'App name',
        "default": (function(_this) {
          return function() {
            return path.basename(process.cwd());
          };
        })(this)
      }, {
        type: 'input',
        name: 'app:version',
        message: 'Current version',
        "default": '0.0.0'
      }, {
        type: 'input',
        name: 'app:description',
        message: 'Description'
      }, {
        type: 'input',
        name: 'app:homepage',
        message: 'Homepage'
      }, {
        type: 'confirm',
        name: 'app:isPrivate',
        message: 'Mark this package as private?',
        "default": true
      }
    ];
    return this.prompt(prompts, (function(_this) {
      return function(props) {
        _this.app = {
          name: props['app:name'],
          version: props['app:version'],
          description: props['app:description'],
          homepage: props['app:homepage'],
          isPrivate: props['app:isPrivate']
        };
        return done();
      };
    })(this));
  };

}).call(this);
