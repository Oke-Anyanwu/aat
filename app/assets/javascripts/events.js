$(function() {
  $("#calendar").fullCalendar({
    height: 800,
    header: { left: null, center: 'title' },
    events: function(start, end, callback) {
      $.ajax({
        url: "/monthly_events.json",
        dataType: 'json',
        data: {
          start: Math.round(start.getTime() / 1000),
          end: Math.round(end.getTime() / 1000)
        },
        success: function(events) {
          callback(events);
        }
      });
    }
  });
});
