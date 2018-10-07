var init_room_lookup;

init_room_lookup = function() {
  $('#room-lookup-form').on('ajax:before', function(event, data, status){
    $('#room-lookup-result').replaceWith(" ");
    //show_spinner();
  })
  $('#room-lookup-form').on('ajax:success', function(event, data, status){
    $("#room-lookup").replaceWith(data);
    init_room_lookup();
  });
  $('#room-lookup-form').on('ajax:after', function(event, data, status){
    //hide_spinner();
  })
  $('#room-lookup-form').on('ajax:error', function(event, xhr, status, error){
    $('#room-lookup-result').replaceWith(" ");
    $('#room-lookup-errors').replaceWith("Room was not found.");
    //hide_spinner();
  });
}

$(document).ready(function(){
  init_room_lookup();
})
