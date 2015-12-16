require './styles/index'

App = require("./scripts/components/app.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  ReactDOM.render(
    App()
    document.getElementById('presentation')
  )
