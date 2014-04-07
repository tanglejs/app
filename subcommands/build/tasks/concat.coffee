module.exports = (grunt) ->
  development:
    files:
      'build/app/main.js': [
        'config.js'
        'build/app/main.js'
      ]
  production:
    banner: "requirejs.config({ baseUrl: '../' });\n"
    files:
      'build/app/main.js': [
        'config.js'
        'build/app/main.js'
      ]
