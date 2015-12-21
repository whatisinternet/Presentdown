{div, i, span, a, style} = React.DOM

Navigation = require('../../mixins/nav_mixin')

module.exports = React.createFactory React.createClass
  displayName: "Navigation"

  mixins: [Navigation]

  render: ->


    div {},
      style {},
        ".navigation__highlight:hover{
          -o-transition: .3s;
          -ms-transition: .3s;
          -moz-transition: .3s;
          -webkit-transition: .3s;
          transition: .3s;
          color: #{@props.settings.hoverColour} !important;
          }"
      div
        className: 'fixed-action-button navigation__fade-away'
        style: {position: "fixed", bottom: "45px", left: "24px"},
          div
            className: 'modal__button navigation__fade-away'
            onClick: @handleOnClickBack,
            i
              className: 'material-icons grey-text navigation__highlight',
                "fast_rewind"
      div
        className: 'fixed-action-button navigation__fade-away'
        style: {position: "fixed", bottom: "45px", left: "74px"},
          div
            className: 'modal__button navigation__fade-away'
            onClick: @handleOnClickForward,
            i
              className: 'material-icons grey-text navigation__highlight',
                "fast_forward"
      div
        className: 'fixed-action-button navigation__fade-away'
        style: {position: "fixed", bottom: "45px", left: "124px"},
          div
            className: 'modal__button navigation__fade-away'
            onClick: @handleOnClickHome,
            i
              className: 'material-icons grey-text navigation__highlight',
                "home"

      div
        className: 'navigation__love-text',
        style: {position: "fixed", bottom: "15px", left: "24px"},
          span
            className: 'grey-text navigation__highlight',
            div {},
              'Created with '
              i
                className: 'material-icons red-text navigation__love-text-icon',
                  "favorite"
              a
                className: 'blue-grey-text'
                href: 'https://github.com/whatisinternet/Presentdown',
                  ' by Presentdown'

      div
        className: 'fixed-action-button'
        style: {position: "fixed", bottom: "45px", right: "24px"},
          div
            className: 'modal__button navigation__fade-away'
            onClick: @toggleFullScreen,
            i
              className: 'material-icons grey-text navigation__highlight',
                "settings_overscan"

