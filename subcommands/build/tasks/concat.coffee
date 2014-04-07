module.exports = (grunt) ->
  development:
    files:
      'build/www/js/main.js': [
        'config.js'
        'build/www/js/main.js'
      ]
  production:
    banner: "requirejs.config({ baseUrl: '../' });\n"
    files:
      'build/www/js/main.js': [
        'config.js'
        'build/www/js/main.js'
      ]
