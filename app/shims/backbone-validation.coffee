require 'backbone.stickit'
require 'backbone-validation'

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
      view.$('.help-block').html(error).addClass('help-block-color fadein')
    $el.addClass('validate invalid')
