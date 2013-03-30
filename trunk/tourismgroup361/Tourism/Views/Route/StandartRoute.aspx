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
        
        <div id="left">
            <ul>
                <li lang="ru">
                    <%: Html.ActionLink("Главная страница", "Index", "Home") %>
                </li>
                <li>
                    <%: Html.ActionLink("Составить маршрут", "Index", "Home") %>
                    <ul>
                        <li>
                            <%: Html.ActionLink("Стандартный маршрут", "StandartRoute", "Route") %>
                        </li>
                        <li>
                            <%: Html.ActionLink("Свой маршрут", "OwnerRoute", "Route") %>
                        </li>
                    </ul>
                </li>
                <li>
                    <%: Html.ActionLink("Карта сайта", "MapOfSite", "Home") %>
                </li>
                <li>
                    <%: Html.ActionLink("Контакты", "Contacts", "Home") %>
                </li>
                <li>
                    <%: Html.ActionLink("Полезные ссылки", "Links", "Home") %>
                </li>
            </ul>
            
            <asp:Calendar ID="Calendar" runat="server" BackColor="#3366FF" BorderColor="#006699"
                BorderStyle="Groove" FirstDayOfWeek="Monday" Font-Bold="True" Font-Names="Tahoma"
                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="White"
                ShowGridLines="True" TitleFormat="Month" ClientIDMode="AutoID" ViewStateMode="Disabled"
                meta:resourcekey="CalendarResource1">
                <DayHeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                <DayStyle BorderStyle="Solid" Wrap="True" />
                <OtherMonthDayStyle BackColor="#6699FF" BorderColor="White" />
                <SelectedDayStyle BackColor="#CC0000" />
                <TitleStyle ForeColor="#3333FF" />
                <TodayDayStyle BorderWidth="5px" />
                <WeekendDayStyle BackColor="#0000CC" />
            </asp:Calendar>
        </div>
        
        <div id="right">
            <p>Здесь будет всякая реклама располагаться.</p>
            <img src="http://www.nickelodeon.ru/wp-content/uploads/2011/05/Kovalskiy.gif" width="200px"/>
        </div>

        <div id="center" align="left">
            <p>Выберите объекты, которые Вы хотите посетить:</p>
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
