<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<List<Tourism.Models.Museum>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	SearchRes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Результат поиска</h2>
    <ul>
        <% for (int i = 0; i < Model.Count; i++) %>
        <%
           { %>
                <li>
                Полное название: <%: Model[i].nameRUS %>
                <br/>
                Тип: <%: Model[i].type %>
                <br/>
                Контакты: <%: Model[i].contacts %>
                <br/>
                Адрес: <%: Model[i].addressRUS %>
                <br/>
                Описание: <%: Model[i].description %>
                <br/>
                </li>
        <% } %>
    </ul>

</asp:Content>
