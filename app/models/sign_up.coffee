module.exports = Backbone.Model.extend
  defaults:
    id: null
    confirm_id: null
    password: null
    confirm_password: null
  validation:
    id: 'validateEmailOrPhone'
    confirm_id:
      required: true
      msg: 'Email must match. Please check again!'
      equalTo: 'id'
    password:
      required: true
      msg: 'Password must contain at least 5 characters'
      minLength: 6
    confirm_password:
      required: true
      msg: 'Password must match. Please check again!'
      equalTo: 'password'

  validateEmailOrPhone: (value, attr, computedState)->
    if value?.search('@') > -1
      unless Backbone.Validation.patterns.email.test value
        return 'Please enter a valid email address'
    else
      unless Backbone.Validation.patterns.digits.test value
        return 'Please enter a valid phone number'
