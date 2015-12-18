{div}  = React.DOM

SlideMixin = require('../../mixins/slide_mixin')
DOMMixin = require('../../mixins/dom_mixin')

module.exports = React.createFactory React.createClass
  displayName: "demo"

  mixins: [SlideMixin, DOMMixin]

  markedDown: ->
    @updateMarkup(require('../../raw_slides/demo.md'))

  render: ->
    div className: "blue-gray lighten-5 slide__body",
      div dangerouslySetInnerHTML: __html: @markedDown()
