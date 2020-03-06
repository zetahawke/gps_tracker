function loadVehiclesLastGpsWaypoints(vehicles, map) {
  vehicles.array.forEach(vehicle => {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(vehicle.latitude, vehicle.longitude),
      map: map
    });
    google.maps.event.addListener(marker, 'click', (function(marker) {
      return function() {
        infowindow.setContent(vehicle.identifier);
        infowindow.open(map, marker);
      }
    })(marker));
  });
}

function initMap(vehicles) {
  var mapOptions = {
    zoom: 9,
    center: { lat: -33.445, lng: -70.669 },
  };
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  loadVehiclesLastGpsWaypoints(vehicles, map);
}