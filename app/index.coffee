require 'backbone.stickit'
require 'backbone-validation'

Backbone.Validation.configure
  forceUpdate: true

_.extend Backbone.Validation.callbacks,
  valid: (view, attr, selector) ->
    $el = view.$('[name=' + attr + ']')

    $el.removeClass('validate invalid')
    view.$('.help-block2').html('').addClass('hidden')

    # $group = $el.closest('.form-group')

    # $el.removeClass('validate invalid')
    # $group.find('.help-block').html('').addClass('hidden')


  invalid: (view, attr, error, selector) ->
    $el = view.$('[name=' + attr + ']')

    if view.$('.help-block2').html() is ''
      view.$('.help-block2').html(error).removeClass('hidden')

    $el.addClass('validate invalid')

    # $group = $el.closest('.form-group')

    # $el.addClass('validate invalid')
    # $group.find('.help-block').html(error).removeClass('hidden')

# Create the Application
app = new Marionette.Application
  onStart: (options)->
    # Start Router
    Router = require('./routers/router.coffee')
    router = new Router(options)

    # Starts the URL handling framework
    Backbone.history.start()
app.start()
