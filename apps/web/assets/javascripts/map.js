var map = null;

$(document).ready(function() {
  map = L.map('map', {
      center: [51.1000000, 17.0333300],
      zoom: 16
  });

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

});