<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<!---<div class="searchForm">--->
    <% using (Html.BeginForm("Search", "Route", FormMethod.Get)) %>
    <%
       { %>
           <h5>Найти музей:<br/>
           <%= Html.TextBox("query", null, new {Style = "width: 97%; min-width: 96px;"})%>
           <br/>
           <input type = "submit" value="Найти!"/>
           </h5>
    <% } %>
<!---</div>--->
