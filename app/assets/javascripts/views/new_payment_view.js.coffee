Splittrack.NewPaymentView = Ember.View.extend
  templateName: "new_payment"
  tagName: "form"

  submit: ->
    @get("controller").send("addPayment", @get("newPaymentName"))
    @set("newPayment", "")
    false
