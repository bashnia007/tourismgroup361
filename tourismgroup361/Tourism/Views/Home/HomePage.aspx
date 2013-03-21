<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    HomePage
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Домашняя страница</h2>
    <ul>
        <li>
            <%: Html.ActionLink("Главная страница", "Index") %></li>
        <li>
            <%: Html.ActionLink ("Посмотреть базу культурного наследия", "ShowMonumentsDB") %>
        </li>
        <li>
            <%: Html.ActionLink ("Посмотреть базу музеев", "ShowMuseumsDB") %>
        </li>
        <li>
            <%: Html.ActionLink("Составить маршрут", "Index") %>
            <ul>
                <li>
                    <%: Html.ActionLink("Стандартный маршрут", "StandartRoute") %>
                </li>
                <li>
                    <%: Html.ActionLink("Свой маршрут", "OwnerRoute") %>
                </li>
            </ul>
        </li>
        <li>
            <%: Html.ActionLink("Карта сайта", "MapOfSite") %>
        </li>
        <li>
            <%: Html.ActionLink("Контакты", "Contacts") %>
        </li>
        <!---
        <li>
            <%: Html.ActionLink("Обновить БД Культурное наследие", "UpdateKultNasDB") %>
        </li>
        --->
    </ul>
</asp:Content>
