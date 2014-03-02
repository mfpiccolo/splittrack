$ ->

  show_hide_plus_minus = (scan) ->
    $(scan).each (index, s) ->
      $(s).hide()

    $(".add-contact:last").show()
    $(".remove-contact:first").show()

  # autocomp_opts =
  #     minLength: 2
  #     source: (request, response) ->
  #       $.ajax
  #         url: $('.users_with_autocomplete').data('autocompleteurl')
  #         dataType: "json"
  #         data:
  #           name: request.term
  #         success: (data) ->
  #           response(data)

  if /split_payments/i.test(window.location)
    show_hide_plus_minus ".add-contact"
    $(".remove-contact:last").hide()
    $(".select2").select2()

  $("#new_split_payment").on "click", ".add-contact", ->
    new_div = $("<div class='small-12 columns'><div class='small-5 columns'><input class='contact-name' name='contact[][name]' placeholder='Choose a contact' type='text'></div><div class='small-5 columns'><input class='contact-amount' name='contact[][amount]' placeholder='Enter Amount' type='text'></div><div class='small-1 columns'><span class='remove-contact'>-</span></div><div class='small-1 columns'><span class='add-contact'>+</span></div></div>")
    $("#contacts").append new_div
    # new_div.autocomplete(autocomp_opts)
    show_hide_plus_minus ".add-contact"

  $("#new_split_payment").on "click", ".remove-contact", ->
    $(this).parent().parent().remove() if $("#contacts > div").length > 1
    show_hide_plus_minus ".add-contact"

  # TODO get the autocomplete stuff on page load
  # $('.users_with_autocomplete').autocomplete(autocomp_opts)

