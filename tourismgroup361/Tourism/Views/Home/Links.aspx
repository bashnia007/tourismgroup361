﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Links
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="linksContent" runat="server">
        <div id="center" align="left">
            <p> Мы рекомендуем ознакомиться со следующими ссылками, так или иначе посвященными Санкт-Петербургу:</p>
            <ul>
                <a href="http://vk.com/piter">Интересный паблик в социальной сети "Вконтакте"</a>
            </ul>
        </div>
    </form>

</asp:Content>