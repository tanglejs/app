(function() {
  var path;

  path = require('path');

  module.exports.prompt = function() {
    var done, prompts,
      _this = this;
    done = this.async();
    prompts = [
      {
        type: 'input',
        name: 'app:name',
        message: 'App name',
        "default": function() {
          return path.basename(process.cwd());
        }
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
    return this.prompt(prompts, function(props) {
      _this.app = {
        name: props['app:name'],
        version: props['app:version'],
        description: props['app:description'],
        homepage: props['app:homepage'],
        isPrivate: props['app:isPrivate']
      };
      return done();
    });
  };

}).call(this);
