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

    stylus:
      global:
        options:
          compress: false
        files:
          'build/www/css/app.css': 'app/styl/**/*.styl'

  inside path.join(__dirname, '..', '..'), (done) ->
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-stylus'
    done()

  grunt.registerTask 'default', ['clean:build']
