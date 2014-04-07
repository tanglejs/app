module.exports = (grunt) ->
  conf = require('tangle-config').getProject()

  development:
    options:
      appDir: 'build/app'
      dir: 'build/tmp'
      mainConfigFile: 'config.js'

      optimize: 'none'
      removeCombined: false
      findNestedDependencies: false

  production:
    options:
      appDir: 'build/app'
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
          'index'
        ]
      ]

