(function() {
  var AppGenerator, path, util, yeoman,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  util = require('util');

  path = require('path');

  yeoman = require('yeoman-generator');

  module.exports = AppGenerator = (function(_super) {
    __extends(AppGenerator, _super);

    function AppGenerator(args, options, config) {
      AppGenerator.__super__.constructor.call(this, args, options, config);
      this.args = args;
      this.options = options;
      this.sourceRoot(path.join(__dirname, 'templates'));
      this.on('end', function() {
        console.log("Next steps...\n");
        return this.installDependencies({
          bower: true,
          npm: true
        });
      });
      this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
    }

    return AppGenerator;

  })(yeoman.generators.Base);

  AppGenerator.prototype.appPrompts = require('./prompts/app').prompt;

  AppGenerator.prototype.authorPrompts = require('./prompts/author').prompt;

  AppGenerator.prototype.copyFiles = function() {
    this.mkdir('build');
    this.mkdir('tests');
    this.mkdir('bower_components');
    this.mkdir('node_modules');
    this.copy('gitignore', '.gitignore');
    this.copy('_bower.json', 'bower.json');
    this.copy('_config.js', 'config.js');
    return this.copy('_package.json', 'package.json');
  };

  AppGenerator.prototype.createAppRoot = function() {
    this.mkdir('app');
    this.mkdir('app/initializers');
    this.mkdir('app/modules');
    this.mkdir('app/primitives');
    this.mkdir('app/styl');
    this.copy('app/initializers/_index.coffee', 'app/initializers/index.coffee');
    this.copy('app/initializers/_logger.coffee', 'app/initializers/logger.coffee');
    this.copy('app/styl/_app.styl', 'app/styl/app.styl');
    this.copy('app/_index.coffee', 'app/index.coffee');
    return this.copy('app/_index.jade', 'app/index.jade');
  };

}).call(this);
