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
                zoom: 10,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                center: new google.maps.LatLng(59.95, 30.19)
            };
            var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directions_panel'));

            var control = document.getElementById('control');
            control.style.display = 'block';
            map.controls[google.maps.ControlPosition.TOP].push(control);
        }

        function calcRoute() {
            var start = document.getElementById("start").value;
            var end = document.getElementById("end").value;
            var waypts = [];
            var checkboxArray = document.getElementById("waypoints");
            for (var i = 0; i < checkboxArray.length; i++) {
                if (checkboxArray.options[i].selected == true) {
                    waypts.push({
                        location: checkboxArray[i].value,
                        stopover: true
                    });
                }
            }

            var request = {
                origin: start,
                destination: end,
                waypoints: waypts,
                optimizeWaypoints: true,
                travelMode: google.maps.TravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    var summaryPanel = document.getElementById("directions_panel");
                    summaryPanel.innerHTML = "";
                    // For each route, display summary information.
                    for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        summaryPanel.innerHTML += "<b>Участок пути: " + routeSegment + "</b><br />";
                        summaryPanel.innerHTML += route.legs[i].start_address + "<br />" + " до " + "<br />";
                        summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
                        summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />";
                    }
                }
            });
        }
    </script>
</head>
<body onload="initialize()">
    <div>
        <img src="http://www.ilovepetersburg.ru/sites/default/files/history_2/panorama_bashelye_3755x564_01.jpg"
            width="1350" height="150" />
    </div>
    <div id="line_for_register" align="right">
        <%: Html.Partial("_LoginPartial") %>
    </div>
    <div id="map-canvas" style="float: left; width: 65%; height: 100%;">
    </div>
    <div id="control_panel" style="float: right; width: 35%; text-align: left; padding-top: 20px">
        <div style="margin: 20px; border-width: 2px;">
            <b>Начало пути:</b>
            <select id="start">
                <option value="Эрмитаж, spb">Эрмитаж</option>
                <option value="Аврора, spb">Аврора</option>
                <option value="Русский музей, spb">Русский музей</option>
                <option value="Казанский собор, spb">Казанский собор</option>
                <option value="Домик Петра Первого, spb">Домик Петра Первого</option>
                <option value="Петропавловская крепость, spb">Петропавловская крепость</option>
                <option value="Спас на крови, spb">Спас на крови</option>
                <option value="Исаакиевский собор, spb">Исаакиевский собор</option>
                <option value="Медный всадник, spb">Медный всадник</option>
            </select>
            <br>
            <b>Ключевые точки:</b>
            <br>
            <i>(Для выбора нескольких точек используйте Ctrl + ЛКМ)</i>
            <br>
            <select multiple id="waypoints" size="9">
                <option value="Аврора, spb">Аврора</option>
                <option value="Русский музей, spb">Русский музей</option>
                <option value="Казанский собор, spb">Казанский собор</option>
                <option value="Домик Петра Первого, spb">Домик Петра Первого</option>
                <option value="Петропавловская крепость, spb">Петропавловская крепость</option>
                <option value="Спас на крови, spb">Спас на крови</option>
                <option value="Исаакиевский собор, spb">Исаакиевский собор</option>
                <option value="Медный всадник, spb">Медный всадник</option>
                <option value="Эрмитаж, spb">Эрмитаж</option>
            </select>
            <br>
            <b>Конец пути:</b>
            <select id="end">
                <option value="Эрмитаж, spb">Эрмитаж</option>
                <option value="Аврора, spb">Аврора</option>
                <option value="Русский музей, spb">Русский музей</option>
                <option value="Казанский собор, spb">Казанский собор</option>
                <option value="Домик Петра Первого, spb">Домик Петра Первого</option>
                <option value="Петропавловская крепость, spb">Петропавловская крепость</option>
                <option value="Спас на крови, spb">Спас на крови</option>
                <option value="Исаакиевский собор, spb">Исаакиевский собор</option>
                <option value="Медный всадник, spb">Медный всадник</option>
            </select>
            <br>
            <input type="submit" onclick="calcRoute();">
        </div>
        <div id="directions_panel" style="margin: 20px; background-color: #FFEE77;">
        </div>
    </div>
</body>
