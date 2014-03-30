chai = require 'chai'
should = chai.should()
chai.use require 'chai-fs'

nixt = require 'nixt'
fs = require 'fs'
path = require 'path'

describe 'Running "grunt clean"', ->
  it 'should empty the build directory without removing it', (done) ->
    dir = path.join __dirname, '..', 'tmp'
    buildDir = path.join dir, 'build'
    nixt()
      .before -> 
        try
          fs.mkdirSync dir
          fs.mkdirSync buildDir
      .after -> done()
      .cwd dir
      .writeFile path.join(buildDir, 'garbage')
      .run 'tangle app build clean'
      .end ->
        buildDir.should.be.a.directory().and.empty
