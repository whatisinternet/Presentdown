module.exports =

  componentDidMount: ->
    codes = document.getElementsByTagName("code")
    _.each codes, (code) ->
      hljs.highlightBlock(code)

  hrReplacement: ->
    "</div>
      <div class='row'>
        <div class='col s12'>
          <div class='container'>
            <div class='card-pannel white z-depth-4' >
              <div class='slide__content'>
                <span class='grey-text text-darken-4'>"

  h1Replacement: ->
    "<div class='indigo darken-4 z-depth-2 slide__heading-wrapper'>
      <h1 class='center-align white-text slide__heading-heaader'"

  updateMardkup: (raw_html) ->
    raw_html = raw_html.replace("<img ", "<img class='responsive-img' ")
    raw_html = raw_html.replace("<video", "<img class='responsive-video' ")
    raw_html = raw_html.replace("<h1 ", @h1Replacement())
    raw_html = raw_html.replace("<hr>", @hrReplacement())
    raw_html += "</span></div></div></div></div></div>"
    raw_html
