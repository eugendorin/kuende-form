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

  showSignUp: ->
    SignUpModel = require '../models/sign_up.coffee'
    signUpModel = new SignUpModel()

    SignUpViewSucces = require '../views/sign_up_success.coffee'
    signUpViewSucces = new SignUpViewSucces()

    SignUpView = require '../views/sign_up.coffee'
    signUpView = new SignUpView
      model: signUpModel

    @layout.contentRegion.show signUpView

    signUpView.on 'handle:submit:signup', =>
      console.log(signUpModel.isValid())
      if signUpModel.isValid()
        @layout.contentRegion.show signUpViewSucces
