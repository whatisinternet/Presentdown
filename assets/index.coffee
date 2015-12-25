require 'materialize-css/dist/css/materialize.css'
require './styles/index'
require './styles/github'
require 'jQuery/dist/jquery.js'
require 'materialize-css/dist/js/materialize.min.js'

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
