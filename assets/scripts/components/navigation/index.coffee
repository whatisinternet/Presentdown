{div, i, span, a} = React.DOM

Navigation = require('../../mixins/nav_mixin')

module.exports = React.createFactory React.createClass
  displayName: "Navigation"

  mixins: [Navigation]

  render: ->

    div {},
      div
        className: 'fixed-action-button'
        style: {position: "fixed", bottom: "45px", left: "24px"},
          div
            className: 'btn-floating btn-small waves-effect waves-light blue-grey lighten-5 round'
            onClick: @handleOnClickBack,
            i
              className: 'material-icons grey-text',
                "fast_rewind"
      div
        className: 'fixed-action-button'
        style: {position: "fixed", bottom: "45px", left: "74px"},
          div
            className: 'btn-floating btn-small waves-effect waves-light blue-grey lighten-5 round'
            onClick: @handleOnClickForward,
            i
              className: 'material-icons grey-text',
                "fast_forward"

      div
        style: {position: "fixed", bottom: "15px", left: "24px"},
          span
            className: 'grey-text',
            div {},
              'Created with '
              i
                className: 'tiny material-icons',
                  "favorite"
              a
                className: 'blue-grey-text'
                href: 'https://github.com/whatisinternet/Presentdown',
                  ' by Presentdown'

      div
        className: 'fixed-action-button'
        style: {position: "fixed", bottom: "45px", right: "24px"},
          div
            className: 'btn-floating btn-small waves-effect waves-light blue-grey lighten-5 round'
            onClick: @toggleFullScreen,
            i
              className: 'material-icons grey-text',
                "settings_overscan"
