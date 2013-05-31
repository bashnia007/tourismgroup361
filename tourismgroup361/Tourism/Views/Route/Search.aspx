<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<List<Tourism.Models.Museum>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SearchRes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% if (Model.Count == 0)
       { %>
            По Вашему запросу ничего не найдено. Проверьте, не допустили ли Вы опечатку.
    <% } %>
    <%
       else
       { %>
            <ul>
                <% for (int i = 0; i < Model.Count; i++) %>
                <%
                   { %>
                <li><b>Полное название:
                    <%: Model[i].nameRUS %>
                </b>
                    <br />
                    Тип: <i>
                        <%: Model[i].type %></i>
                    <br />
                    Контакты: <i>
                        <%: Model[i].contacts %></i>
                    <br />
                    Адрес: <i>
                        <%: Model[i].addressRUS %></i>
                    <br />
                    Описание:
                    <%: Model[i].description %>
                    <br />
                    <br />
                </li>
                <% } %>
            </ul>
        <% } %>
</asp:Content>
<asp:Content ContentPlaceHolderID="HeaderLine" runat="server">
    <h2>
        Результат поиска</h2>
</asp:Content>
<asp:Content ContentPlaceHolderID="Advertising" runat="server">
    <img src="../../Img/one.jpg" width="100%" />
</asp:Content>
