var $j = jQuery.noConflict();

$j(document).ready(function() {

    // page is now ready, initialize the calendar...
    $j('#calendar').fullCalendar({
      dayClick: function(day) {
          alert(day);
      }
    });

});
