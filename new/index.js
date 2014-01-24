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
        return console.log("Next steps...\n");
      });
      this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
    }

    return AppGenerator;

  })(yeoman.generators.Base);

  AppGenerator.prototype.appPrompts = require('./prompts/app').prompt;

  AppGenerator.prototype.copyFiles = function() {
    this.mkdir('app');
    this.mkdir('build');
    this.mkdir('tests');
    return this.copy('gitignore', '.gitignore');
  };

}).call(this);
