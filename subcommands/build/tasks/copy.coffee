module.exports = (grunt) ->

  app:
    files: [
      expand: true
      cwd: 'app/'
      dest: 'build/app/'
      src: ['*.coffee', '*.json']
    ]

  initializers:
    files: [
      expand: true
      cwd: 'app/initializers'
      dest: 'build/app/initializers'
      src: ['**/*.coffee']
    ]

  modules:
    files: [
      expand: true
      cwd: 'app/modules'
      dest: 'build/app/modules'
      src: ['**/*']
    ]

  primitives:
    files: [
      expand: true
      cwd: 'app/primitives'
      dest: 'build/app/primitives'
      src: ['**/*.coffee', '**/*.json']
    ]
