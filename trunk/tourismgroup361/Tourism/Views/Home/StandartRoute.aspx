<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Стандартный маршрут
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <!--- <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
    </style> --->
    <div id = "header" align="center"><h1>Получение стандартного маршрута</h1></div>
    <div id = "left">
        <ul>
            <li lang="ru"> <%: Html.ActionLink("Главная страница", "Index") %>
            </li>
            <li> <%: Html.ActionLink("Войти", "LogOn") %></li>
            <li> <%: Html.ActionLink("Регистрация", "Register") %></li>
            <li>
                <%: Html.ActionLink("Составить маршрут", "Index") %>
                <ul>
                    <li> <%: Html.ActionLink("Стандартный маршрут", "StandartRoute") %> </li>
                    <li> <%: Html.ActionLink("Свой маршрут", "OwnerRoute") %> </li>       
                </ul>
            </li>
            <li>
                <%: Html.ActionLink("Карта сайта", "MapOfSite") %>
            </li>
            <li> <%: Html.ActionLink("Контакты", "Contacts") %> </li>
        </ul>
    </div>

    <div id = "center">
        Здесь Вы получите стандартный набор достопримечательностей. 
        Он состоит из следующих ( сделать ListBox'ом)
        Эрмитаж, Петропавловская крепость, Русский музей, Медный всадник, крейсер “Аврора”, домик Петра I, Казанский собор, храм Спаса на Крови, Исаакиевский собор, фонтаны Петергофа
        <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCMrc1-qJQzZlCaIwNFJkoPrWc6PGNPhds&sensor=false">
    </script>

    <script type="text/javascript">
        function initialize() {
            var mapOptions = {
                center: new google.maps.LatLng(59.95, 30.316),
                zoom: 10,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
        }
    </script>
    </div>
    
    <body onload="initialize()">
        <div id="map_canvas" style="width:800px; height:500px"></div>
    </body>
</asp:Content>
