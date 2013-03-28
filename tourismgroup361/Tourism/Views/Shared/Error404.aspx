<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Error 404
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>404</h1>
    <h2>Данный URL не существует</h2>
    
    <div id="right">
        <img src="http://images5.fanpop.com/image/answers/2248000/2248259_1324050654376.58res_162_162.jpg"/>
    </div>
</asp:Content>