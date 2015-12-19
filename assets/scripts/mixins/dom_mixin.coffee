module.exports =

  componentDidMount: ->
    codes = document.getElementsByTagName("code")
    _.each codes, (code) ->
      hljs.highlightBlock(code)

  hrReplacement: ->
    backgroundColour = require('../../config/config.json')['backgroundColour']
    textColour= require('../../config/config.json')['textColour']
    "</div>
      <div class='row'>
        <div class='col s12'>
          <div class='container'>
            <div class='card-pannel #{backgroundColour} z-depth-4 slide__container' >
              <div class='slide__content'>
                <span class='#{textColour}'>"

  h1Replacement: ->
    colour = require('../../config/config.json')['titleColour']
    titleTextColour= require('../../config/config.json')['titleTextColour']
    "<div class='#{colour} slide__heading-wrapper'>
      <h1 class='center-align #{titleTextColour} slide__heading-header'"

  updateMarkup: (raw_html) ->
    raw_html = raw_html.replace("<img ", "<img class='responsive-img' ")
    raw_html = raw_html.replace("<video", "<img class='responsive-video' ")
    raw_html = raw_html.replace("<h1 ", @h1Replacement())
    raw_html = raw_html.replace("<hr>", @hrReplacement())
    raw_html += "</span></div></div></div></div></div>"
    raw_html
