{RouterMixin} = require('react-mini-router')

module.exports = React.createFactory React.createClass
  displayName: "App"

  mixins: [RouterMixin]

  routes: require('../../config/routes')

  render: ->
    @renderCurrentRoute()

  title: ->
    require('./slides/0-title') {}

  intro: ->
    require('./slides/1-intro') {}

  slideTwo: ->
    require('./slides/2-slideTwo') {}

