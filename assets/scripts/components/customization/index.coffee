{div, select, p, h4, i, option, label, input} = React.DOM

ColourMixin = require('../../mixins/colour_mixin')

module.exports = React.createFactory React.createClass
  displayName: "Customization"

  mixins: [ColourMixin]

  showModal: ->
    overlay = document.getElementById('materialize-lean-overlay-9')
    overlay.style['z-index'] = 1000
    overlay.style['display'] = 'block'
    overlay.style['opacity'] = 0.5
    modal = document.getElementById('customization-modal')
    modal.style['z-index'] = 1003
    modal.style['display'] = 'block'
    modal.style['opacity'] = 1
    modal.style['bottom'] = '0px'

  hideModal: ->
    modal = document.getElementById('customization-modal')
    modal.style['z-index'] = null
    modal.style['display'] = null
    modal.style['opacity'] = null
    modal.style['bottom'] = null
    overlay = document.getElementById('materialize-lean-overlay-9')
    overlay.style['z-index'] = null
    overlay.style['display'] = null
    overlay.style['opacity'] = null

  render: ->
    div {},
      div
        onClick: @showModal
        className: 'fixed-action-button modal__button'
        style: {position: "fixed", bottom: "45px", right: "74px"},
          i
            className: 'material-icons grey-text navigation__highlight navigation__fade-away',
              "settings"

      div
        className: 'lean-overlay modal__overlay-fade'
        onClick: @hideModal
        id: 'materialize-lean-overlay-9',
          ''
      div
        className: "modal blue-grey darken-4 white-text modal__fade"
        id: "customization-modal",
          div
            className: "modal-content",
              h4 {},
                "Customization menu"
              div
                className: 'row',
                div
                  className: 'col s12',
                  _.map @props.settings, (setting, key) =>
                    if "#{setting}".includes("#")
                      div
                        key: key,
                          label {},
                            _.startCase key
                          select
                            onChange: (e) => @props.handleSettingsChange({"#{key}": e.target.value})
                            value: setting
                            style: {display: 'block', color: "#{setting}"},
                              _.map @hexColourList(), (colour, name) ->
                                option
                                  key: colour
                                  value: colour
                                  defaultValue: setting.toUpperCase(),
                                    name
                    else
                      div
                        key: key,
                          label {},
                            _.startCase key
                          select
                            className: "#{setting}"
                            onChange: (e) => @props.handleSettingsChange({"#{key}": e.target.value})
                            value: setting
                            style: {display: 'block'},
                            if key.toLowerCase().includes('text')
                              _.map @textColourOptions(), (colour) =>
                                option
                                  key: colour
                                  value: colour
                                  defaultValue: setting,
                                    colour
                            else
                              _.map @colourOptions(), (colour) =>
                                option
                                  key: colour
                                  value: colour
                                  defaultValue: setting,
                                    colour


            div
              className: "modal-footer blue-grey darken-4 white-text modal-fade",
                div
                  className: "white-text blue-grey darken-4 modal-action modal-close waves-effect waves-blue btn-flat"
                  onClick: @hideModal,
                    "close"
