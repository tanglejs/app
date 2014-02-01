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
        name: 'name',
        message: 'App name',
        "default": function() {
          return path.basename(process.cwd());
        }
      }, {
        type: 'input',
        name: 'version',
        message: 'Current version',
        "default": '0.0.0'
      }, {
        type: 'input',
        name: 'description',
        message: 'Description'
      }, {
        type: 'input',
        name: 'homepage',
        message: 'Homepage'
      }, {
        type: 'confirm',
        name: 'isPrivate',
        message: 'Mark this package as private?',
        "default": true
      }
    ];
    return this.prompt(prompts, function(props) {
      _this.app = {
        name: props.name,
        version: props.version,
        description: props.description,
        homepage: props.homepage,
        isPrivate: props.isPrivate
      };
      return done();
    });
  };

}).call(this);
