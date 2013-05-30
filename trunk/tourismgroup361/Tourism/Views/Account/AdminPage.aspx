<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Администраторский раздел
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="adminPageForm" runat="server">
            Добро пожаловать в администраторский раздел!
            <ul>
                <li>
                    <%: Html.ActionLink ("Посмотреть базу культурного наследия", "ShowMonumentsDB", "Home") %>
                </li>
                <li>
                    <%: Html.ActionLink ("Посмотреть базу музеев", "ShowMuseumsDB","Home") %>
                </li>
                <!---
                <li>
                    <%: Html.ActionLink("Обновить БД Культурное наследие", "UpdateKultNasDb", "Home") %>
                </li>
                --->
            </ul>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Advertising" runat="server">
    <img src="../../Img/four.jpg" width="100%" /></asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeaderLine" runat="server">
    <h1>
        <%: @Html.ViewData["Header"] %></h1>
</asp:Content>
