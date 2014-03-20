Splittrack.PaymentsRoute = Ember.Route.extend
  model: -> Splittrack.Payment.find()
