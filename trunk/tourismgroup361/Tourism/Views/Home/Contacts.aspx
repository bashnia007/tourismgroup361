<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Contacts
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="contactsForm" runat="server">
        
        <div id = "line_for_register" align="right">
            <%: Html.ActionLink("Войти", "LogOn", "Account")%>
            <%: Html.ActionLink("Регистрация", "Register", "Account")%>
        </div>
        
        <div id = "left">
            <ul>
                <li lang="ru"> <%: Html.ActionLink("Главная страница", "Index") %>
                </li>
                <li>
                    <%: Html.ActionLink("Составить маршрут", "Index") %>
                    <ul>
                        <li> <%: Html.ActionLink("Стандартный маршрут", "StandartRoute", "Route")%> </li>
                        <li> <%: Html.ActionLink("Свой маршрут", "OwnerRoute", "Route")%> </li>       
                    </ul>
                </li>
                <li>
                    <%: Html.ActionLink("Карта сайта", "MapOfSite") %>
                </li>
                <li> <%: Html.ActionLink("Контакты", "Contacts") %> </li>
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
        <p>Здесь будет всякая реклама располагаться.</p>
        </div>
        
        <div id = "header"><h1 align="center">Контакты</h1></div>

        <div id = "center">
            <p>По вопросам насчет сайта обращайтесь к разработчикам:
            <br />Александру Кавокину, alexanderkavokin@gmail.com
            <br />Андрею Иванову, ivanov-vas93@yandex.ru</p>
            
            <p>Если наш сайт Вас заинтересовал, Вы хотите получить что-то подобное или разместить рекламу на нашем сайте, то обращайтесь по выше указанным адресам
            <br />Цены можно узнать лично</p>
            <br />Если Вы хотите предложить трудоустройство талантливым программистам, освоившим за месяц веб-программирование с нуля, также обращайтесь по указанным выше адресам
            
            <p>Разработкой документов к данном сайту занимались:
            <br />Андрею Иванову, ivanov-vas93@yandex.ru
            <br />Александру Кавокину, alexanderkavokin@gmail.com
            <br />Дарья Николаева, daryanika@gmail.com</p>
            
            <p>Также в нашей команде зарегистрированы Альбина Борисова и Ксения Царева</p>
        </div>
    </form>
</asp:Content>
