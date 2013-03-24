<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<script runat="server">

    protected void titlePage_TextChanged(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Contacts</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="contactsForm" runat="server">
        
        <div id = "line_for_register" align="right">
            <%: Html.ActionLink("Войти", "LogOn", "Account")%>
            <%: Html.ActionLink("Регистрация", "Register", "Account")%>
        </div>
        
        <div id="header" align="center">
            <asp:TextBox ID="titlePage" runat="server" Height="15%" Width="37%"
                    ontextchanged="titlePage_TextChanged"
                    AutoCompleteType="Disabled" BorderColor="White" BorderWidth="0px" 
                    Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#0000CC" 
                    ReadOnly="True" 
                    meta:resourcekey="titlePageResource1" BackColor="White" BorderStyle="None" 
                    CausesValidation="True" Columns="35" Enabled="False" 
                    EnableTheming="False" EnableViewState="False" MaxLength="100" TabIndex="4" 
                    ViewStateMode="Disabled" > Контакты </asp:TextBox>
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
                ViewStateMode="Disabled" meta:resourcekey="CalendarResource1">
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
            <img src="http://www.abakan-gazeta.ru/files/u1/gon_021209_13.jpg" />
        </div>
        
        <div id = "center">
            <asp:TextBox ID="mainContent" runat="server" BackColor="White" 
            BorderColor="White" ReadOnly="True" TextMode="MultiLine" 
            AutoCompleteType="Company" 
            BorderWidth="0px" ForeColor="Black" 
            ClientIDMode="Static" Enabled="False" 
            EnableTheming="False" EnableViewState="False" 
            meta:resourcekey="mainContentResource1" Height="563px" 
            style="margin-top: 0px" Width="80%"> По вопросам насчет сайта обращайтесь к разработчикам: Александру Кавокину, alexanderkavokin@gmail.com Андрею Иванову, ivanovandrew2004@gmail.com Если наш сайт Вас заинтересовал, Вы хотите получить что-то подобное или разместить рекламу на нашем сайте, то обращайтесь по выше указанным адресам Цены можно узнать лично Если Вы хотите предложить трудоустройство талантливым программистам, освоившим за месяц веб-программирование с нуля, также обращайтесь по указанным выше адресам Разработкой документов к данном сайту занимались: Андрей Иванов, ivanovandrew2004@gmail.com Александр Кавокин, alexanderkavokin@gmail.com Дарья Николаева, daryanika@gmail.com Также в нашей команде зарегистрированы Альбина Борисова и Ксения Царева </asp:TextBox>
        </div>
    </form>
</asp:Content>
