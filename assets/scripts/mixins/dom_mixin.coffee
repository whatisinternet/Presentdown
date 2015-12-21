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
    colour = settings['titleColour']
    titleTextColour = settings['titleTextColour']
    "<div class='#{colour} slide__heading-wrapper'>
      <h1 class='center-align #{titleTextColour} slide__heading-header'"

  pReplacement: ->
    "<p class=\"#{@props.settings['bodyTextColour']} flow-text\" "

  aStyles: ->
    {settings} = @props
    highlightColour = settings['highlightColour']
    hoverColour = settings['hoverColour']
    "<style>a {
      color: #{highlightColour} !important;
      -o-transition: .3s;
      -ms-transition: .3s;
      -moz-transition: .3s;
      -webkit-transition: .3s;
      transition: .3s;
      }
      a:hover {
        color: #{hoverColour} !important;}
      a:active {
        color: #{highlightColour} !important;}
    </style>"

  updateMarkup: (raw_html) ->
    raw_html += @aStyles()
    raw_html = raw_html.replace("<img ", "<img class='responsive-img' ")
    raw_html = raw_html.replace("<video", "<img class='responsive-video' ")
    raw_html = raw_html.replace("<h1 ", @h1Replacement())
    raw_html = raw_html.replace("<hr>", @hrReplacement())
    raw_html = raw_html.replace("<p ", @pReplacement())
    raw_html += "</span></div></div></div></div></div>"
    raw_html
