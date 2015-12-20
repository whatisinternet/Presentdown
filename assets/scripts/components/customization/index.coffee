{div, select, p, h4, i, option, label, input} = React.DOM

module.exports = React.createFactory React.createClass
  displayName: "Customization"

  colours: ->
    ["red",
    "pink",
    "purple",
    "deep-purple",
    "indigo",
    "blue",
    "light-blue",
    "cyan",
    "teal",
    "green",
    "light-green",
    "lime",
    "yellow",
    "amber",
    "orange",
    "deep-orange",
    "brown",
    "grey",
    "blue-grey",
    "black",
    "white",
    "transparent"]

  shades: ->
    lightens = _.map [1..5], (idx) ->
      "lighten-#{idx}"
    darkens = _.map [1..4], (idx) ->
      "darken-#{idx}"
    accents= _.map [1..4], (idx) ->
      "accent-#{idx}"
    _.flatten [lightens, darkens, accents]

  colourOptions: ->
    _.flatten _.reduce @colours(), ((colours, colour) =>
      colours.push [colour]
      colours.push _.map @shades(), (shade) ->
        "#{colour} #{shade}"
      colours
    ), []

  textColourOptions: ->
    _.flatten _.reduce @colours(), ((colours, colour) =>
      colours.push ["#{colour}-text"]
      colours.push _.map @shades(), (shade) ->
        "#{colour}-text text-#{shade}"
      colours
    ), []

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
        className: 'fixed-action-button'
        style: {position: "fixed", top: "50%", right: "24px"},
          i
            onClick: @showModal
            className: 'material-icons grey-text navigation__highlight navigation__fade-away',
              "settings"

      div
        className: 'lean-overlay'
        onClick: @hideModal
        id: 'materialize-lean-overlay-9',
          ''
      div
        className: "modal bottom-sheet"
        id: "customization-modal",
          div
            className: "modal-content",
              h4 {},
                "Customization menu"
              div
                className: 'col s12',
                _.map @props.settings, (setting, key) =>
                  if "#{setting}".includes("#")
                    div
                      key: key,
                        label {},
                          _.startCase key
                      input
                        value: setting
                        onChange: (e) => @props.handleSettingsChange({"#{key}": e.target.value})
                  else
                    div
                      key: key,
                        label {},
                          _.startCase key
                        select
                          onChange: (e) => @props.handleSettingsChange({"#{key}": e.target.value})
                          value: setting
                          style: {display: 'block', width: '25%'},
                          if setting.toLowerCase().includes('text')
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
            className: "modal-footer",
              div
                className: "modal-action modal-close waves-effect waves-blue btn-flat"
                onClick: @hideModal,
                  "close"
