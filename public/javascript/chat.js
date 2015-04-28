var ws = new WebSocket('ws://' + window.location.host + window.location.pathname);
var username;

$('#textSubmit').click(function(){
  ws.send($('#m').val())
  $('#m').val('');
})

ws.onmessage = function(message){
  $('#messages').append($('<li>').text(message.data));
};
