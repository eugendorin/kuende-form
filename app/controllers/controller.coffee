module.exports = Marionette.Object.extend
  initialize: ->

    # Create layout View
    Layout = require('../views/layout.coffee')

    @layout = new Layout()

    @layout.on 'render', =>
      @showNavbar()
      @showSignUp()

    # Render Layout View
    @layout.render()



  showNavbar: ->
    # import navbar view
    NavbarView = require('../views/navbar.coffee')
    # initialize navbar view
    navbarView = new NavbarView()

    navbarView.on 'handle:navigate', (route)=>
      if route is 'Rounds'
        Backbone.history.navigate('rounds')
        @showRounds()
      else
        Backbone.history.navigate('')
        @showPlayers()
    # show navbarView
    @layout.headerRegion.show navbarView

  showVerifyPhoneNumber: ->
    Backbone.history.navigate('sign_up_phone')
    VerifyPhoneNumberModel = require '../models/verify_phone.coffee'
    verifyPhoneNumberModel = new VerifyPhoneNumberModel()

    VerifyPhoneNumberView = require '../views/verify_phone.coffee'
    verifyPhoneNumberView = new VerifyPhoneNumberView
      model: verifyPhoneNumberModel

    @layout.contentRegion.show verifyPhoneNumberView

  showVerifyEmail: ->
    Backbone.history.navigate('sign_up_email')

    VerifyEmailView = require '../views/verify_email.coffee'
    verifyEmailView = new VerifyEmailView()

    @layout.contentRegion.show verifyEmailView

  showSignUp: ->
    SignUpModel = require '../models/sign_up.coffee'
    signUpModel = new SignUpModel()

    SignUpView = require '../views/sign_up.coffee'
    signUpView = new SignUpView
      model: signUpModel

    @layout.contentRegion.show signUpView

    signUpView.on 'handle:submit:signup', =>
      if signUpModel.isValid()
        if Backbone.Validation.patterns.email.test signUpModel.get('id')
          @showVerifyEmail()
        else
          @showVerifyPhoneNumber()

    signUpView.on 'handle:focus:loss:input', (inputName)->
      @model.isValid(inputName)
