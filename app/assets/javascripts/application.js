//= require jquery
//= require jquery_ujs
//= require_tree .

$(window).load(function(){
  $('.state').on('click', function(){
    $.ajax({
      data: ,
      dataType: 'new_state.json',
      url: '/new_state',
      success: function(data) {
        alert('Load was performed.');
      }
    });
  });
});