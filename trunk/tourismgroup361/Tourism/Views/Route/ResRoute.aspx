<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" %>
<%@ Import Namespace="Tourism.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    resRoutr</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="resRouteForm" runat="server">
    
        <div id="header" align="center">
            <%: Html.ViewData["header"] %>
        </div>

        <div id="left">
            Здесь всякая реклама располагается.
        </div>
        <div id="center">
            Ваш выбор:
            <% foreach (Museum value in ViewData.Model)
                { %>
                <input type="checkbox" value="<%: value.addressRUS %>" /><%: value.nameRUS %><br/>
            <% } %>
            <br/>
            <input type="submit" value="Получить маршрут!"/>
        </div>
    </form>
</asp:Content>
