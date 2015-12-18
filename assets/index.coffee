require './styles/index'
require './styles/github'

App = require("./scripts/components/app.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  ReactDOM.render(
    App()
    document.getElementById('presentation')
  )
