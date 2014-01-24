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
      }
    ];
    return this.prompt(prompts, function(props) {
      _this.app = {
        name: props.name
      };
      return done();
    });
  };

}).call(this);
