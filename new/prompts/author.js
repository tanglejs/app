(function() {
  var conf;

  conf = require('tangle-config').getConf();

  module.exports.prompt = function() {
    var done, prompts;
    done = this.async();
    prompts = [
      {
        type: 'input',
        name: 'author:name',
        message: 'Your name',
        "default": (function(_this) {
          return function() {
            return conf.get('user:name');
          };
        })(this)
      }, {
        type: 'input',
        name: 'author:email',
        message: 'Your email',
        "default": (function(_this) {
          return function() {
            return conf.get('user:email');
          };
        })(this)
      }, {
        type: 'input',
        name: 'author:url',
        message: 'Your homepage',
        "default": (function(_this) {
          return function() {
            return conf.get('user:url');
          };
        })(this)
      }, {
        type: 'input',
        name: 'author:github',
        message: 'Github username',
        "default": (function(_this) {
          return function() {
            return conf.get('user:github:username');
          };
        })(this)
      }
    ];
    return this.prompt(prompts, (function(_this) {
      return function(props) {
        _this.author = {
          name: props['author:name'],
          email: props['author:email'],
          url: props['author:url'],
          github: props['author:github']
        };
        return done();
      };
    })(this));
  };

}).call(this);
