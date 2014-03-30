module.exports = AppBuilder = (grunt) ->
  path = require 'path'
  conf = require('tangle-config').getProject()
  require('grunt-log-headers')(grunt)

  inside = (newDir, callback) ->
    prevDir = process.cwd()
    grunt.file.setBase newDir
    callback -> grunt.file.setBase(prevDir)

  grunt.initConfig
    availabletasks:
      tasks:
        options:
          gruntLogHeader: false
          filter: 'include'
          tasks: [
            'clean'
            'bower'
            'tasks'
          ]
          groups:
            'All build tasks': [
              'bower'
              'clean'
              'tasks'
            ]
          descriptions:
            'clean': 'Empty the build/ directory'
            'bower': 'Update config.js paths for installed Bower components'
            'tasks': 'Display a list of available tasks'

    clean:
      build: ['build/*']
      www: ['build/www']
      tmp: ['build/tmp']

    stylus:
      app:
        options:
          compress: false
        files:
          'build/www/css/app.css': 'app/styl/**/*.styl'

    copy:
      app:
        files: [
          expand: true
          cwd: 'app/'
          dest: 'build/www/js/'
          src: ['**/*.coffee']
        ]

    coffee:
      app:
        expand: true
        cwd: 'build/www/js/'
        dest: 'build/www/js/'
        src: ['**/*.coffee']
        ext: '.js'

    jade:
      app:
        src: ['app/*.jade']
        dest: 'build/www/'
        options:
          client: false
          locals:
            build:
              name: conf.get 'name'
              version: conf.get 'version'
              environment: conf.get 'environment'
              timestamp: Date.now()

    bower:
      config:
        rjsConfig: 'config.js'
        options:
          transitive: true

    symlink:
      components:
        src: 'bower_components/'
        dest: 'build/www/bower_components'

    concat:
      development:
        files:
          'build/www/js/main.js': [
            'config.js'
            'build/www/js/main.js'
          ]
      production:
        banner: "requirejs.config({ baseUrl: '../' });\n"
        files:
          'build/www/js/main.js': [
            'config.js'
            'build/www/js/main.js'
          ]

    requirejs:
      development:
        options:
          appDir: 'build/www'
          dir: 'build/tmp'
          mainConfigFile: 'config.js'

          optimize: 'none'
          removeCombined: false
          findNestedDependencies: false

      production:
        options:
          appDir: 'build/www'
          dir: 'build/tmp'
          mainConfigFile: 'config.js'

          optimize: 'uglify2'
          removeCombined: true
          findNestedDependencies: true

          modules: [
            name: "#{conf.get('name')}.bundle"
            create: true
            include: [
              'requirejs'
              'js/index'
            ]
          ]

    rename:
      tmp:
        src: 'build/tmp'
        dest: 'build/www'

  inside path.join(__dirname, '..', '..'), (done) ->
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

  grunt.registerTask 'components', [
    'symlink:components'
    "concat:#{conf.get('environment')}"
    "requirejs:#{conf.get('environment')}"
    'clean:www'
    'rename:tmp'
  ]

  grunt.registerTask 'tasks', 'availabletasks'

  grunt.registerTask 'default', [
    'clean:build'
    'copy:app'
    'stylus:app'
    'coffee:app'
    'jade:app'
    'components'
  ]
