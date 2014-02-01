(function() {
  var helpers, path;

  path = require('path');

  helpers = require('yeoman-generator').test;

  describe('generator', function() {
    beforeEach(function(done) {
      var _this = this;
      return helpers.testDirectory(path.join(__dirname, 'tmp'), function(err) {
        if (err) {
          return done(err);
        }
        _this.app = helpers.createGenerator('tangle:app', [['../../new', 'tangle:app']]);
        return done();
      });
    });
    return it('creates expected files', function(done) {
      var expected;
      expected = ['.gitignore', 'bower.json', 'config.js', 'package.json', 'bower_components', 'node_modules', 'app', 'app/initializers', 'app/initializers/index.coffee', 'app/initializers/logger.coffee', 'app/modules', 'app/primitives', 'app/styl', 'app/styl/app.styl'];
      helpers.mockPrompt(this.app, {
        name: 'tangle-test-app',
        version: '0.1.0',
        description: 'A test app',
        homepage: 'https://tangle-test-app.example',
        isPrivate: true,
        author: {
          name: 'Test Author',
          email: 'author@example.com',
          url: 'https://author.example.com',
          githubUsername: 'testuser'
        }
      });
      helpers.mockPrompt(this.app, {
        name: 'tangle-test-app'
      });
      return this.app.run({}, function() {
        helpers.assertFiles(expected);
        return done();
      });
    });
  });

}).call(this);
