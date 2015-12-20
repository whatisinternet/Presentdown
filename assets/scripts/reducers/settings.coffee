{createStore} = require('redux')

default_settings = require('../../config/config.json')

settingsStore = (state = {settings: default_settings}, action) ->
  switch action.type
    when "UPDATE_SETTING"
      updatedSettings = _.merge _.clone(state['settings']), action.settings
      _.extend state['settings'], {settings: updatedSettings}
    else
      return state

module.exports = store: createStore(settingsStore)
