module.exports = (grunt) ->

  app:
    expand: true
    cwd: 'app'
    dest: 'build/app'
    src: ['*.coffee']
    ext: '.js'

  initializers:
    expand: true
    cwd: 'app/'
    dest: 'build/app'
    src: ['initializers/**/*.coffee']
    ext: '.js'

  modules:
    expand: true
    cwd: 'app/modules'
    dest: 'build/app/modules'
    src: ['**/*.coffee']
    ext: '.js'

  primitives:
    expand: true
    cwd: 'app/primitives'
    dest: 'build/app/primitives'
    src: ['**/*.coffee']
    ext: '.js'
