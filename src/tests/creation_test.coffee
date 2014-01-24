path = require 'path'
helpers = require('yeoman-generator').test

describe 'generator', ->

  beforeEach (done) ->
    helpers.testDirectory path.join(__dirname, 'tmp'), (err) =>
      return done(err) if err
      @app = helpers.createGenerator('tangle:app', [
        ['../../new', 'tangle:app']
      ])
      done()

  it 'creates expected files', (done) ->
    
    # add files you expect to exist here.
    expected = [
      '.gitignore'
    ]
    helpers.mockPrompt @app,
      name: 'tangle-test-app'

    @app.run {}, ->
      helpers.assertFiles expected
      done()
