Splittrack.PaymentsController = Ember.ArrayController.extend(
  actions:
    addPayment: (name) ->
      Splittrack.Payment.createRecord(name: name)
      @get("store").commit()
    drawWinner: ->
      @setEach("highlight", false)
      pool = @rejectProperty("winner")
      if pool.length > 0
        payment = pool[Math.floor(Math.random()*pool.length)]
        payment.set("winner", true)
        payment.set("highlight", true)
        @get("store").commit()
)
