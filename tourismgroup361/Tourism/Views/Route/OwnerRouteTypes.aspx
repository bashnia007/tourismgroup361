<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<List<Tourism.Models.TypeViewModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Свой маршрут
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Выберите типы достопримечательностей, которые вы хотите посетить:
    <br/>
    <form action="" method="POST">
        <% for (int i = 0; i <  Model.Count; i++)
           {%>
                <br />
                <%: Html.CheckBoxFor(it => it[i].Checked)%>
                <%: Html.HiddenFor(it => it[i].Id)%>
                <%: Html.DisplayFor(it => it[i].Name)%>
        <% } %>
           <br/>
           <input type="submit"/>
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
        Свой маршрут</h1>
</asp:Content>
