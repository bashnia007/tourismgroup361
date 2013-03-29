<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tourism.Models.Museum>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ShowMuseumsDB
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="header" align="center">
            <h1><%: Html.ViewData["header"] %></h1>
    </div>

    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                nameRUS
            </th>
            <th>
                nameENG
            </th>
            <th>
                contacts
            </th>
            <th>
                addressRUS
            </th>
            <th>
                addressENG
            </th>
            <th>
                description
            </th>
            <th>
                type
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.ID %>
            </td>
            <td>
                <%: item.nameRUS %>
            </td>
            <td>
                <%: item.nameENG %>
            </td>
            <td>
                <%: item.contacts %>
            </td>
            <td>
                <%: item.addressRUS %>
            </td>
            <td>
                <%: item.addressENG %>
            </td>
            <td>
                <%: item.description %>
            </td>
            <td>
                <%: item.type %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Назад", "Index") %>
    </p>

</asp:Content>

