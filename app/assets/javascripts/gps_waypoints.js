const loadVehicles = (map) => {
  fetch('http://localhost:3000/gps_waypoints/last_vehicles_location')
  .then(res => res.json())
  .then((data) => {
    showVehiclesLastGpsWaypoints(data.vehicles, map)
  })
  .catch((error) => {
    console.log(error.message)
  });
};

const showVehiclesLastGpsWaypoints = (vehicles, map) => {
  const infowindow = new google.maps.InfoWindow();
  vehicles.forEach(vehicle => {
    const marker = new google.maps.Marker({
      position: new google.maps.LatLng(vehicle.latitude, vehicle.longitude),
      map: map
    });
    google.maps.event.addListener(marker, 'click', ((marker) => {
      return () => {
        infowindow.setContent(vehicle.identifier + "\n" + vehicle.sent_at);
        infowindow.open(map, marker);
      }
    })(marker));
  });
};

const initMap = () => {
  const mapOptions = {
    zoom: 9,
    center: { lat: -33.445, lng: -70.669 },
  };
  const map = new google.maps.Map(document.getElementById('map'), mapOptions);
  loadVehicles(map);
};