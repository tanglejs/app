assert = require 'assert'
describe 'generator', ->

  it 'can be imported without blowing up', ->

    app = require '../new'
    assert app isnt `undefined`
