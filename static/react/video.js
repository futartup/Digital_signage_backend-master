

var scheduled_videos = {};

document.addEventListener('DOMContentLoaded', function() {
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;
  
    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');
  
    // initialize the external events
    // -----------------------------------------------------------------
  
    new Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText
        };
      }
    });
  
    // initialize the calendar
    // -----------------------------------------------------------------
  
    var calendar = new Calendar(calendarEl, {
      customButtons: {
        myCustomButton: {
          text: 'Create Playlist',
          click: function() {
            const playlist_name = document.getElementById("playlist").value;
            const device = document.getElementById("device");
            const username = document.getElementById("username").value;
            
            if(device.options[device.selectedIndex].value){
              var http = new XMLHttpRequest();
              var url = '/api/playlist/?username='+username;
              http.open('POST', url, true);
              data = JSON.stringify({
                          scheduled_videos: scheduled_videos,
                          device_uuid: device.options[device.selectedIndex].value,
                          playlist: playlist_name
                    }),

              //Send the proper header information along with the request
              http.setRequestHeader('Content-type', 'application/json');

              http.onreadystatechange = function() {//Call a function when the state changes.
                  if(http.readyState == 4 && http.status == 200) {
                      alert("Successfully created the playlist. Now you can view the playlist in the playlist section");
                  }
              }
              http.send(data);
            }
            else{
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
      drop: function(info) {
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      },
      // When the video is dropped into the calendar
      eventReceive: function(info) {       
        // alert("Video ID :" + info.event.title + " is added on " + info.event.start.toUTCString());
        // if (!confirm("Are you sure about this change?")) {
        //   info.revert();
        // }
      },
      // State maintaining all the event states
      eventsSet: function(events) {
        scheduled_videos = JSON.stringify(events);
      },
      // When the video is resized into the calendar
      eventResize: function(info) {
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

$(document).ready(function() {
    const container = document.getElementById('video-list');
    var videos = JSON.parse(localStorage.getItem('users'));
    videos.forEach((d, idx) => {
        // Create card element
        const card = document.createElement('div');
        card.classList = 'card-body';

        // Construct card content
        const content = `
                        <div class="card orange lighten-2 fc-event draggable">
                            <div class="view overlay">
                                <img class="card-img-top" src="${d.thumbnail}" alt="video">
                                </div>
                            <div class="card-body pb-0">
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-bold mb-1">${d.id}</h6>
                                </div>
                            </div>
                            
                        </div>
                        `;

        // Append newyly created card element to the container
        container.innerHTML += content;
});

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      editable: true,
      themeSystem: 'bootstrap',
      initialView: 'resourceTimelineWeek',
      dropInfo: function(event){
            console.log(event);
      },
    });
    calendar.render();
  });

var dt_from = "2014/11/01 00:34:44";
var dt_to = "2014/11/24 16:37:43";

$('.slider-time').html(dt_from);
$('.slider-time2').html(dt_to);
var min_val = Date.parse(dt_from)/1000;
var max_val = Date.parse(dt_to)/1000;

function zeroPad(num, places) {
  var zero = places - num.toString().length + 1;
  return Array(+(zero > 0 && zero)).join("0") + num;
}
function formatDT(__dt) {
  var year = __dt.getFullYear();
  var month = zeroPad(__dt.getMonth()+1, 2);
  var date = zeroPad(__dt.getDate(), 2);
  var hours = zeroPad(__dt.getHours(), 2);
  var minutes = zeroPad(__dt.getMinutes(), 2);
  var seconds = zeroPad(__dt.getSeconds(), 2);
  return year + '-' + month + '-' + date + ' ' + hours + ':' + minutes + ':' + seconds;
};


$("#slider-range").slider({
  range: true,
  min: min_val,
  max: max_val,
  step: 10,
  values: [min_val, max_val],
  slide: function (e, ui) {
      var dt_cur_from = new Date(ui.values[0]*1000); //.format("yyyy-mm-dd hh:ii:ss");
      $('.slider-time').html(formatDT(dt_cur_from));

      var dt_cur_to = new Date(ui.values[1]*1000); //.format("yyyy-mm-dd hh:ii:ss");                
      $('.slider-time2').html(formatDT(dt_cur_to));
  }
});
// Deleting the videos
// function remove(video_uuid, username) {
//   alert(video_id);
//   $.ajax({
//       url: "/api/video/" + video_uuid + '/' + '?username='+ username,
//       method: "DELETE",
//       success: function(data, status) {
//         alert(status);
//       },
//       error: function(data, status, error) {
//         alert(error);
//       },
//   });
// }