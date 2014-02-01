assert = require('chai').assert
describe 'generator', ->
  it 'can be imported without blowing up', ->
    app = require '../../subcommands/new'
    assert app isnt `undefined`
