<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tourism.Models.Monument>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ShowDB
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>База данных из культурного наследия</h2>

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
                <%: item.Name %>
            </td>
            <td>
                <%: item.Address %>
            </td>
            <td>
                <%: item.Architectors %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Назад", "Index") %>
    </p>

</asp:Content>

