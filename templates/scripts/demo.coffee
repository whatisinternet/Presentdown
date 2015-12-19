{div}  = React.DOM

SlideMixin = require('../../mixins/slide_mixin')
DOMMixin = require('../../mixins/dom_mixin')

Navigation = require('../navigation/index')

module.exports = React.createFactory React.createClass
  displayName: "demo"

  mixins: [SlideMixin, DOMMixin]

  markedDown: ->
    @updateMarkup(require('../../raw_slides/demo.md'))

  render: ->
    div {},
      div
        id: 'slide-container'
        className: "blue-grey lighten-5 slide__body",
        div dangerouslySetInnerHTML: __html: @markedDown(),
      Navigation {},
