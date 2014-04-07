module.exports = (grunt) ->
  conf = require('tangle-config').getProject()

  app:
    src: ['app/*.jade']
    dest: 'build/app/'
    options:
      client: false
      locals:
        build:
          name: conf.get 'name'
          version: conf.get 'version'
          environment: conf.get 'environment'
          timestamp: Date.now()

