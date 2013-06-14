<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<List<Tuple<string, string>>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ваш маршрут
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    Ура! А вот здесь я торжественно передаю выбранные музеи Александру, дабы он смог проложить
    маршрут! Вот выбранные музеи (с адресами)
    <br /><br/>
    <% for (int i = 0; i < Model.Count; i++)
       {%>
            <li>
            <%: Html.DisplayFor(it => it[i].Item1)%>
            <br/>
            <i>
            <%: Html.DisplayFor(it => it[i].Item2)%>
            </i>
            <br/>
            <br />
            </li>
    <% } %>
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Advertising" runat="server">
    <br />
    <img src="../../Img/flag.jpg" width="100%" /><br />
    <br />
    <img src="../../Img/Piter.png" width="100%" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeaderLine" runat="server">
    <h1>
        Ваш маршрут</h1>
</asp:Content>
