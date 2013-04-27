 <%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Главная страница
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="indexForm" runat="server">
        <div id="header">
            <h1><%: @Html.ViewData["Header"] %></h1>
        </div>
        <div id="left">
            <img src="../../Img/zenit.gif" width="200px" height="200px" />
            <img src="../../Img/matmex.gif" width="200px" height="200px" />
            <img src="../../Img/spo_skazka.png"width="200px" height="200px"/>
        </div>
       
        <div id="center" align="left">
            <p>
                Уважаемые гости города! 
            </p>
            <p>
                Наш сайт помогает гостям Санкт-Петербурга планировать маршрут для знакомства с городоми его достопримечательностями.
            </p>
            <p>
                #злаяАльбинастёрламоёпророчество,котороепочтисбылось.Возможноэтосамыйдлинныйтег
            </p>
            <p>
              Даша может писать текст прямо здесь
            </p>
        </div>

        <div class = "clear">
        </div>
    </form>
</asp:Content>
