<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tourism.Models.Monument>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Туризм
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id = "header">
        <h1>Главная страница</h1>
    </div>

    <div id = "center">
        <h4> Вы зашли на сайт в <% Response.Write(DateTime.Now); %></h4>
    </div>
    
    <div id = "left">
       <ul>
            <li> <%: Html.ActionLink("Главная страница", "Index") %></li>
            <li> <%: Html.ActionLink ("Посмотреть базу", "ShowDB") %> </li>
            <li> <%: Html.ActionLink("Контакты", "Contacts") %> </li>
            <li>
                <%: Html.ActionLink("Составить маршрут", "Index") %>
                <ul>
                    <li> <%: Html.ActionLink("Стандартный маршрут", "StandartRoute") %> </li>
                    <li> <%: Html.ActionLink("Свой маршрут", "OwnerRoute") %> </li>       
                </ul>
            </li>
            <li>
                <%: Html.ActionLink("Карта сайта", "MapOsSite") %>
            </li>  
        </ul>
    </div>
</asp:Content>