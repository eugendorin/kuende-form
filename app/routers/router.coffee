Controller = require '../controllers/controller.coffee'

module.exports = Marionette.AppRouter.extend
  appRoutes:
    '':'showSignUp'
    'sign_up_email':'showVerifyEmail'
    'sign_up_phone':'showVerifyPhoneNumber'
  controller: new Controller()
