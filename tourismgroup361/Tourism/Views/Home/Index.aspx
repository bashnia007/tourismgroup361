<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Главная страница
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="indexForm" runat="server">
    <p>
        Этот сервис создан для того, чтобы помогать автоматически составить оптимальный
        маршрут для осмотра достопримечательностей Санкт-Петербурга.
    </p>
    <p>
        Каждому, кто когда-либо приезжал в незнакомый город с целью осмотра достопримечательностей,
        знакома проблема выбора, куда пойти, когда это лучше сделать, как грамотно спланировать
        маршрут. Кто-то подходит к этим вопросам основательно, заранее узнавая, где находятся
        интересные ему музеи, по каким дням они устраивают свободное посещение, на чём лучше
        добираться и где перекусить между экскурсиями. Кто-то не имеет достаточно свободного
        времени, чтобы заниматься подобным мониторингом, и в результате либо не успевает
        везде, где предполагал побывать, либо тратит на визиты значительно больше времени
        и денег, чем мог бы, спланировав маршрут.
    </p>
    <p>
        Мы хотим, чтобы гости Санкт-Петербурга увидели как можно больше интересных (и часто
        малоизвестных, но оттого не менее значимых) мест и местечек, но при этом тратили
        минимальное время на поиск и составление маршрутов. Наша цель состоит в том, чтобы
        знакомство туристов с городом было максимально комфортным и плодотворным.
    </p>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Advertising" runat="server">
    <br/>
    <img src="../../Img/flag.jpg" width="100%" /><br/>
    <br/>
    <img src="../../Img/Piter.png" width="100%" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeaderLine" runat="server">
    <h1>Добро пожаловать!</h1>
</asp:Content>