function initiateMap() {
    map = GMaps({
        div: '#map',
        zoom: 15,
        lat: 59.334591,
        lng: 18.063240
    });
    performGeolocation();
};

function performGeolocation() {
    var latitude;
    var longitude;
    var testing_env = document.getElementById('map').dataset.testEnv;
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
                    infoWindow: {
                        content: '<p>You are here!</p>'
                    }
                });
                displayRestaurantInProximity(map, latitude, longitude);
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
        displayRestaurantInProximity(map, latitude, longitude);
    }
}

function displayRestaurantInProximity(map, lat, lng) {
    var url = '/restaurants?lat=' + lat + '&lng=' + lng;
    $.getJSON(url, function (response) {
        var restaurants = response.restaurants;
        var grouped = response.grouped;

        restaurants.forEach(function (restaurant) {
            map.addMarker({
                lat: restaurant.latitude,
                lng: restaurant.longitude,
                title: restaurant.name,
                infoWindow: {
                    content: 'Restaurant ' + restaurant.name
                }
            });
        });
        console.log(grouped);
        if (Object.getOwnPropertyNames(grouped).length > 0) {
            $('#restaurant-list').html('');
            Object.keys(grouped).forEach(function (name) {
                var id = name.replace(/\s+/g, '-').toLowerCase();
                $('#restaurant-list').append('<div id="' + id + '">');
                $('#restaurant-list #' + id).append('<h2>' + name + '</h2>');
                grouped[name].forEach(function (restaurant) {
                    $('#restaurant-list #' + id).append('<a href="/restaurants/' + restaurant.id + '"><strong>' + restaurant.name + '</strong></a>');
                    $('#restaurant-list #' + id).append('<p>' + restaurant.address + '</p>');
                    $('#restaurant-list #' + id).append('<p> Approximately ' + (restaurant.distance * 100).toFixed() + " meters from your current location" + '</p>');
                    if (restaurant.description != null) {
                        $('#restaurant-list #' + id).append('<p> Description ' + restaurant.description + '</p>');
                    }
                });
                $('#restaurant-list').append('</div>');

            });

        } else {
            //
            $('#restaurant-list').html('<h2>There are no restaurants near your location</h2>');
        }


    })
}
