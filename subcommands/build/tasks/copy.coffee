module.exports = (grunt) ->

  app:
    files: [
      expand: true
      cwd: 'app/'
      dest: 'build/www/js/'
      src: ['*.coffee', '*.json']
    ]

