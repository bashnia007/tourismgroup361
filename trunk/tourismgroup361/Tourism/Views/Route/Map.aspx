<head>
    <link href="../../Content/Menu.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCMrc1-qJQzZlCaIwNFJkoPrWc6PGNPhds&sensor=false">
    </script>
    <script>
        var directionDisplay;
        var directionsService = new google.maps.DirectionsService();

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
            var selectedMode = document.getElementById("mode").value;
            var start = document.getElementById("start").value;
            var end = document.getElementById("end").value;
            var waypts = [];
            var checkboxArray = document.getElementById("waypoints");
            var startSubway, endSubway;
            waypts.push({
                location: start,
                stopover: true
            });
            waypts.push({
                location: end,
                stopover: true
            });

            switch (start) {
                case 'Эрмитаж, spb':
                    startSubway = 'метро Адмиралтейская, spb'; break;
                case 'Аврора, spb':
                    startSubway = 'метро Горьковская, spb'; break;
                case 'Русский музей, spb':
                    startSubway = 'метро Невский проспект, spb'; break;
                case 'Казанский собор, spb':
                    startSubway = 'метро Невский проспект, spb'; break;
                case 'Домик Петра Первого, spb':
                    startSubway = 'метро Горьковская, spb'; break;
                case 'Петропавловская крепость, spb':
                    startSubway = 'метро Горьковская, spb'; break;
                case 'Спас на крови, spb':
                    startSubway = 'метро Невский проспект, spb'; break;
                case 'Исаакиевский собор, spb':
                    startSubway = 'метро Адмиралтейская, spb'; break;
                case "Медный всадник, spb":
                    startSubway = 'метро Адмиралтейская, spb'; break;
                default:
                    startSubway = 'метро Невский проспект, spb';
            }

            switch (end) {
                case 'Эрмитаж, spb':
                    endSubway = 'метро Адмиралтейская, spb'; break;
                case 'Аврора, spb':
                    endSubway = 'метро Горьковская, spb'; break;
                case 'Русский музей, spb':
                    endSubway = 'метро Невский проспект, spb'; break;
                case 'Казанский собор, spb':
                    endSubway = 'метро Невский проспект, spb'; break;
                case 'Домик Петра Первого, spb':
                    endSubway = 'метро Горьковская, spb'; break;
                case 'Петропавловская крепость, spb':
                    endSubway = 'метро Горьковская, spb'; break;
                case 'Спас на крови, spb':
                    endSubway = 'метро Невский проспект, spb'; break;
                case 'Исаакиевский собор, spb':
                    endSubway = 'метро Адмиралтейская, spb'; break;
                //case "Медный всадник, spb":
                //    endSubway = 'метро Адмиралтейская, spb'; break;
                default:
                    endSubway = 'метро Невский проспект, spb';
            }

            for (var i = 0; i < checkboxArray.length; i++) {
                if (checkboxArray.options[i].selected == true) {
                    waypts.push({
                        location: checkboxArray[i].value,
                        stopover: true
                    });
                }
            }

            var request = {
                origin: startSubway,
                destination: endSubway,
                waypoints: waypts,
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
                    summaryPanel.innerHTML = "";
                    // For each route, display summary information.
                    for (var i = 0; i < route.legs.length; i++) {
                        var routeSegment = i + 1;
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
        <p>
            Выберите дни, в которые вы будете осматривать достопримечательности
            <br/>
            с
            <input type="text" id="startDate" value="dd-mm-yy" onfocus="this.select();lcs(this)"
                onclick="event.cancelBubble=true;this.select();lcs(this)" />
            <br/>
            по
            <input type="text" id="endDate" value="dd-mm-yy" onfocus="this.select();lcs(this)"
                onclick="event.cancelBubble=true;this.select();lcs(this)" />
        </p>
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
                <b>Начало пути:</b>
                <select id="start">
                
                    <option value="метро Адмиралтейская, spb">Адмиралтейская</option>
                    <option value="метро Горьковская, spb">Горьковская</option>
                
                    <option value="Эрмитаж, spb">Эрмитаж</option>
                    <option value="Аврора, spb">Аврора</option>
                    <option value="Русский музей, spb">Русский музей</option>
                    <option value="Казанский собор, spb">Казанский собор</option>
                    <option value="Домик Петра Первого, spb">Домик Петра Первого</option>
                    <option value="Петропавловская крепость, spb">Петропавловская крепость</option>
                    <option value="Спас на крови, spb">Спас на Крови</option>
                    <option value="Исаакиевский собор, spb">Исаакиевский собор</option>
                </select>
            
                <br>
                <b>Ключевые точки:</b>
                <br>
                <i>(Для выбора нескольких точек используйте Ctrl)</i>
                <br>
                <select multiple id="waypoints" size="8">
                    <option value="Аврора, spb">Аврора</option>
                    <option value="Русский музей, spb">Русский музей</option>
                    <option value="Казанский собор, spb">Казанский собор</option>
                    <option value="Домик Петра Первого, spb">Домик Петра Первого</option>
                    <option value="Петропавловская крепость, spb">Петропавловская крепость</option>
                    <option value="Спас на крови, spb">Спас на Крови</option>
                    <option value="Исаакиевский собор, spb">Исаакиевский собор</option>
                    <option value="Эрмитаж, spb">Эрмитаж</option>
                </select>
                <br>
                <b>Конец пути:</b>
                <select id="end">
                    <option value="Аврора, spb">Аврора</option>
                    <option value="Русский музей, spb">Русский музей</option>
                    <option value="Казанский собор, spb">Казанский собор</option>
                    <option value="Домик Петра Первого, spb">Домик Петра Первого</option>
                    <option value="Петропавловская крепость, spb">Петропавловская крепость</option>
                    <option value="Спас на крови, spb">Спас на Крови</option>
                    <option value="Исаакиевский собор, spb">Исаакиевский собор</option>
                    <option value="Эрмитаж, spb">Эрмитаж</option>
                </select>
            
                <br>
                <input type="submit" onclick="calcRoute();">
            </div>
            <div id="directions_panel" style="margin: 20px; background-color: #f5fffa;">
            </div>
        </div>
</body>