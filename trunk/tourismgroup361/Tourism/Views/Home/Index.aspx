<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Главная страница
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
    
        <div id="header" align="center">
            <h1><%: @Html.ViewData["Header"] %></h1>
        </div>

        <div id="right">
            <img src="http://cs402319.vk.me/v402319278/6700/Fo5QlrnPoOM.jpg" width="200px" height="200px"/>
            <img src="http://habrastorage.org/storage/358afb35/50487b87/6d885d83/bd8f6494.gif" width="200px" height="200px"/>
            <img src="http://spbso.ru/images/logo/spo_skazka_2009_200px.png" width="200px" height="200px"/>
            <p>Здесь будет всякая реклама располагаться.</p>
        </div>
       
        <div id="center" align="left">
            <p>
                Дорогой друг! 
            </p>
            <p>
                Когда-нибудь до этого места доберется одна из женщин и что-то здесь напишет. А перед тем, как написать, будет очень сильно ругаться. Такие они, эти женщины, злые. И только шоколадка может нас хоть как-то спасти. В некоторых случаях годится, впрочем, и финская водка. Не так ли, Александр? Так что зря Вы в Финляндии водкой не закупились, ой зря..
            </p>
            <p>
                Но женщины до сюда доберутся только в конце апреля. Так что можно пока просто потыкать по клавишам.
            </p>
            <p>
                Я старался выдержать цвет календаря так, чтобы он не сильно контрастировал с верхней картинкой. Плюс подобная цветовая гамма очень похожа на цвета одной команды, которая любит проигрывать важные матчи всяких "Базелям", "Бенфикам", "Твенте", "Осерам".(Да, 
                той самой, что идет первой в этом списке рекламы).
            </p>
         </div>

        <div class = "clear">
        </div>

    </form>

</asp:Content>
