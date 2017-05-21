var renderedPoints = [];
wkt = new Wkt.Wkt();

loadPlaces = function() {
  parameters = getMapBounds()
  parameters.object_types = pointTypes
  $.get("points", { data: parameters },
    function (data) {
      if(renderPoints) {
        var markers = []
        data.forEach(function(point) {

          var markerHtmlStyles =
            "background-color: " + point.color +"; \
            width: 3rem;\
            height: 3rem;\
            display: block;\
            left: -1.5rem;\
            top: -1.5rem;\
            position: relative;\
            border-radius: 3rem 3rem 0;\
            transform: rotate(45deg);\
            border: 1px solid #FFFFFF"

          var icon = L.divIcon({
            className: 'customIcon',
            iconAnchor: [0, -5],
            html: '<span style="' + markerHtmlStyles + '" />'
          })
          markers.push(wkt.read(point.coordinates_text).toObject({title: point.name, icon: icon})
            .on('click', L.bind(onPointClick, null, point))
            .bindTooltip(point.name,
            {
              permanent: true,
              direction: 'top'
            }
          ))
        })
        var points = L.layerGroup(markers);
        var overlayMaps = {
          "points": points
        };

        points.addTo(map);
        clearPoints()
        renderedPoints = points;
      }
    });
}

onPointClick = function(point, event) {
  $(".form-horizontal").hide()
  form = $("#point_remote_form.edit")
  form[0].action = "points/" + point.id
  //form.find('a')[0].href = form[0].action
  form.find("#point_name").val(point.name)
  form.find("#point_coordinates").val(point.coordinates_text)
  
  form.find("#point_object_type").val(point.object_type)
  form.find("#point_object_class").val(point.object_class)
  form.find("#point_terc").val(point.terc)
  form.find("#point_voivodeship").val(point.voivodeship)
  form.find("#point_county").val(point.county)
  form.find("#point_commune").val(point.commune)
  form.show()
}

clearPoints = function() {
  map.removeLayer(renderedPoints);
}