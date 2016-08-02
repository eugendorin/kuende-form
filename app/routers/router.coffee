Controller = require '../controllers/controller.coffee'

module.exports = Marionette.AppRouter.extend
  appRoutes:
    '': 'showSignUp'

  controller: new Controller()
