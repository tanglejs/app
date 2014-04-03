#
# * tangle-app
# * https://github.com/tanglejs/app
# *
# * Copyright (c) 2014 Logan Koester
# * Licensed under the MIT license.
#

path = require 'path'
tangleUtil = require 'tangle-util'

module.exports = (grunt) ->
  #
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean:
      docs: ['man/']
      tests: ['tests/tmp/']

    watch:
      all:
        files: [
          'bin/**/*'
          'Gruntfile.coffee'
          'subcommands/*/templates/**/*'
          'subcommands/**/*.coffee'
          'readme/**/*.md'
          'tests/**/*.coffee'
          '!tests/tmp/**/*'
        ]
        tasks: ['default']

    mochacli:
      options:
        compilers: ['coffee:coffee-script/register']
        timeout: '10000'
      all: ['tests/**/*_test.coffee']

    readme_generator:
      help:
        options:
          output: 'tangle-app.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-app'
          package_name: 'tangle-app'
        order:
          'usage.md': 'USAGE'
          'examples.md': 'EXAMPLES'

      build:
        options:
          output: 'tangle-app-build.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-app-build'
          package_desc: 'Build a tangle app'
          package_name: 'tangle-app-build'
        order:
          'subcommands/build/overview.md': 'OVERVIEW'
          'subcommands/build/default.md': 'DEFAULT BEHAVIOR'
          'subcommands/build/environments.md': 'ENVIRONMENTS'
          'subcommands/build/tasks.md': 'TASKS'

      connect:
        options:
          output: 'tangle-app-connect.md'
          table_of_contents: false
          generate_footer: false
          has_travis: false
          package_title: 'tangle-app-connect'
          package_desc: 'Start a webserver'
          package_name: 'tangle-app-connect'
        order:
          'subcommands/connect/overview.md': 'OVERVIEW'

      readme:
        options:
          banner: 'banner.md'
          generate_title: false
          has_travis: false
          github_username: 'tanglejs'
          generate_footer: false
          table_of_contents: false
        order:
          'overview.md': 'Overview'
          'usage.md': 'Usage'
          'examples.md': 'Examples'
          'contributing.md': 'Contributing'
          'license.md': 'License'

    bump:
      options:
        commit: true
        commitMessage: 'Release v%VERSION%'
        commitFiles: ['package.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: 'Version %VERSION%'
        push: false

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-mocha-cli'
  grunt.loadNpmTasks 'grunt-readme-generator'
  grunt.loadNpmTasks 'grunt-bump'

  tangleUtil.grunt.registerMarkedMan 'manpage-app', grunt,
    path.join(__dirname, 'tangle-app.md'),
    path.join(__dirname, 'man', 'tangle-app.1')

  tangleUtil.grunt.registerMarkedMan 'manpage-app-build', grunt,
    path.join(__dirname, 'tangle-app-build.md'),
    path.join(__dirname, 'man', 'tangle-app-build.1')

  tangleUtil.grunt.registerMarkedMan 'manpage-app-connect', grunt,
    path.join(__dirname, 'tangle-app-connect.md'),
    path.join(__dirname, 'man', 'tangle-app-connect.1')

  grunt.registerTask 'build', [
    'clean'
    'readme_generator'
    'manpage-app'
    'manpage-app-build'
    'manpage-app-connect'
  ]

  grunt.registerTask 'test', ['mochacli']
  grunt.registerTask 'default', ['build', 'test']
