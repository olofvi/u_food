function initiateMap() {
    map = GMaps({
        div: '#map',
        zoom: 12,
        lat: 59.334591,
        lng: 18.063240
    });
    performGeolocation();
};

function performGeolocation() {
    var latitude;
    var longitude;
    var testing_env = document.getElementById('map').dataset.testEnv;
    var pinImage = new google.maps.MarkerImage('http://maps.google.com/mapfiles/ms/icons/red-dot.png');
    if (testing_env === 'false') {
        GMaps.geolocate({
            success: function (position) {
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;
                map.setCenter(latitude, longitude);
                map.addMarker({
                    lat: position.coords.latitude,
                    lng: position.coords.longitude,
                    title: 'You are here',
                    icon: pinImage,
                    infoWindow: {
                        content: '<p>You are here!</p>'
                    }
                });
                displayRestaurantMarkers(map, latitude, longitude);
            },
            error: function (error) {
                alert('Geolocation failed: ' + error.message);
            },
            not_supported: function () {
                alert('Your browser does not support geolocation');
            }
        });
    } else {
        latitude = 59.334591;
        longitude = 18.063240;
        map.setCenter(latitude, longitude);
        map.addMarker({
            lat: latitude,
            lng: longitude,
            title: 'You are here',
            infoWindow: {
                content: '<p>You are here!</p>'
            }
        });
        displayRestaurantMarkers(map, latitude, longitude);
    }
}

function displayRestaurantMarkers(map, lat, lng) {
    var url = '/restaurants?lat=' + lat + '&lng=' + lng;
    var pinImage = new google.maps.MarkerImage('http://maps.google.com/mapfiles/ms/icons/orange-dot.png');
    $.getJSON(url, function (response) {
        var restaurants = response.restaurants;
        restaurants.forEach(function (restaurant) {
            map.addMarker({
                lat: restaurant.latitude,
                lng: restaurant.longitude,
                title: restaurant.name,
                icon: pinImage,
                infoWindow: {
                    content: '<a href="/restaurants/' + restaurant.id + '">' + restaurant.name + '</a>' + '</br>' + restaurant.description
                }
            });
        });
    })
}