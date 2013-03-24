<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void titlePage_TextChanged(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Главная страница
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
    
    <div id = "line_for_register" align="right">
        <%: Html.ActionLink("Войти", "LogOn", "Account") %><%: Html.ActionLink("Регистрация", "Register", "Account")%>
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
            ViewStateMode="Disabled" >Добро пожаловать на наш сайт!</asp:TextBox>
    </div>

    <div id = "left">
        <ul>
            <li lang="ru">
                 <%: Html.ActionLink("Главная страница", "Index") %>
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
    
    <div id = "right">
        <img src="http://cs402319.vk.me/v402319278/6700/Fo5QlrnPoOM.jpg" width="200px" height="200px"/>
        <img src="http://habrastorage.org/storage/358afb35/50487b87/6d885d83/bd8f6494.gif" width="200px" height="200px"/>
        <img src="http://spbso.ru/images/logo/spo_skazka_2009_200px.png" width="200px" height="200px"/>
        <p>
            Здесь будет всякая реклама располагаться.
        </p>
    </div>
    
    <!---<div id = "header">
        <h1 align="center">
            <%: @Html.ViewData["Header"] %>
        </h1>
    </div>--->
    
    <div id = "center" align="center">
        <asp:TextBox ID="mainContent" runat="server" BackColor="White" 
            BorderColor="White" ReadOnly="True" TextMode="MultiLine" 
            AutoCompleteType="Company" 
            BorderWidth="0px" ForeColor="Black" 
            ClientIDMode="Static" Enabled="False" 
            EnableTheming="False" EnableViewState="False" 
            meta:resourcekey="mainContentResource1" Height="563px" 
            style="margin-top: 0px" Width="80%">
    Дорогой друг! 
         
    Когда-нибудь до этого места доберется одна из женщин и что-то здесь напишет. А перед тем, как написать, будет очень сильно ругаться. Но нам не привыкать. 

    Такие они, эти женщины, злые. И только шоколадка может нас хоть как-то спасти. В некоторых случаях годится, впрочем, и финская водка. Не так ли, Александр?
                    
    Но женщины до сюда доберутся только в конце апреля. Так что можно пока просто потыкать по клавишам.
                    
    Я старался выдержать цвет календаря так, чтобы он не сильно контрастировал с вехней картинкой. Плюс подобная цветовая гамма очень похожа на цвета одной команды, которая любит проигрывать важные матчи всяких "Базелям", "Бенфикам", "Твенте", "Осерам".
                    
    Да, Александр! Не вздумайте удалять дизайн главной страницы!
        </asp:TextBox>
     </div>

    <div class = "clear">
    </div>

    </form>

</asp:Content>
