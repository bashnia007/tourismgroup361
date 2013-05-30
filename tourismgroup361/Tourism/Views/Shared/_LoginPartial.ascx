<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="System.Runtime.Remoting.Contexts" %>

<% if (Request.IsAuthenticated)
   {%>
        <b>Привет, <%: Context.User.Identity.Name %>!</b>
        <br/>
        <% if (Context.User.Identity.Name == "админ")
           { %>
            <%: Html.ActionLink("Администраторский раздел", "AdminPage", "Account") %>
            <br/>
           <%} %>
    <%: Html.ActionLink("Выйти", "LogOff", "Account") %>
    <%}%>
    <% else
        {%>
            <%: Html.ActionLink("Войти", "LogOn", "Account") %>
            <%: Html.ActionLink("Регистрация", "Register", "Account") %>
        <%}%>