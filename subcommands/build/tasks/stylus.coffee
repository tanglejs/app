module.exports = (grunt) ->

  app:
    options:
      compress: false
    files:
      'build/app/app.css': 'app/styl/**/*.styl'
