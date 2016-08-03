Controller = require '../controllers/controller.coffee'

module.exports = Marionette.AppRouter.extend
  appRoutes:
    '': 'showSignUp'
    'verify_phone_number':'showVerifyPhoneNumber'

  controller: new Controller()
