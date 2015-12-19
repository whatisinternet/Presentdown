{div, i} = React.DOM
{navigate} = require('react-mini-router')

module.exports = React.createFactory React.createClass
  displayName: "Navigation"

  handleOnClickForward: (e) ->
    location = parseInt(_.last( document.location.href.split('/')))
    if isNaN(location)
      navigate("/1")
    else
      navigate("/#{location + 1}")
    false

  handleOnClickBack: (e) ->
    document.addEventListener('click', -> return null)
    location = parseInt(_.last( document.location.href.split('/')))
    if isNaN(location)
      navigate("/1")
    else if location == 1
      navigate("/")
    else
      navigate("/#{location - 1}")
    false

  toggleFullScreen: ->
    if !document.fullscreenElement and !document.mozFullScreenElement and !document.webkitFullscreenElement and !document.msFullscreenElement
      # current working methods
      if document.documentElement.requestFullscreen
        document.documentElement.requestFullscreen()
      else if document.documentElement.msRequestFullscreen
        document.documentElement.msRequestFullscreen()
      else if document.documentElement.mozRequestFullScreen
        document.documentElement.mozRequestFullScreen()
      else if document.documentElement.webkitRequestFullscreen
        document.documentElement.webkitRequestFullscreen Element.ALLOW_KEYBOARD_INPUT
    else
      if document.exitFullscreen
        document.exitFullscreen()
      else if document.msExitFullscreen
        document.msExitFullscreen()
      else if document.mozCancelFullScreen
        document.mozCancelFullScreen()
      else if document.webkitExitFullscreen
        document.webkitExitFullscreen()

  render: ->

    div {},
      div
        className: 'fixed-action-button'
        style: {position: "fixed", bottom: "45px", left: "24px"},
          div
            className: 'btn-floating btn-small waves-effect waves-light blue-grey lighten-4 round'
            onClick: @handleOnClickBack,
            i
              className: 'material-icons',
                "fast_rewind"
      div
        className: 'fixed-action-button'
        style: {position: "fixed", bottom: "45px", left: "74px"},
          div
            className: 'btn-floating btn-small waves-effect waves-light blue-grey lighten-4 round'
            onClick: @handleOnClickForward,
            i
              className: 'material-icons',
                "fast_forward"

      div
        className: 'fixed-action-button'
        style: {position: "fixed", bottom: "45px", right: "24px"},
          div
            className: 'btn-floating btn-small waves-effect waves-light blue-grey lighten-4 round'
            onClick: @toggleFullScreen,
            i
              className: 'material-icons',
                "settings_overscan"
