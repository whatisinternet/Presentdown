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
    console.log raw_html
    raw_html

  render: ->
    div className: "grey darken-4", style: {height: "100vh"},
      div className: "row",
        div className: "col s12",
          div className: "container white-text",
            div
              dangerouslySetInnerHTML: __html: @markedDown()
