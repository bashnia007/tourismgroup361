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
            <ul>
                <li lang="ru">
                    <%: Html.ActionLink("Главная страница", "Index", "Home") %>
                </li>
                <ul>
                    <li>
                        <%: Html.ActionLink("Стандартный маршрут", "StandartRoute", "Route") %>
                    </li>
                    <li>
                        <%: Html.ActionLink("Свой маршрут", "OwnerRoute", "Route") %>
                    </li>
                    </ul>
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
            <p>
                Здесь будет всякая реклама располагаться.
            </p>
            <img src="http://www.nickelodeon.ru/wp-content/uploads/2011/05/Kovalskiy.gif" width="200px" />
        </div>
    
        <div id="center">
            Пожалуйста, укажите тип достопримечательности, которую Вы хотите увидеть:
            <br/>
            <br/>
            <%: Html.DropDownList("Тип музея", ViewData["list"] as SelectList) %>
            <p>
                <i>Что по умолчанию выводить здесь?</i>
            </p>
        </div>
    </form>
</asp:Content>
