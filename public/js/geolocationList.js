  console.log("init");
  // Try HTML5 geolocation
  if(navigator.geolocation) {
    console.log("geolocation");
    navigator.geolocation.getCurrentPosition(function(position) {
      console.log(position);
      var lat = position.coords.latitude;
      var lng = position.coords.longitude;
      console.log("Lat: "+lat+", Long: "+lng);
      $('#latlong').html("Lat: "+lat+", Long: "+lng);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }
}

