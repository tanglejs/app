module.exports = AppBuilder = (grunt) ->
  path = require 'path'

  inside = (newDir, callback) ->
    prevDir = process.cwd()
    grunt.file.setBase newDir
    callback -> grunt.file.setBase(prevDir)

  grunt.initConfig
    clean:
      build: ['build/*']
      www: ['build/www']
      tmp: ['build/tmp']

  inside path.join(__dirname, '..', '..'), (done) ->
    grunt.loadNpmTasks 'grunt-contrib-clean'
    done()

  grunt.registerTask 'default', ['clean:build']
