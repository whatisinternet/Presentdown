{RouterMixin} = require('react-mini-router')

{navigate} = require('react-mini-router')

module.exports = React.createFactory React.createClass
  displayName: "App"

  mixins: [RouterMixin]

  componentDidMount: ->
    themeColour = document.getElementById('meta-theme-color')
    themeColour.setAttribute("content", @props.settings['highlightColour'])

  routes: require('../../config/routes')

  render: ->
    @renderCurrentRoute()

