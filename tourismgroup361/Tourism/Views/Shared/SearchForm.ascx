<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="searchForm">
    <% using (Html.BeginForm("Search", "Route", FormMethod.Get)) %>
    <%
       { %>
           <h5>Найти музей:<br/>
           <%= Html.TextBox("query") %>
           <br/>
           <input type = "submit" value="Найти!"/>
           </h5>
    <% } %>
</div>
