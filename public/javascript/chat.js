var ws = new WebSocket('ws://' + window.location.host + window.location.pathname);
var username;

$('#textSubmit').click(function(){
  ws.send($('#m').val())
  $('#m').val('');
})

ws.onmessage = function(message){
  var user = JSON.parse(message.data)
  if(user.message === ' has joined the room'){
    $('#messages').append($('<li>').text(user.name + user.message));
  } else if (user.message === ' has left the room'){

  } else {
    $('#messages').append($('<li>').text(user.name + ': ' + user.message));
  }
};
