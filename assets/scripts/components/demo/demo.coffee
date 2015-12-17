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
    raw_html.replace("<h1 ", "<h1 class='center-align yellow-text lighten-5' ")


  render: ->
    div className: "blue darken-4", style: {height: "100vh"},
      div className: "row",
        div className: "col s12",
          div className: "container white-text",
            div
              dangerouslySetInnerHTML: __html: @markedDown()
