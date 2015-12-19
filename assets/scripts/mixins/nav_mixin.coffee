{navigate} = require('react-mini-router')

module.exports =
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
