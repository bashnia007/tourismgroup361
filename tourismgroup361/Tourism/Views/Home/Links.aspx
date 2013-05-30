<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Полезные ссылки
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="linksContent" runat="server">
        <p>
            Мы рекомендуем ознакомиться со следующими ссылками, так или иначе посвященными Санкт-Петербургу:</p>
        <p>Сообщества сайта <a href="http://vk.com">ВКонтакте:</a></p>
        <ul>
        <li><a href="http://vk.com/piter">Это Питер, детка! [Типичный Питер]</a>
        <li><a href="http://vk.com/blog_fiesta">Интересные события в Санкт-Петербурге</a>
        </ul>
        <p>Интернет-порталы:</p>
        <ul>
        <li><a href="http://www.peterburg.ru/">Туристический гид Peterburg.ru</a>
        <li><a href="http://www.visit-petersburg.ru/">Городской туристический портал Visit-Peterburg.ru</a>
        </ul>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Advertising" runat="server">
    <img src="../../Img/one.jpg" width="100%" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeaderLine" runat="server">
    <h1>
        <%: @Html.ViewData["Header"] %></h1>
</asp:Content>
