App = require('../components/app.coffee')
ReactRedux = require('react-redux')
connect = ReactRedux.connect

mapStateToProps = (state) ->
  settings: state['settings']

mapDispatchToProps = (dispatch) ->
  handleSettingsChange: (settings) ->
    dispatch({type: 'UPDATE_SETTING', settings: settings})

module.exports = connect(mapStateToProps, mapDispatchToProps)(App)
