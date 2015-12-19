require './styles/index'
require './styles/github'

ReactRedux = require('react-redux')
Provider = ReactRedux.Provider

{store} = require('./scripts/reducers/settings')

App = require("./scripts/containers/app.coffee")

document.addEventListener "DOMContentLoaded", (e) ->
  ReactDOM.render(
    React.createElement(Provider, {store: store},
      React.createElement(App, null)
    )
    document.getElementById('presentation')
  )
