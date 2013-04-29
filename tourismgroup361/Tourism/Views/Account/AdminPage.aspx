<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Администраторский раздел
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="adminPageForm" runat="server">
        <div id = "header" align="center">
            <h1><%: ViewData["header"] %></h1>
        </div>
        <div id = "center">
            Добро пожаловать в отдел администратора!
            <ul>
                <li>
                    <%: Html.ActionLink ("Посмотреть базу культурного наследия", "ShowMonumentsDB", "Home") %>
                </li>
                <li>
                    <%: Html.ActionLink ("Посмотреть базу музеев", "ShowMuseumsDB","Home") %>
                </li>
                <li>
                    <%: Html.ActionLink("Обновить БД Культурное наследие", "UpdateKultNasDb", "Home") %>
                </li>
            </ul>
        </div>
    </form>
</asp:Content>
