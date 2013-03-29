<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Error 404
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="header" align ="center">
        <h1>
            <%: Html.ViewData["header] %>;
        </h1>
    </div>
    
    <div id="center">
        <h2>
            <%: Html.ViewData["center"] %>;
        </h2>
    </div>
    <div id="right">
        <img src="http://images5.fanpop.com/image/answers/2248000/2248259_1324050654376.58res_162_162.jpg"/>
    </div>
</asp:Content>