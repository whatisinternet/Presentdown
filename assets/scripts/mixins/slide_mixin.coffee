{navigate} = require('react-mini-router')

module.exports =

  handleKeyUp: (e) ->
    e.preventDefault()
    location = parseInt(_.last(document.location.href.split('/')))
    if parseInt(e.keyCode) == 39  || parseInt(e.keyCode) == 13
      navigate("/#{location + 1}")
    else if parseInt(e.keyCode) == 37
      if isNaN(location)
        navigate("/1")
      else if location == 1
        navigate("/")
      else
        navigate("/#{location - 1}")

  handleClick: (e) ->
    e.preventDefault()
    location = parseInt(_.last( document.location.href.split('/')))
    if e.which == 1
      if isNaN(location)
        navigate("/1")
      else
        navigate("/#{location + 1}")
    else
      if isNaN(location)
        navigate("/1")
      else if location == 1
        navigate("/")
      else
        navigate("/#{location - 1}")
    false

  componentDidMount: ->
    document.addEventListener('click', @handleClick, false)
    document.addEventListener('keyup', @handleKeyUp, false)

  componentWillUnmount: ->
    document.removeEventListener('click', @handleClick)
    document.removeEventListener('keyup', @handleKeyUp)
