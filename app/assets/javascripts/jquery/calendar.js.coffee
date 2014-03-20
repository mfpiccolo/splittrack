(($) ->
  reload_calendar = ->
    source = new Array()
    viewable_calendars = $("input:checkbox:checked.visable_calendars").map(->
      @value
    ).get().join(",")
    calendar_url = "/payment_instances.json?calendar_ids=" + viewable_calendars
    new_payment_link = '#{new_payment_path}'
    $("#calendar").fullCalendar
      dayClick: (date, allDay, jsEvent, view) ->

        # document.location.href=new_payment_link + "?start_date=" + date;
        # $.UIGoToArticle('#split-payment');
        $("#modal2").show()
        return

      header:
        left: "prev,today,next"
        center: "title"
        right: "month,agendaWeek,agendaDay"

      selectable: true
      selectHelper: true
      editable: false
      ignoreTimezone: false
      select: @select
      eventClick: @eventClick
      eventDrop: @eventDropOrResize
      eventSources: [
        url: calendar_url
        data:
          custom_param1: "something"
          custom_param2: "somethingelse"

        error: ->
          alert "there was an error while fetching payments!"
          return
      ]
      eventResize: @eventDropOrResize
      timeFormat: "h:mmtt{ - h:mmtt} "

    return
  reload_calendar()

  # page is now ready, initialize the calendar...
  # $('#calendar').fullCalendar({
  #   dayClick: function(day) {
  #       alert(day);
  #   }
  # });
  $ ->
    $(".datepicker").datepicker dateFormat: "yy-mm-dd"
    return

  return
) jQuery
