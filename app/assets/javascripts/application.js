//= require jquery
//= require jquery_ujs
//= require_tree .

function remove_fields(link) {
        $(link).prev("input[type=hidden]").val("1");
        $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
        var new_id = new Date().getTime();
        var regexp = new RegExp("new_" + association, "g");
        $(link).parent().before(content.replace(regexp, new_id));
}

$(window).load(function(){
  $('.state').on('click', function(){
    $.ajax({
      data: "test",
      dataType: 'new_state.json',
      url: '/new_state',
      success: function(data) {
        alert('Load was performed.');
      }
    });
  });
});