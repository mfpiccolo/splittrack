jQuery ($) ->

  show_hide_plus_minus = (scan) ->
    $(scan).each (index, s) ->
      $(s).hide()

    $(".add-contact:last").show()
    $(".remove-contact:first").show()

  $("#new_split_payment").on "click", ".add-contact", ->
    new_div = $("<li class='comp split-contact-row'><div class='split-contact'><select class='select2' id='contact_payments__id' name='contact_payments[][id]'></select></div><div class='split-contact'><input class='contact-amount' name='contact_payments[][amount]' placeholder='Enter Amount' type='text'></div><aside><span class='remove-contact'>-</span><span class='add-contact'>+</span></aside></li>")
    select_div = $(".split-contact:first").clone()
    new_div.find(".split-contact:first" ).replaceWith(select_div)
    $("#split-contact-list").append new_div
    # new_div.autocomplete(autocomp_opts)
    show_hide_plus_minus ".add-contact"

  $("#new_split_payment").on "click", ".remove-contact", ->
    $(this).parent().parent().remove() if $(".split-contact-row").length > 1
    show_hide_plus_minus ".add-contact"

  # TODO get the autocomplete stuff on page load
  # $j('.users_with_autocomplete').autocomplete(autocomp_opts)

