module.exports = Marionette.LayoutView.extend
  el: '#app-hook'
  template: require('../templates/layout.hbs')
  regions:
    headerRegion: '#header'
    contentRegion: '#content'
