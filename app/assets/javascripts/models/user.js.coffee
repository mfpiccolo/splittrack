App.User  = DS.Model.extend
  name:          DS.attr('string')
  email:         DS.attr('string')
  balance_cents: DS.attr('integer')
