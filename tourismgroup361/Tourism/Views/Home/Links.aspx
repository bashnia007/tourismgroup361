<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Links
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="linksContent" runat="server">
        <div id="header" align="center">
            <h1> <%: Html.ViewData["header"] %></h1>
        </div>
        <div id="center" align="left">
            <p> Мы рекомендуем ознакомиться со следующими ссылками, так или иначе посвященными Санкт-Петербургу:</p>
            <ul>
                <a href="http://vk.com/piter">Интересный паблик в социальной сети "Вконтакте"</a>
                <a href="http://vk.com/blog_fiesta">Еще один интересный паблик в социальной сети "Вконтакте"</a>
            </ul>
        </div>
    </form>

</asp:Content>