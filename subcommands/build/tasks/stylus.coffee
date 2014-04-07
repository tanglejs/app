module.exports = (grunt) ->

  app:
    options:
      compress: false
    files:
      'build/www/css/app.css': 'app/styl/**/*.styl'
