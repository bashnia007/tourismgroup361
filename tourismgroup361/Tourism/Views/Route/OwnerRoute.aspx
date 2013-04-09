<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    Culture="auto" meta:resourcekey="PageResource2" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Свой маршрут</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="ownerRouterForm" runat="server">
        
        <div id="header" align="center">
            <h1> <%: ViewData["header"] %> </h1>
        </div>
    
        <div id="left">
            <p>
                Здесь будет всякая реклама располагаться.
            </p>
            <img src="http://www.nickelodeon.ru/wp-content/uploads/2011/05/Kovalskiy.gif" width="200px" />
        </div>
    
        <div id="center">
            <script type="text/javascript" src="../../Scripts/calendar_ru.js"></script>
            <form action="">
                <p><big>Выберите дни, в которые вы будете осматривать достопримечательности</big><br>
                    с <input type="text" value="dd-mm-yy" onfocus="this.select();lcs(this)"
	                        onclick="event.cancelBubble=true;this.select();lcs(this)"/></input>
                    по <input type="text" value="dd-mm-yy" onfocus="this.select();lcs(this)"
	                        onclick="event.cancelBubble=true;this.select();lcs(this)"></input>
                </p>
            </form>
            Пожалуйста, укажите тип достопримечательности, которую Вы хотите увидеть:
            <br/>
            <br/>
            <%: Html.DropDownList("Тип музея", ViewData["list"] as MultiSelectList) %>
            <p>
                <i>Что по умолчанию выводить здесь?</i>
            </p>
        </div>
    </form>
</asp:Content>
