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
        name: 'name',
        message: 'Your name',
        "default": function() {
          return conf.get('user:name');
        }
      }, {
        type: 'input',
        name: 'email',
        message: 'Your email',
        "default": function() {
          return conf.get('user:email');
        }
      }, {
        type: 'input',
        name: 'url',
        message: 'Your homepage',
        "default": function() {
          return conf.get('user:url');
        }
      }, {
        type: 'input',
        name: 'github',
        message: 'Github username',
        "default": function() {
          return conf.get('user:github:username');
        }
      }
    ];
    return this.prompt(prompts, function(props) {
      _this.author = {
        name: props.name,
        email: props.email,
        url: props.url,
        github: props.github
      };
      return done();
    });
  };

}).call(this);
