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
    var pinImage = new google.maps.MarkerImage('http://maps.google.com/mapfiles/ms/icons/orange-dot.png');
    $.getJSON(url, function (response) {
        var restaurants = response.restaurants;
        var grouped = response.grouped;

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
        //console.log(grouped);
        if (Object.getOwnPropertyNames(grouped).length > 0) {
            $('#restaurant-list').html('');
            Object.keys(grouped).forEach(function (name) {
                var id = name.replace(/\s+/g, '-').toLowerCase();
                $('#restaurant-list').append('<div class="col-md-4" id="' + id + '">');
                $('#restaurant-list #' + id).append('<h2>' + name + '</h2>');
                grouped[name].forEach(function (restaurant) {
                    var content = buildListItem(restaurant);
                    $('#restaurant-list #' + id).append(content);
                });
                $('#restaurant-list').append('</div>');

            });

        } else {
            //
            $('#restaurant-list').html('<h2>There are no restaurants near your location</h2>');
        }
    })
}

function buildListItem(restaurant) {
    var content = '<h3 class="restaurant_list">'
    content = content + '<a href="/restaurants/' + restaurant.id + '"><strong>' + restaurant.name + '</strong></a>';
    content = content + '</h3>';
    if (restaurant.pic_url != null) {
        content = content + '<img src="' + restaurant.pic_url + '">';
    }
    content = content + '<p>' + restaurant.address + '</p>';
    content = content + '<p> Approximately ' + (restaurant.distance * 1000).toFixed() + " meters from your current location" + '</p>'
    if (restaurant.description != null) {
        content = content + '<p> Description ' + restaurant.description + '</p>';
    }

    return content;
}
