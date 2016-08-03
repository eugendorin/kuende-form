module.exports = Backbone.Model.extend
  defaults:
    confirm_code: null
  validation:
    required: true
    msg: 'You`re probably in a hurry to join, so please enter the correct
    confirmation code! ;))'
    pattern: 'number'
    length: 5
