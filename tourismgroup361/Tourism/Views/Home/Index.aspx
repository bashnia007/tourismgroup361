<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Главная страница
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
    
    <div id = "line_for_register" align="right">
        <%: Html.ActionLink("Войти", "LogOn", "Account") %>
        <%: Html.ActionLink("Регистрация", "Register", "Account")%>
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
    
    <div id = "right">
        <img src="http://cs402319.vk.me/v402319278/6700/Fo5QlrnPoOM.jpg" width="200px" height="200px"/>
        <img src="http://habrastorage.org/storage/358afb35/50487b87/6d885d83/bd8f6494.gif" width="200px" height="200px"/>
        <img src="http://spbso.ru/images/logo/spo_skazka_2009_200px.png" width="200px" height="200px"/>
        <p>
            Здесь будет всякая реклама располагаться.
        </p>
    </div>
    
    <div id = "header">
        <h1 align="center">
            Добро пожаловать на наш сайт!
        </h1>
    </div>
    
    <div id = "center">
        <p>
            Дорогой друг! Когда-нибудь до этого места доберется одна из женщин и что-то здесь напишет. А перед тем, как написать, будет очень сильно ругаться. Но нам не привыкать. 
            Такие они, эти женщины, злые. И только шоколадка может нас хоть как-то спасти. В некоторых случаях годится, впрочем, и финская водка. Не так ли, Александр?
        </p>
        <p>
            Но женщины до сюда доберутся только в конце апреля. Так что можно пока просто потыкать по клавишам.
        </p>
        <p>
            Я старался выдержать цвет календаря так, чтобы он не сильно контрастировал с вехней картинкой. Плюс подобная цветовая гамма очень похожа на цвета одной команды, которая любит проигрывать важные матчи всяких "Базелям", "Бенфикам", "Твенте", "Осерам".
        </p>
        <p>
            Я потом вспомню, как правильно делать отступы для абзацей. Не сейчас.
        </p>
        <p>
            Да, Александр! Не вздумайте удалять дизайн главной страницы!
        </p>
    </div>

    <div class = "clear">
    </div>

    </form>

</asp:Content>
