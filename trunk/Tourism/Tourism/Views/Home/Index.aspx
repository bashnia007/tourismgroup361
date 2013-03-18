<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tourism.Models.Monument>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Главная страница</h2>
    <p>
        <%: Html.ActionLink("Посмотреть базу", "ShowDB") %>
    </p>

</asp:Content>