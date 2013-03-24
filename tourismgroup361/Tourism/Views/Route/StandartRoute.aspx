<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<script runat="server">

    protected void titlePage_TextChanged(object sender, EventArgs e)
    {

    }
</script>
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
    <form id="standartRouteForm" runat="server">   
        <div id = "line_for_register" align="right">
            <%: Html.ActionLink("Войти", "LogOn", "Account") %>
            <%: Html.ActionLink("Регистрация", "Register", "Account") %>
        </div>
        
        <div id="header" align="center">
            <asp:TextBox ID="titlePage" runat="server" Height="15%" Width="72%"
                    ontextchanged="titlePage_TextChanged"
                    AutoCompleteType="Disabled" BorderColor="White" BorderWidth="0px" 
                    Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#0000CC" 
                    ReadOnly="True" 
            meta:resourcekey="titlePageResource1" BackColor="White" BorderStyle="None" 
                CausesValidation="True" Columns="35" Enabled="False" 
                EnableTheming="False" EnableViewState="False" MaxLength="100" TabIndex="4" 
                ViewStateMode="Disabled" >
                    Получение стандартного маршрута
            </asp:TextBox>
        </div>
        <div id="left">
            <ul>
                <li lang="ru"> <%: Html.ActionLink("Главная страница", "Index", "Home") %>
                </li>
                <li>
                    <%: Html.ActionLink("Составить маршрут", "Index", "Home") %>
                    <ul>
                        <li> <%: Html.ActionLink("Стандартный маршрут", "StandartRoute") %> </li>
                        <li> <%: Html.ActionLink("Свой маршрут", "OwnerRoute") %> </li>       
                    </ul>
                </li>
                <li>
                    <%: Html.ActionLink("Карта сайта", "MapOfSite", "Home") %>
                </li>
                <li> <%: Html.ActionLink("Контакты", "Contacts", "Home") %> </li>
            </ul>       
            <asp:Calendar ID="Calendar" runat="server" BackColor="#3366FF" 
                BorderColor="#006699" BorderStyle="Groove" FirstDayOfWeek="Monday" 
                Font-Bold="True" Font-Names="Tahoma" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" ForeColor="White" 
                ShowGridLines="True" TitleFormat="Month" ClientIDMode="AutoID" 
                ViewStateMode="Disabled" meta:resourcekey="CalendarResource1">
                <DayHeaderStyle ForeColor="White" HorizontalAlign="Center" 
                    VerticalAlign="Middle" />
                <DayStyle BorderStyle="Solid" Wrap="True" />
                <OtherMonthDayStyle BackColor="#6699FF" BorderColor="White" />
                <SelectedDayStyle BackColor="#CC0000" />
                <TitleStyle ForeColor="#3333FF" />
                <TodayDayStyle BorderWidth="5px" />
                <WeekendDayStyle BackColor="#0000CC" />
            </asp:Calendar>
        </div>

        <div id="right">
            <p>Здесь будет всякая реклама располагаться. Например, "Базеля".</p>
            <img src="http://www.footballtop.com/sites/default/files/photos/clubs/fc_basel.png" width="200px" height="200px"/>
        </div>

        

        <div id="center">
            <asp:TextBox ID="mainContent" runat="server" BackColor="White" 
                BorderColor="White" ReadOnly="True" TextMode="MultiLine" 
                AutoCompleteType="Company" 
                BorderWidth="0px" ForeColor="Black" 
                ClientIDMode="Static" Enabled="False" 
                EnableTheming="False" EnableViewState="False" 
                meta:resourcekey="mainContentResource1" Height="563px" 
                style="margin-top: 0px" Width="80%">
    Здесь Вы получите стандартный набор достопримечательностей. 
    Он состоит из следующих ( сделать ListBox'ом)
    Эрмитаж, Петропавловская крепость, Русский музей, Медный всадник, крейсер “Аврора”, домик Петра I, Казанский собор, храм Спаса на Крови, Исаакиевский собор, фонтаны Петергофа
            </asp:TextBox>
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
        <body>
            <div id="map_canvas" style="width:800px; height:500px"></div>
        </body>
        
        <div class = "clear">
        </div>
    </form>
</asp:Content>
