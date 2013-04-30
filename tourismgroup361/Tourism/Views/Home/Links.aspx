<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Полезные ссылки
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="linksContent" runat="server">
    <div id="header" align="center">
        <h1>
            <%: Html.ViewData["header"] %></h1>
    </div>
    <div id="left">
        <img src="../../Img/Riko.gif" width="250" />
    </div>
    <div id="center" align="left">
        <p>
            Мы рекомендуем ознакомиться со следующими ссылками, так или иначе посвященными Санкт-Петербургу:</p>
        <a href="http://vk.com/piter">Это Питер, детка! [Типичный Питер]</a>
        <br />
        <a href="http://vk.com/blog_fiesta">Интересные события в Санкт-Петербурге</a>
    </div>
    </form>
</asp:Content>
