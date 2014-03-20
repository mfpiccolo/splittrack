(($) ->
  "use strict"
  methods = init: (options) ->
    defaults =
      top: "auto"
      autoOpen: false
      overlayOpacity: 0.5
      overlayColor: "#000"
      overlayClose: true
      overlayParent: "body"
      closeOnEscape: true
      closeButtonClass: ".close"
      transitionIn: ""
      transitionOut: ""
      onOpen: false
      onClose: false
      zIndex: ->
        ((value) ->
          (if value is -Infinity then 0 else value + 1)
        ) Math.max.apply(Math, $.makeArray($("*").map(->
          $(this).css "z-index"
        ).filter(->
          $.isNumeric this
        ).map(->
          parseInt this, 10
        )))

      updateZIndexOnOpen: true

    options = $.extend(defaults, options)
    @each ->
      o = options
      $overlay = $("<div class=\"lean-overlay\"></div>")
      $modal = $(this)

      # When updateZIndexOnOpen is set to true, we avoid computing the z-index on initialization,
      # because the value would be replaced when opening the modal.
      $overlay.css(
        display: "none"
        position: "fixed"
        "z-index": ((if o.updateZIndexOnOpen then 0 else o.zIndex()))
        top: 0
        left: 0
        height: "100%"
        width: "100%"
        background: o.overlayColor
        opacity: o.overlayOpacity
        overflow: "auto"
      ).appendTo o.overlayParent
      $modal.css
        display: "none"
        position: "fixed"

        # When updateZIndexOnOpen is set to true, we avoid computing the z-index on initialization,
        # because the value would be replaced when opening the modal.
        "z-index": ((if o.updateZIndexOnOpen then 0 else o.zIndex() + 1))
        left: 50 + "%"
        top: (if parseInt(o.top, 10) > -1 then o.top + "px" else 50 + "%")

      $modal.bind "openModal", ->
        overlayZ = (if o.updateZIndexOnOpen then o.zIndex() else parseInt($overlay.css("z-index"), 10))
        modalZ = overlayZ + 1
        $modal.removeClass(o.transitionOut).addClass o.transitionIn  if o.transitionIn isnt "" and o.transitionOut isnt ""
        $modal.css
          display: "block"
          "margin-left": -($modal.outerWidth() / 2) + "px"
          "margin-top": ((if parseInt(o.top, 10) > -1 then 0 else -($modal.outerHeight() / 2))) + "px"
          "z-index": modalZ

        $overlay.css
          "z-index": overlayZ
          display: "block"


        # onOpen callback receives as argument the modal window
        o.onOpen $modal[0]  if o.onOpen and typeof o.onOpen is "function"


      $modal.bind "closeModal", ->
        if o.transitionIn isnt "" and o.transitionOut isnt ""
          $modal.removeClass(o.transitionIn).addClass o.transitionOut
          $modal.one "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", ->
            $modal.css "display", "none"
            $overlay.css "display", "none"


        else
          $modal.css "display", "none"
          $overlay.css "display", "none"

        # onClose callback receives as argument the modal window
        o.onClose $modal[0]  if o.onClose and typeof o.onClose is "function"



      # Close on overlay click
      $overlay.click ->
        $modal.trigger "closeModal"  if o.overlayClose


      $(document).keydown (e) ->

        # ESCAPE key pressed
        $modal.trigger "closeModal"  if o.closeOnEscape and e.keyCode is 27



      # Close when button pressed
      $modal.on "click", o.closeButtonClass, (e) ->
        $modal.trigger "closeModal"
        e.preventDefault()



      # Automatically open modal if option set
      $modal.trigger "openModal"  if o.autoOpen



  $.fn.easyModal = (method) ->

    # Method calling logic
    methods[method].apply(this, Array::slice.call(arguments_, 1))  if methods[method]
    methods.init.apply(this, arguments_)  if typeof method is "object" or not method
    $.error "Method " + method + " does not exist on jQuery.easyModal"



) jQuery
