module.exports = Backbone.Model.extend
  defaults:
    id: null
    confirm_id: null
    password: null
    confirm_password: null
  validation:
    id:
      required: true
      msg: 'Invalid email'
      pattern: 'email'
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
