(function() {
  var assert, asyncStub, helpers, path;

  path = require('path');

  helpers = require('yeoman-generator').test;

  assert = require('chai').assert;

  asyncStub = {
    on: function(key, cb) {
      if (key === 'exit') {
        cb();
      }
      return asyncStub;
    }
  };

  describe('generator', function() {
    beforeEach(function(done) {
      return helpers.testDirectory(path.join(__dirname, 'tmp'), (function(_this) {
        return function(err) {
          if (err) {
            return done(err);
          }
          _this.app = helpers.createGenerator('tangle:app', [[require('../../subcommands/new'), 'tangle:app']]);
          _this.commandsRun = [];
          _this.app.spawnCommand = function(cmd, args) {
            _this.commandsRun.push([cmd, args]);
            return asyncStub;
          };
          return done();
        };
      })(this));
    });
    it('installs bower and npm dependencies', function(done) {
      return this.app.installDependencies((function(_this) {
        return function() {
          assert.deepEqual(_this.commandsRun, [['bower', ['install']], ['npm', ['install']]]);
          return done();
        };
      })(this));
    });
    return describe('output', function() {
      beforeEach(function(done) {
        helpers.mockPrompt(this.app, {
          'app:name': 'tangle-test-app',
          'app:version': '0.1.0',
          'app:description': 'A test app',
          'app:homepage': 'https://tangle-test-app.example',
          'app:isPrivate': true,
          'author:name': 'Test Author',
          'author:email': 'author@example.com',
          'author:url': 'https://author.example.com',
          'author:githubUsername': 'testuser'
        });
        return done();
      });
      return it('includes expected files', function(done) {
        var expected;
        expected = ['.gitignore', 'bower.json', 'config.js', 'package.json', 'bower_components', 'node_modules', 'app', 'app/initializers', 'app/initializers/index.coffee', 'app/initializers/logger.coffee', 'app/modules', 'app/primitives', 'app/styl', 'app/styl/app.styl', 'app/index.coffee', 'app/index.jade'];
        return this.app.run({}, function() {
          helpers.assertFiles(expected);
          return done();
        });
      });
    });
  });

}).call(this);
