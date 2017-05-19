var map = null;

$(document).ready(function() {
  map = L.map('map', {
      center: [51.1000000, 17.0333300],
      zoom: 16
  });

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

  loadPlaces();

  map.on('moveend', loadPlaces);

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