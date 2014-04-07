module.exports = AppBuilder = (grunt) ->
  path = require 'path'
  conf = require('tangle-config').getProject()
  inside = require('tangle-util/grunt').inside
  require('grunt-log-headers')(grunt)

  require('grunt-config-dir') grunt,
    configDir: path.resolve(__dirname, 'tasks')
    fileExtensions: ['coffee']
  , (err) -> grunt.log.error err

  grunt.registerTask 'components', [
    'symlink:components'
    "concat:#{conf.get('environment')}"
    "requirejs:#{conf.get('environment')}"
    'clean:www'
    'rename:tmp'
  ]

  inside path.join(__dirname, '..', '..'), grunt, (done) ->
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-stylus'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-jade'
    grunt.loadNpmTasks 'grunt-bower-requirejs'
    grunt.loadNpmTasks 'grunt-contrib-symlink'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-requirejs'
    grunt.loadNpmTasks 'grunt-rename'
    grunt.loadNpmTasks 'grunt-available-tasks'
    done()

  grunt.registerTask 'initializers', ['coffee:initializers']

  grunt.registerTask 'tasks', 'availabletasks'

  grunt.registerTask 'default', [
    'clean:build'
    'copy:app'
    'stylus:app'
    'coffee:app'
    'jade:app'
    'components'
  ]
