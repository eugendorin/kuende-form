module.exports = Marionette.ItemView.extend
  template: require '../templates/sign_up.hbs'

  ui:
    input: '[data-ui="input"]'

  events:
    'submit':'eventActionSubmit'

  bindings:
    '[name=id]':
      observe: 'id'
      setOption:
        validation: true
    '[name=confirm_id]':
      observe: 'confirm_id'
      setOption:
        validation: true
    '[name=password]':
      observe: 'password'
      setOption:
        validation: true
    '[name=confirm_password]':
      observe: 'confirm_password'
      setOption:
        validation: true

  onRender: ->
    Backbone.Validation.bind(this)
    @stickit()

  onDestroy: ->
    Backbone.Validation.unbind(this)

  eventActionSubmit: (ev)->
    ev.preventDefault()
    @model.validate()
    @trigger 'handle:submit:signup'
    return false
