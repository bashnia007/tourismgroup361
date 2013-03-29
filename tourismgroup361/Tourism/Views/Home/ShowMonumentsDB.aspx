<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tourism.Models.Monument>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	База данных из культурного наследия
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="header" align="center">
        <h1><%: Html.ViewData["header"] %></h1>
    </div>

    <p>
        <%: Html.ActionLink("Назад", "Index") %>
    </p>

    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                Name
            </th>
            <th>
                Address
            </th>
            <th>
                Architectors
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.ID %>
            </td>
            <td>
                <%: item.name %>
            </td>
            <td>
                <%: item.address %>
            </td>
            <td>
                <%: item.info %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Назад", "Index") %>
    </p>

</asp:Content>

