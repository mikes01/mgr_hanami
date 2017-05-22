var pointTypes = ["część miasta", "miasto", "wieś"]
var lineTypes = ["residential", "secondary", "secondary_link", "primary", "primary_link",
        "tertiary", "tertiary_link", "living_street", "service"]
var polygonType = "3"

$(document).ready(function() {
    $(".select2-input").select2({
      templateResult: formatState,
      templateSelection: formatState,
      allowClear: true,
      placeholder: "Select a polygon type"
    })

    $("#point_types").val(pointTypes).trigger("change")
    $("#line_types").val(lineTypes).trigger("change")
    $("#polygon_type").val(polygonType).trigger("change")
});

$(document).on('click', '#refresh-map', function(e){
  e.preventDefault();

  pointTypes = $("#point_types").val()
  loadPoints()

  lineTypes = $("#line_types").val()
  loadLines()

  polygonType = $("#polygon_type").val()
  loadPolygons()
});


