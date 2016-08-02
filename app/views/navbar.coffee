module.exports = Marionette.ItemView.extend
  template: require('../templates/navbar.hbs')

  events:
    'click [data-action="link"]': 'eventActionClickLink'

  eventActionClickLink: (ev)->
    @trigger 'handle:navigate', $(ev.target).text()
