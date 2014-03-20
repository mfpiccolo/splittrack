Splittrack.Payment = DS.Model.extend(
  user_id: DS.attr("number")
  name: DS.attr('string')
  amount_cents: DS.attr('number')
  payment_at: DS.attr('string')
)
