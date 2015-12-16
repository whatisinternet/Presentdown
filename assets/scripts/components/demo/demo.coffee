{div, h1, h4, a}  = React.DOM

SlideMixin = require('../../mixins/slide_mixin')
marked = require('marked')

module.exports = React.createFactory React.createClass
  displayName: "demo"

  mixins: [SlideMixin]

  markedDown: ->
    require('../../raw_slides/demo.md')

  render: ->
    div className: "grey darken-4", style: {height: "100vh"},
      div className: "row",
        div className: "col s12",
          div className: "container white-text",
              div
                dangerouslySetInnerHTML: __html: @markedDown()
