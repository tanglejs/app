module.exports = (grunt) ->

  tasks:
    options:
      gruntLogHeader: false
      filter: 'include'
      tasks: [
        'clean'
        'bower'
        'tasks'
        'initializers'
        'coffee'
        'stylus'
        'components'
      ]
      groups:
        'Build tasks': [
          'bower'
          'clean'
          'tasks'
        ]
        'Update tasks': [
          'initializers'
          'coffee'
          'stylus'
          'components'
        ]
      descriptions:
        'clean': 'Empty the build/ directory'
        'bower': 'Update config.js paths for installed Bower components'
        'tasks': 'Display a list of available tasks'
        'initializers': 'Rebuild app initializers'
        'coffee': 'Rebuild app coffeescript'
        'stylus': 'Rebuild app stylesheets'
        'components': 'Relink and optimize Bower components'
