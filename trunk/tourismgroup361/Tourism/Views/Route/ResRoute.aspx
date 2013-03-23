<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	resRoutr
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="resRouteForm" runat="server">
        <div id = "line_for_register" align="right">
            <%: Html.ActionLink("Войти", "LogOn", "Account") %>
            <%: Html.ActionLink("Регистрация", "Register", "Account") %>
        </div>
        
        <div id="left">
            <ul>
                <li lang="ru"> <%: Html.ActionLink("Главная страница", "Index", "Home") %>
                </li>
                <li>
                    <%: Html.ActionLink("Составить маршрут", "Index", "Home") %>
                    <ul>
                        <li> <%: Html.ActionLink("Стандартный маршрут", "StandartRoute") %> </li>
                        <li> <%: Html.ActionLink("Свой маршрут", "OwnerRoute") %> </li>       
                    </ul>
                </li>
                <li>
                    <%: Html.ActionLink("Карта сайта", "MapOfSite", "Home") %>
                </li>
                <li> <%: Html.ActionLink("Контакты", "Contacts", "Home") %> </li>
            </ul>
        
            <asp:Calendar ID="Calendar" runat="server" BackColor="#3366FF" 
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
    
        <div id="right">
            Здесь всякая реклама располагается. 
        </div>
        <div id="header"><h1 align="center">Ваш рекомендуемый маршрут</h1></div>
        <div id="center">
            <p>
                Вот Ваш маршрут:
            </p>
        </div>
        

    </form>
</asp:Content>
