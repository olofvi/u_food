function initiateMap () {
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: 57.7089,
        lng: 11.9746
    });
    performGeolocation();
};

function performGeolocation(lat, lng) {
    var latitude;
    var longitude;
    var testing_env = $('#map').data().testEnv;
    if (testing_env === false) {
        GMaps.geolocate({
            success: function (position) {
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;
                map.setCenter(latitude, longitude);
                map.addMarker({
                    lat: position.coords.latitude,
                    lng: position.coords.longitude,
                    title: 'You are here',
                    infoWindow: {
                        content: '<p>You are here!</p>'
                    }
                });
            },
            error: function (error) {
                alert('Geolocation failed: ' + error.message);
            },
            not_supported: function () {
                alert('Your browser does not support geolocation');
            }
        });
    } else {
        latitude = lat || 59.334591;
        longitude = lng || 18.063240;
        map.setCenter(latitude, longitude);
    }
}