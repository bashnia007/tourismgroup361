<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Составить маршрут</title>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
    <link href="../../Content/Menu.css" rel="stylesheet" type="text/css" />
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCMrc1-qJQzZlCaIwNFJkoPrWc6PGNPhds&sensor=false">
    </script>
    <script>
        var directionDisplay;
        var directionsService = new google.maps.DirectionsService();
        
        function openClose(id)
        {
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

        function initialize()
        {
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

        function calcRoute()
        {
            var countOfMuseums = 0;
            var newWays = [];
            var isStart = true;
            var starting;
            var ending;
            for (var i = 0; i < 8; i++)
            {
                if (document.getElementById("monuments" + i).checked)
                {
                    countOfMuseums++;
                    if (isStart)
                    {
                        starting = document.getElementById("monuments" + i).value;
                        isStart = false;
                    } else
                    {
                        ending = document.getElementById("monuments" + i).value;

                        newWays.push({
                            location: document.getElementById("monuments" + i).value,
                            stopover: true
                        });
                    }
                }

            }
            newWays.pop();
            //alert(ending)
            var days = parseInt(document.getElementById("days").value);
            if (countOfMuseums <= 1) alert("Отметьте более одного музея", "арл");
            else if (days > countOfMuseums) alert("Количество дней больше, чем количество музеев!");
            
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
            directionsService.route(request, function (response, status)
            {
                if (status == google.maps.DirectionsStatus.OK)
                {
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                    // убрать под спойлер
                    var summaryPanel = document.getElementById("directions_panel");
                    summaryPanel.innerHTML = "<b>Наше предложение по посещению выбранных достопримечательностей</b><br /><br />";
                    // For each route, display summary information.
                    var dayCount = 1;

                    var routeSegment = 1;
                    for (var i = 0; i < route.legs.length; i++)
                    {
                        //normal user
                        if (days <= countOfMuseums)
                        {
                            if (i % MPD == 0) summaryPanel.innerHTML += "<b>День №" + dayCount++ + "</b><br />";
                            if ((i == route.legs.length - 1) || (i + 1) % MPD > 0) {
                                summaryPanel.innerHTML += "<b>Участок пути: " + routeSegment++ + "</b><br />";
                                summaryPanel.innerHTML += route.legs[i].start_address + "<br />" + " до " + "<br />";
                                summaryPanel.innerHTML += route.legs[i].end_address + "<br />";
                                summaryPanel.innerHTML += route.legs[i].duration.text + "<br />";
                                summaryPanel.innerHTML += route.legs[i].distance.text + "<br /><br />";
                            }
                        }
                        else //user is stupid
                        {
                            summaryPanel.innerHTML += "<b>День №" + dayCount++ + "</b><br />";
                            summaryPanel.innerHTML += route.legs[i].start_address + "<br /><br/>";
                        }
                    }
                }
            });
        }
    </script>
</head>
<body onload="initialize()">
    <div id="banner">
        <a href="<%= Url.Action("Index", "Home") %>">
            <img src="../../Img/main_banner.jpg" width="100%" height="25%" onclick="" />
        </a>
    </div>
    <div id="menu-wrapper">
        <div id="menu">
            <ul>
                <li class="current_page_item">
                    <%: Html.ActionLink("Главная страница", "Index", "Home") %></li>
                <li>
                    <%: Html.ActionLink("Стандартный маршрут", "Map", "Route") %></li>
                <li>
                    <%: Html.ActionLink("Свой маршрут", "OwnerRouteTypes", "Route") %></li>
                <li>
                    <%: Html.ActionLink("Полезные ссылки", "Links", "Home") %></li>
                <li>
                    <%: Html.ActionLink("Контакты", "Contacts", "Home") %></li>
            </ul>
        </div>
    </div>
    <!---menu-wrapper end--->
    <div id="container">
        <div id="inform_panel">
            <div id="control_panel" style="width: 35%; text-align: justify; min-width: 300px">
                <div style="border-width: 2px;">
                    <br />
                    <strong>Выберите способ передвижения: </strong>
                    <select id="mode" onchange="calcRoute();">
                        <option value="WALKING">Пешком</option>
                        <option value="DRIVING">На машине</option>
                    </select>
                    <br />
                    <br />
                    <b>Введите количество дней:</b>
                    <input type='text' id="days" onkeyup='this.value=parseInt(this.value) | 0' style="width: 10%" />
                    <br />
                    <i></i>
                    <br />
                    <b>Выберите достопримечательности:</b>
                    <br />
                    <input type="checkbox" value="Эрмитаж, spb" id="monuments0" />
                    Эрмитаж<br />
                    <input type="checkbox" value="Аврора, spb" id="monuments1" />
                    Аврора<br />
                    <input type="checkbox" value="Русский музей, spb" id="monuments2" />
                    Русский музей<br />
                    <input type="checkbox" value="Казанский собор, spb" id="monuments3" />
                    Казанский собор<br />
                    <input type="checkbox" value="Домик Петра Первого, spb" id="monuments4" />
                    Домик Петра Первого<br />
                    <input type="checkbox" value="Петропавловская крепость, spb" id="monuments5" />
                    Петропавловская крепость<br />
                    <input type="checkbox" value="Спас на крови, spb" id="monuments6" />
                    Спас на крови<br />
                    <input type="checkbox" value="Исаакиевский собор, spb" id="monuments7" />
                    Исаакиевский собор<br />
                    <input type="submit" value="ОК" onclick="calcRoute();"><br />
                    <br />
                    <input type="button" onclick="openClose('1')" value="Подробности маршрута" />
                </div>
            </div>
        </div>
        <!-- inform-panel end -->
        <div id="cart_panel">
            <div id="map-canvas" style="width: 100%; height: 68%; min-width: 465px; min-height: 390px">
            </div>
            <div class="spoilerbox" id="1" style="display: none; float: right;">
                <div id="directions_panel" style="background-color: #f5fffa;" />
            </div>
        </div>
        <!--cart_panel end-->
    </div>
    <!--container end-->
</body>
</html>
