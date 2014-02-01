(function() {
  var assert;

  assert = require('chai').assert;

  describe('generator', function() {
    return it('can be imported without blowing up', function() {
      var app;
      app = require('../../subcommands/new');
      return assert(app !== undefined);
    });
  });

}).call(this);
