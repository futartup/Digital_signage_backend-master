

var scheduled_videos = {};
document.addEventListener('DOMContentLoaded', function () {
  var Calendar = FullCalendar.Calendar;
  var Draggable = FullCalendar.Draggable;

  var containerEl = document.getElementById('external-events');
  var calendarEl = document.getElementById('calendar');
  var checkbox = document.getElementById('drop-remove');

  // initialize the external events
  // -----------------------------------------------------------------

  new Draggable(containerEl, {
    itemSelector: '.fc-event',
    eventData: function (eventEl) {
      return {
        title: eventEl.innerText
      };
    }
  });

  // initialize the calendar
  // -----------------------------------------------------------------

  var calendar = new Calendar(calendarEl, {
    schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
    customButtons: {
      myCustomButton: {
        text: 'Create Playlist',
        click: function () {
          const playlist_name = document.getElementById("playlist").value;
          const device = document.getElementById("device");
          const username = document.getElementById("username").value;

          if (device.options[device.selectedIndex].value) {
            var http = new XMLHttpRequest();
            var url = '/api/playlist/?username=' + username;
            http.open('POST', url, true);
            data = JSON.stringify({
              scheduled_videos: scheduled_videos,
              device_uuid: device.options[device.selectedIndex].value,
              playlist: playlist_name
            }),

              //Send the proper header information along with the request
              http.setRequestHeader('Content-type', 'application/json');

            http.onreadystatechange = function () {//Call a function when the state changes.
              if (http.readyState == 4 && http.status == 200) {
                alert("Successfully created the playlist. Now you can view the playlist in the playlist section");
              }
            }
            http.send(data);
          }
          else {
            alert("You must select a device to assign the playlist");
          }
        }
      }
    },
    timeZone: 'UTC',
    headerToolbar: {
      left: 'prev,next myCustomButton',
      center: 'title',
      right: 'timeGridWeek, dayGridMonth'
    },
    editable: true,
    droppable: true, // this allows things to be dropped onto the calendar
    drop: function (info) {
      if (checkbox.checked) {
        // if so, remove the element from the "Draggable Events" list
        info.draggedEl.parentNode.removeChild(info.draggedEl);
      }
    },
    // When the video is dropped into the calendar
    eventReceive: function (info) {
      // alert("Video ID :" + info.event.title + " is added on " + info.event.start.toUTCString());
      // if (!confirm("Are you sure about this change?")) {
      //   info.revert();
      // }
    },
    // State maintaining all the event states
    eventsSet: function (events) {
      scheduled_videos = JSON.stringify(events);
    },
    // When the video is resized into the calendar
    eventResize: function (info) {
      // alert("Video will end at " + info.event.end.toISOString());
      // if (!confirm("is this okay?")) {
      //   info.revert();
      // }
    }

  });

  calendar.render();
});

$('#modal4').on('hidden.bs.modal', function (e) {
  // do something...
  $('#modal4 iframe').attr("src", $("#modal4 iframe").attr("src"));
});


// document.addEventListener('DOMContentLoaded', function() {
//     var calendarEl = document.getElementById('calendar');
//     var calendar = new FullCalendar.Calendar(calendarEl, {
//       editable: true,
//       themeSystem: 'bootstrap',
//       initialView: 'resourceTimelineWeek',
//       dropInfo: function(event){
//             console.log(event);
//       },
//     });
//     calendar.render();
//   });
