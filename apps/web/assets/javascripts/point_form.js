$(document).ready(function() {
  $('#point').click(function () {
    $(".form-horizontal").hide()
    $("#point_remote_form.new").show()
    return true;
  });
});

$(document).on('ajax:success', '#point_remote_form.edit', function(e, data, status, xhr){
  if(jQuery.isEmptyObject(data)) {
    return true;
  }
  toastr.success('The point is updated!', 'Success')
  point = wkt.read(data.coordinates).components[0]
  map.setView([point.y, point.x])
  $(".form-horizontal").hide()
}).on('ajax:error', '#point_remote_form.edit', function(e, xhr, status, error){
  $("#edit_point_remote_form_holder").html(xhr.responseJSON.html)
});

$(document).on('ajax:success', '#point_remote_form.edit a', function(e, data, status, xhr){
  toastr.success('The point is deleted!', 'Success')
  loadpoints()
  $(".form-horizontal").hide()
}).on('ajax:error', '#point_remote_form.edit a', function(e, xhr, status, error){
  $("#edit_point_remote_form_holder").html(xhr.responseJSON.html)
});

$(document).on('submit', '#point_remote_form.new', function(e){
  console.log(this);
  e.preventDefault();

  $.ajax({
    type: $(this).attr('method'),
    url: $(this).attr('action'),
    data: $(this).serialize(),
    complete: function (data) {
      console.log(data)
      if(data.status == 200 || data.status == 201) {
        loadPoints()
        toastr.success('New point is added!', 'Success')
        $(".form-horizontal").hide()
      } else {
        toastr.error(data.responseText, 'ERROR')
      }
    },
  });


});