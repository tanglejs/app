module.exports = (grunt) ->

  app:
    expand: true
    cwd: 'build/www/js/'
    dest: 'build/www/js/'
    src: ['*/*.coffee']
    ext: '.js'

  initializers:
    expand: true
    cwd: 'app/'
    dest: 'build/www/js/'
    src: ['*/initializers/**/*.coffee']
    ext: '.js'
