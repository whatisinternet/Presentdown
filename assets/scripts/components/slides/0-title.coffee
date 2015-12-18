{div}  = React.DOM

SlideMixin = require('../../mixins/slide_mixin')
DOMMixin = require('../../mixins/dom_mixin')

module.exports = React.createFactory React.createClass
  displayName: "0.title"

  mixins: [SlideMixin, DOMMixin]

  markedDown: ->
    @updateMarkup(require('../../raw_slides/0.title.md'))

  render: ->
    div className: "blue-grey lighten-5 slide__body",
      div dangerouslySetInnerHTML: __html: @markedDown()
