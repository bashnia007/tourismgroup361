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

    <h2>Стандартный маршрут</h2>
    <p>
        <%: Html.ActionLink("Назад", "Index") %>
    </p>
    
    <body onload="initialize()">
        <div id="map_canvas" style="width:800px; height:500px"></div>
  </body>
</asp:Content>
