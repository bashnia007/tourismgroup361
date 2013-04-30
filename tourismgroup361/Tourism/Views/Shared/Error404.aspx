<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Error 404
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <div id="center">
        <h1 align="center">404</h1>
        <h2 align="center">Данный URL не существует</h2>
        <img src="../../Img/SHkiper1.gif" width="400"/>
    </div>
</asp:Content>