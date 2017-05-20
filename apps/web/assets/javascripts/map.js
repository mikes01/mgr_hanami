var map = null;

$(document).ready(function() {
  map = L.map('map', {
      center: [51.1000000, 17.0333300],
      zoom: 16
  });

  map.createPane('lines');
  map.getPane('lines').style.zIndex = 500;
  map.createPane('polygons');
  map.getPane('polygons').style.zIndex = 400;

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

  loadPlaces();
  loadLines();
  loadPolygons();

  map.on('moveend', loadPlaces);
  map.on('moveend', loadLines);

});

getMapBounds = function() {
  bounds = map.getBounds();
  return {
    north_east_lat: bounds.getNorthEast().lat,
    north_east_lng: bounds.getNorthEast().lng,
    south_west_lat: bounds.getSouthWest().lat,
    south_west_lng: bounds.getSouthWest().lng
  }
}