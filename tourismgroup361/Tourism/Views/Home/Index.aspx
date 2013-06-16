<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Главная страница
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="indexForm" runat="server">
    <p>
        Вы находитесь на сервисе, который автоматически составляет оптимальный маршрут для
        осмотра достопримечательностей Санкт-Петербурга.
        <br />
        <br/>
    </p>
    <p>
        Если вы:
        <ul style="margin: 1px">
            <li>впервые в Северной столице; </li>
            <li>любите знакомиться с музеями и другими достопримечательностями; </li>
            <li>хотите в короткий срок увидеть максимально много; </li>
            <li>не хотите тратить своё время на составление и продумывание маршрутов; </li>
            <li>желаете оптимально спланировать культурный поход по Санкт-Петербургу, </li>
            наш сервис - для вас!
        </ul>
        <br />
        <p>
            Как им пользоваться?
            <ol style="margin: 1px">
                <li >Зайдите на страницу «Стандартный маршрут». </li>
                <li>Выберите желаемый способ передвижения по городу. </li>
                <li>Введите то количество дней, которые вы хотите отвести на осмотр достопримечательностей.
                </li>
                <li>Выберите из списка музеев и памятников те, которые хотите посетить. </li>
                <li>Нажмите кнопку «ОК» для составления маршрута. Вы увидите его на карте. </li>
                <li>Описание о том, как добраться до очередного пункта, вы прочтёте по нажатию кнопки
                    «Подробности маршрута».</li>
            </ol>
        </p>
    </p>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Advertising" runat="server">
    <br />
    <img src="../../Img/flag.jpg" width="100%" /><br />
    <br />
    <img src="../../Img/Piter.png" width="100%" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeaderLine" runat="server">
    <h1>
        Добро пожаловать!</h1>
</asp:Content>
