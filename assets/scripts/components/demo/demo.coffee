{div}  = React.DOM

SlideMixin = require('../../mixins/slide_mixin')

module.exports = React.createFactory React.createClass
  displayName: "demo"

  mixins: [SlideMixin]

  componentDidMount: ->
    codes = document.getElementsByTagName("code")
    _.each codes, (code) ->
      hljs.highlightBlock(code)

  markedDown: ->
    raw_html = require('../../raw_slides/demo.md')
    raw_html = raw_html.replace("<img ", "<img class='responsive-img' ")
    raw_html = raw_html.replace("<video", "<img class='responsive-video' ")
    raw_html = raw_html.replace("<h1 ", "<div class='indigo darken-4 z-depth-2' style='width: 100%; margin-top: -35px;'><h1 class='center-align white-text' style='padding: 20px' ")
    raw_html = raw_html.replace("<hr>", "
    </div>
    <div class='row'>
      <div class='col s12'>
        <div class='container'>
          <div class='card-pannel white z-depth-4' >
            <div style='padding: 20px;'>
              <span class='grey-text text-darken-4'>")

    raw_html += "</span></div></div></div></div></div>"
    raw_html


  render: ->
    div className: "indigo", style: {height: "100vh"},
      div dangerouslySetInnerHTML: __html: @markedDown()
