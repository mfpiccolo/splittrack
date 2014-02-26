jQuery ($) ->

  show_hide_plus_minus = (scan) ->
    $(scan).each (index, s) ->
      $(s).hide()

    $(".add-contact:last").show()
    $(".remove-contact:first").show()

  # if /shipping_estimate/i.test(window.location)
  #   refresh_package_row_colors ".package"
  #   show_hide_plus_minus ".add-package"
  #   $(".remove-package:last").hide()  if $("#packages-table tr").length is 3
  #   refresh_amount_cents $("#shipping_estimate_margin")[0]  if $("#shipping_estimate_amount_cents").length > 0
  #   check_addresses $("#shipping_estimate_purchase_order_id")[0]

  $(".add-contact").click ->
    alert "something"
    $("#contacts").prepend "<div class='small-5 columns'><input class='contact-name' name='contact[][name]' placeholder='Choose a contact' type='text'></div><div class='small-5 columns'><input class='contact-amount' name='contact[][amount]' placeholder='Enter Amount' type='text'></div><div class=small-1 columns'><span class='add-contact'>+</span></div>"
    # refresh_package_row_colors ".package"
    # show_hide_plus_minus ".add-package"
    # $("#shipping-estimate-preview").hide()

  # $(".remove-package").live "click", "#packages-table", (e) ->
  #   $(this).parent().parent().remove()  if $("#packages-table tr").length > 3
  #   refresh_package_row_colors ".package"
  #   show_hide_plus_minus ".add-package"
  #   $("#shipping-estimate-preview").hide()


