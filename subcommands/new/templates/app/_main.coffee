require ['js/index'], (App) ->
  root = window ? global
  root.App = App
  App.start()
