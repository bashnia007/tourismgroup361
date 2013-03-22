<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Стандартный маршрут
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Стандартный маршрут</h2>
    <p>
        <%: Html.ActionLink("Назад", "Index") %>
    </p>
    
    <div id = "center">
        <iframe name="example" src="https://maps.google.ru/maps?hl=ru&tab=wl" width="800" height="400">
            
        </iframe>
        <script>
            window.frames.example.location = "https://maps.google.ru/maps?hl=ru&tab=wl";
        </script>

    </div>
</asp:Content>
