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
    raw_html.replace("<h1 ", "<div class='indego darken-4' style='width: 100%; left: 0; right: 0; height: 200px;'><h1 class='center-align white-text' ")
    raw_html.replace("<hr>", "</div><div class='card-pannel' ")
    raw_html += "</div>"


  render: ->
    div className: "indego darken-1", style: {height: "100vh"},
      div className: "row",
        div className: "col s12",
          div className: "container white-text",
            div
              dangerouslySetInnerHTML: __html: @markedDown()
