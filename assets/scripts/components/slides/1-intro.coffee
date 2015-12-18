{div}  = React.DOM

SlideMixin = require('../../mixins/slide_mixin')
DOMMixin = require('../../mixins/dom_mixin')

module.exports = React.createFactory React.createClass
  displayName: "1.intro"

  mixins: [SlideMixin, DOMMixin]

  markedDown: ->
    @updateMarkup(require('../../raw_slides/1.intro.md'))

  render: ->
    div className: "blue-grey lighten-5 slide__body",
      div dangerouslySetInnerHTML: __html: @markedDown()
