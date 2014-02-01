path = require 'path'
helpers = require('yeoman-generator').test
assert = require('chai').assert

asyncStub =
  on: (key, cb) ->
    if key is 'exit' then cb()
    return asyncStub;

describe 'generator', ->

  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, 'tmp'), (err) =>
      return done(err) if err
      @app = helpers.createGenerator('tangle:app', [
        ['../../../new', 'tangle:app']
      ])

      # Keep track of all commands executed by spawnCommand
      @commandsRun = []
      @app.spawnCommand = (cmd, args) =>
        @commandsRun.push [cmd, args]
        return asyncStub
      done()

  it 'installs bower and npm dependencies', (done) ->
    @app.installDependencies =>
      assert.deepEqual(@commandsRun, [['bower', ['install']], ['npm', ['install']]])
      done()

  describe 'output', ->
    beforeEach (done) ->
      helpers.mockPrompt @app,
        name: 'tangle-test-app'
        version: '0.1.0'
        description: 'A test app'
        homepage: 'https://tangle-test-app.example'
        isPrivate: true
        author:
          name: 'Test Author'
          email: 'author@example.com'
          url: 'https://author.example.com'
          githubUsername: 'testuser'

      helpers.mockPrompt @app,
        name: 'tangle-test-app'
      done()

    it 'includes expected files', (done) ->
      # add files you expect to exist here.
      expected = [
        '.gitignore'
        'bower.json'
        'config.js'
        'package.json'
        'bower_components'
        'node_modules'
        'app'
        'app/initializers'
        'app/initializers/index.coffee'
        'app/initializers/logger.coffee'
        'app/modules'
        'app/primitives'
        'app/styl'
        'app/styl/app.styl'
      ]

      @app.run {}, ->
        helpers.assertFiles expected
        done()
