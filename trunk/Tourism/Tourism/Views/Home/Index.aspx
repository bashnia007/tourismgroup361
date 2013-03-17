<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Tourism.Models.Monument>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

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
            <th>
                Date
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

</asp:Content>

