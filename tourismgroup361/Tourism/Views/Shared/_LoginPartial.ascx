<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<% if (Request.IsAuthenticated)
   {%>
        <b>Привет, <%: Context.User.Identity.Name%></b>
        <br/>
    <%: Html.ActionLink("Выйти", "LogOff", "Account") %>
    <%}%>
    <% else
        {%>
            <%: Html.ActionLink("Войти", "LogOn", "Account") %>
            <%: Html.ActionLink("Регистрация", "Register", "Account") %>
        <%}%>