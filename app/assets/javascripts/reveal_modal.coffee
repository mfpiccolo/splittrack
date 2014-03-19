$j = jQuery.noConflict()
$j(document).ready ->
  $j("#modal2").easyModal

  $j(".open-modal").click ->
    $j("#modal2").show()

  $j(".close").click ->
    $j("#modal2").hide()
