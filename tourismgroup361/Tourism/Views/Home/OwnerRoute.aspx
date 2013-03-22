<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Свой маршрут
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id = "header"><h1 align="center">Составить маршрут</h1></div>
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
        <p>
            Пожалуйста, укажите тип достопримечательности, которую Вы хотите увидеть. 
        </p>
        <p>
            Тут какое-нибудь меню поиска
        </p>
    </div>
</asp:Content>
