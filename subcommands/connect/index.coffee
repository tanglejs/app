module.exports = AppConnect = (grunt) ->
  path = require 'path'
  conf = require('tangle-config').getProject()
  require('grunt-log-headers')(grunt)

  inside = (newDir, callback) ->
    prevDir = process.cwd()
    grunt.file.setBase newDir
    callback -> grunt.file.setBase(prevDir)

  grunt.initConfig
    connect:
      www:
        options:
          gruntLogHeader: false
          keepalive: true
          port: 3000
          base: './build/www'
          livereload: true

  inside path.join(__dirname, '..', '..'), (done) ->
    grunt.loadNpmTasks 'grunt-contrib-connect'
    done()

  grunt.registerTask 'default', [
    'connect:www'
  ]
