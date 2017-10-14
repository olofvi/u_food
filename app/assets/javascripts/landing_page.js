function initiateMap () {
    map = GMaps({
        div: '#map',
        zoom: 15,
        lat: 57.7089,
        lng: 11.9746
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
            },
            error: function (error) {
                alert('Geolocation failed: ' + error.message);
            },
            not_supported: function () {
                alert('Your browser does not support geolocation');
            }
        });
        var restaurant = $("#restaurants_addresses").data("lat");
        // var restaurant = <%= array_or_string_for_javascript(@restaurant_list) %>;
        for (var i = 0; i < restaurant.length; i++){
            GMaps.geocode({
                address: restaurant.address,
                callback: function(results, status) {
                    if (status == 'OK') {
                        var latlng = results[0].geometry.location;
                        map.setCenter(latlng.lat(), latlng.lng());
                        map.addMarker({
                            lat: latlng.lat(),
                            lng: latlng.lng(),
                            title: restaurant.name,
                            infoWindow: {
                                content: '<p>This is a restaurant!</p>'
                            }
                        });
                    }
                }
            });
        }
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
        // var restaurant = $("#restaurants_addresses").data("lat");
        var restaurant = [{name: "Thai", address: "Valhallavägen 49 Stockholm"}];
        // var restaurant = <%= array_or_string_for_javascript(@restaurant_list) %>;
        // for (var i = 0; i < restaurant.length; i++){
            GMaps.geocode({
                address: restaurant.address,
                callback: function(results, status) {
                    if (status == 'OK') {
                        var latlng = results[0].geometry.location;
                        map.setCenter(latlng.lat(), latlng.lng());
                        map.addMarker({
                            lat: latlng.lat(),
                            lng: latlng.lng(),
                            title: restaurant.name,
                            infoWindow: {
                                content: '<p>This is a restaurant!</p>'
                            }
                        });
                    }
                }
            });
        // }
    }

}