{createStore} = require('redux')

default_settings = require('../../config/config.json')

settingsStore = (state = {settings: default_settings}, action) ->
  switch action.type
    when "UPDATE_SETTING"
      _.extend state['settings'], action.settings
    else
      return state

module.exports = store: createStore(settingsStore)
