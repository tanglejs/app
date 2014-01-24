(function() {
  var argv, cli, helmsman;

  helmsman = require('helmsman');

  cli = helmsman({
    localDir: 'bin',
    prefix: 'tangle-app',
    usePath: true
  });

  cli.on('--help', function() {
    console.log("\ntangle-app - tools for working with tangle apps");
    return console.log("\nFor detailed usage, view \"man tangle-app\".");
  });

  argv = process.argv;

  cli.parse(argv);

}).call(this);
