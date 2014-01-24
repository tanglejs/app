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
      expected = ['.gitignore'];
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
