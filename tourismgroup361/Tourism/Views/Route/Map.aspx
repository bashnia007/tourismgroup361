
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCMrc1-qJQzZlCaIwNFJkoPrWc6PGNPhds&sensor=false">
        </script>
        <script>
            var directionDisplay;
            var directionsService = new google.maps.DirectionsService();

            function initialize() {
                directionsDisplay = new google.maps.DirectionsRenderer();
                var mapOptions = {
                    zoom: 7,
                    mapTypeId: google.maps.MapTypeId.ROADMAP,
                    center: new google.maps.LatLng(41.850033, -87.6500523)
                };
                var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
                directionsDisplay.setMap(map);
                directionsDisplay.setPanel(document.getElementById('directions-panel'));

                var control = document.getElementById('control');
                control.style.display = 'block';
                map.controls[google.maps.ControlPosition.TOP].push(control);
            }

            function calcRoute() {
                var start = document.getElementById('start').value;
                var end = document.getElementById('end').value;
                var request = {
                    origin: start,
                    destination: end,
                    travelMode: google.maps.DirectionsTravelMode.DRIVING
                };
                directionsService.route(request, function (response, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        directionsDisplay.setDirections(response);
                    }
                });
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </head>
    <body onload="initialize()">
        <div id="control">
            <strong>Start:</strong>
            <select id="start" onchange="calcRoute();">
                <option value="chicago, il">Chicago</option>
                <option value="st louis, mo">St Louis</option>
            </select>
            <strong>End:</strong>
            <select id="end" onchange="calcRoute();">
                <option value="chicago, il">Chicago</option>
                <option value="st louis, mo">St Louis</option>
            </select>
        </div>
        <div id="map-canvas" style="float: left; width: 70%; height: 100%">
        </div>
        <div id="directions-panel" style="float: right; width: 30%; height: 100%">
        </div>
    </body>
</asp:Content>
