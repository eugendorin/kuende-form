require 'backbone.stickit'
require 'backbone-validation'
require './styles/sign_up.styl'

Backbone.Validation.configure
  forceUpdate: true

_.extend Backbone.Validation.callbacks,
  valid: (view, attr, selector) ->
    $el = view.$('[name=' + attr + ']')

    $el.removeClass('validate invalid')
    view.$('.help-block').html('').addClass('hidden')

  invalid: (view, attr, error, selector) ->
    $el = view.$('[name=' + attr + ']')

    if view.$('.help-block').html() is ''
      view.$('.help-block').html(error).removeClass('hidden')
      view.$('.help-block').html(error).addClass('help-block-color')
    $el.addClass('validate invalid')

# Create the Application
app = new Marionette.Application
  onStart: (options)->
    # Start Router
    Router = require('./routers/router.coffee')
    router = new Router(options)

    # Starts the URL handling framework
    Backbone.history.start()
app.start()
