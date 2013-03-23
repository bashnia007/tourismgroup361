<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AdminPage
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="adminPageForm" runat="server">
        <div id = "header" align="center"><h1>Администраторская</h1></div>
        <div id = "left">
            <ul>
                <li>
                    <%: Html.ActionLink("Главная страница", "Index") %></li>
                <li>
                    <%: Html.ActionLink ("Посмотреть базу культурного наследия", "ShowMonumentsDB") %>
                </li>
                <li>
                    <%: Html.ActionLink ("Посмотреть базу музеев", "ShowMuseumsDB") %>
                </li>
                <li>
                    <%: Html.ActionLink("Составить маршрут", "Index") %>
                    <ul>
                        <li>
                            <%: Html.ActionLink("Стандартный маршрут", "StandartRoute") %>
                        </li>
                        <li>
                            <%: Html.ActionLink("Свой маршрут", "OwnerRoute") %>
                        </li>
                    </ul>
                </li>
                <li>
                    <%: Html.ActionLink("Карта сайта", "MapOfSite") %>
                </li>
                <li>
                    <%: Html.ActionLink("Контакты", "Contacts") %>
                </li>
                <!---
                    <li>
                        <%: Html.ActionLink("Обновить БД Культурное наследие", "UpdateKultNasDB") %>
                    </li>
                --->
            </ul>

            <asp:Calendar ID="Calendar1" runat="server" BackColor="#3366FF" 
                BorderColor="#006699" BorderStyle="Groove" FirstDayOfWeek="Monday" 
                Font-Bold="True" Font-Names="Tahoma" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" ForeColor="White" 
                ShowGridLines="True" TitleFormat="Month" ClientIDMode="AutoID" 
                ViewStateMode="Disabled">
                <DayHeaderStyle ForeColor="White" HorizontalAlign="Center" 
                    VerticalAlign="Middle" />
                <DayStyle BorderStyle="Solid" Wrap="True" />
                <OtherMonthDayStyle BackColor="#6699FF" BorderColor="White" />
                <SelectedDayStyle BackColor="#CC0000" />
                <TitleStyle ForeColor="#3333FF" />
                <TodayDayStyle BorderWidth="5px" />
                <WeekendDayStyle BackColor="#0000CC" />
            </asp:Calendar>
        </div>
    
        <div id = "center">Какой-то текст</div>
            <div id = "right">
        <p>
            Здесь будет всякая реклама располагаться. Например, Кознова
        </p>
        </div>
    </form>
</asp:Content>
