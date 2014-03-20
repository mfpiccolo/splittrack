(($) ->
  $(".button.done").on "singletap", ->
    $("#new_split_payment")[0].submit()

  $("#add-contact").on "singletap", ->
    $.UIGoToArticle "#add-contacts-form"
) jQuery
