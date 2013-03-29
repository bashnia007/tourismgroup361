<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Contacts</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="contactsForm" runat="server">
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
            <img src="http://www.abakan-gazeta.ru/files/u1/gon_021209_13.jpg" />
        </div>
        
        <div id="center">
            <p>	  По вопросам насчет сайта обращайтесь к разработчикам:
		        <ul>
		            <li>  Александру Кавокину, alexanderkavokin@gmail.com</li>
		            <li>  Андрею Иванову, ivanovandrew2004@gmail.com</li>
                </ul>
            </p>
	        <p>  Если наш сайт Вас заинтересовал, Вы хотите получить что-то подобное или разместить рекламу на нашем сайте, то обращайтесь по выше указанным адресам. Цены можно узнать лично.</p>
            <p>  Если Вы хотите предложить трудоустройство талантливым программистам, освоившим за месяц веб-программирование с нуля, также обращайтесь по указанным выше адресам.</p>
            <p>  Разработкой документов к данном сайту занимались: 
		        <ul>
		            <li>  Андрей Иванов, ivanovandrew2004@gmail.com</li>
		            <li>  Александр Кавокин, alexanderkavokin@gmail.com</li>
		            <li>  Дарья Николаева, daryanika@gmail.com</li>
                </ul>
            </p>
	        <p>  Также в нашей команде зарегистрированы Альбина Борисова и Ксения Царева</p>
        </div>
    </form>
</asp:Content>
