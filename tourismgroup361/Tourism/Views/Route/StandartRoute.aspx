<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
<%@ Import Namespace="System.Web.Mvc.Html" %>
<%@ Import Namespace="Tourism.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Стандартный маршрут
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="standartRouteForm" runat="server">   
        <div id="header" align="center">
            <h1><%: Html.ViewData["header"] %></h1>
        </div>
        
        <div id="right">
            <p>Здесь будет всякая реклама располагаться.</p>
            <img src="http://www.nickelodeon.ru/wp-content/uploads/2011/05/Kovalskiy.gif" width="200px"/>
        </div>

        <div id="center" align="left">
            <script type="text/javascript" src="../../Scripts/calendar_ru.js"></script>
            <form action="">
                <p><big>Выберите дни, в которые вы будете осматривать достопримечательности</big><br>
                    с <input type="text" value="dd-mm-yy" onfocus="this.select();lcs(this)"
	                        onclick="event.cancelBubble=true;this.select();lcs(this)"/></input>
                    по <input type="text" value="dd-mm-yy" onfocus="this.select();lcs(this)"
	                        onclick="event.cancelBubble=true;this.select();lcs(this)"></input>
                </p>
            </form>
            <p>Выберите объекты, которые Вы хотите посетить:</p>
            <br />
            <% using (Html.BeginForm()) %>
            <%{%>
                <%: Html.ValidationSummary(true) %>
                <% foreach (var value in ViewData.Model) %>
                <%{%>
                    <input type="checkbox" name="standartList" value="<%: value.nameRUS %>" /><%: value.nameRUS %><br/>
                <%}%>
                    <input type="submit" value="Далее"/>
            <%}%>
        </div>
        
        <div class = "clear">
        </div>
    </form>
</asp:Content>
