<head>
    <link href="../../Content/Menu.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCMrc1-qJQzZlCaIwNFJkoPrWc6PGNPhds&sensor=false">
    </script>
    <script>
        var directionDisplay;
        var directionsService = new google.maps.DirectionsService();

        function openClose(id) {
            var obj = "";
            // Check browser compatibility
            if (document.getElementById)
                obj = document.getElementById(id).style;
            else if (document.all)
                obj = document.all[id];
            else if (document.layers)
                obj = document.layers[id];
            else
                return 1;
            // Do the magic 
            if (obj.display == "")
                obj.display = "none";
            else if (obj.display != "none")
                obj.display = "none";
            else
                obj.display = "block";
        }

        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var mapOptions =
            {
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

        function getDate() {
            promt("")
            var start = document.getElementById("startDate").value;
            var startDt = document.getElementById("startDate").toString;
            promt(startDt);
            document.right('<b> ' + start + '</b>');
            var end = document.getElementById("endDate").value;
            //if (isValidDates(start, end)) 
            {
                window.promt(startDT);
                window.promt(end);
            }
        }

        function isValidDates(start, end) {
            if (start.getFullYear() > end.getFullYear())
                return false;
            else return true;
        }

        function calcRoute() {
            //promt('1');
            //getDate();


            var countOfMuseums = 0;
            var newWays = [];
            var isStart = true;
            var starting;
            var ending;
            for (var i = 0; i < 8; i++) {
                if (document.getElementById("monuments" + i).checked) {
                    countOfMuseums++;
                    if (isStart) {
                        starting = document.getElementById("monuments" + i).value;
                        isStart = false;
                    } else {
                        ending = document.getElementById("monuments" + i).value;

                        newWays.push({
                            location: document.getElementById("monuments" + i).value,
                            stopover: true
                        });
                    }

                }
            }
            var days = parseInt(document.getElementById("days").value);

            var MPD = Math.ceil(countOfMuseums / days);

            var selectedMode = document.getElementById("mode").value;
            
            var request = {
                origin: starting,
                destination: ending,
                waypoints: newWays,
                optimizeWaypoints: true,
                travelMode: google.maps.TravelMode[selectedMode]
                //travelMode: google.maps.TravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    // убрать под спойлер
                    var summaryPanel = document.getElementById("directions_panel");
                    summaryPanel.innerHTML = "<b>Наше предложение по посещению выбранных достопримечательностей</b><br /><br />";
                    // For each route, display summary information.
                    var count = 1;
                    for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
                        if (routeSegment == 1) {
                            summaryPanel.innerHTML += "<b>День №" + count++ + "</b><br />";
                        }
                        if (routeSegment % MPD == 0) summaryPanel.innerHTML += "<b>День №" + count++ + "</b><br />";
                        summaryPanel.innerHTML += "<b>Участок пути: " + routeSegment + "</b><br />";
                        summaryPanel.innerHTML += route.legs[i].start_address + "<br />" + " до " + "<br />";
                        summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
                        summaryPanel.innerHTML += route.legs[i].duration.text + "<br />";
                        summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />";
                    }
                }
            });
        }
    </script>
</head>
<body onload="initialize()">
    <div id="banner">
        <a href="<%= Url.Action("Index", "Home") %>">
            <img src="../../Img/main_banner.jpg" width="100%" onclick="" />
        </a>
    </div>
    <div id="menu-wrapper">
        <div id="menu">
            <ul>
                <li class="current_page_item">
                    <%: Html.ActionLink("Главная страница", "Index", "Home") %></li>
                <li>
                    <%: Html.ActionLink("Составить маршрут", "Map", "Route") %></li>
                <li>
                    <%: Html.ActionLink("Полезные ссылки", "Links", "Home") %></li>
                <li>
                    <%: Html.ActionLink("Контакты", "Contacts", "Home") %></li>
            </ul>
        </div>
        <!-- end #menu -->
    </div>
    <div id="line_for_register" align="right">
        <%: Html.Partial("_LoginPartial") %>
    </div>
    <script type="text/javascript" src="../../Scripts/calendar_ru.js"></script>
    <form action="">
    </form>
    <strong>Выберите способ передвижения: </strong>
    <select id="mode" onchange="calcRoute();">
        <option value="WALKING">Пешком</option>
        <option value="DRIVING">На машине</option>
    </select>
    <div id="map-canvas" style="float: right; width: 65%; height: 100%;">
    </div>
    <div id="control_panel" style="float: right; width: 35%; text-align: left; padding-top: 20px">
        <div style="margin: 20px; border-width: 2px;">
            Введите количество дней:
            <input type='text' id="days" onkeyup='this.value=parseInt(this.value) | 0' />
            <br />
            <br />
            <b>Выберите достопримечательности:</b><br />
            <input type="checkbox" value="Эрмитаж, spb" id="monuments0" />Эрмитаж
            <br />
            <input type="checkbox" value="Аврора, spb" id="monuments1" />Аврора<br />
            <input type="checkbox" value="Русский музей, spb" id="monuments2" />Русский музей<br />
            <input type="checkbox" value="Казанский собор, spb" id="monuments3" />Казанский
            собор<br />
            <input type="checkbox" value="Домик Петра Первого, spb" id="monuments4" />Домик
            Петра Первого<br />
            <input type="checkbox" value="Петропавловская крепость, spb" id="monuments5" />Петропавловская
            крепость<br />
            <input type="checkbox" value="Спас на крови, spb" id="monuments6" />Спас на крови<br />
            <input type="checkbox" value="Исаакиевский собор, spb" id="monuments7" />Исаакиевский
            собор<br />
            
            <br>
            <input type="submit" value="ОК" onclick="calcRoute();">
        </div>
        <input type="button" onclick="openClose('1')" value="Подробности маршрута" />
        <div class="spoilerbox" id="1" style="display: none;">
            
            <div id="directions_panel" style="margin: 20px; background-color: #f5fffa;" />
        
        </div>
        <div id="center">
        <div id="map-canvas" style="float: right; width: 83%; height: 83%">
        </div>
        <!--style="float: center; width: 65%; height: 100%;"-->
    </div>
</body>
