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
