(function() {
  var conf;

  conf = require('tangle-config').getConf();

  module.exports.prompt = function() {
    var done, prompts,
      _this = this;
    done = this.async();
    prompts = [
      {
        type: 'input',
        name: 'author:name',
        message: 'Your name',
        "default": function() {
          return conf.get('user:name');
        }
      }, {
        type: 'input',
        name: 'author:email',
        message: 'Your email',
        "default": function() {
          return conf.get('user:email');
        }
      }, {
        type: 'input',
        name: 'author:url',
        message: 'Your homepage',
        "default": function() {
          return conf.get('user:url');
        }
      }, {
        type: 'input',
        name: 'author:github',
        message: 'Github username',
        "default": function() {
          return conf.get('user:github:username');
        }
      }
    ];
    return this.prompt(prompts, function(props) {
      _this.author = {
        name: props['author:name'],
        email: props['author:email'],
        url: props['author:url'],
        github: props['author:github']
      };
      return done();
    });
  };

}).call(this);
