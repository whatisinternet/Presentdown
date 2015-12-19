module.exports =

  componentDidMount: ->
    codes = document.getElementsByTagName("code")
    _.each codes, (code) ->
      hljs.highlightBlock(code)

  hrReplacement: ->
    {settings} = @props
    backgroundColour = settings['backgroundColour']
    textColour= settings['textColour']
    "</div>
      <div class='row'>
        <div class='col s12'>
          <div class='container'>
            <div class='card-pannel #{backgroundColour} z-depth-4 slide__container' >
              <div class='slide__content'>
                <span class='#{textColour}'>"

  h1Replacement: ->
    {settings} = @props
    console.log @props
    colour = settings['titleColour']
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
