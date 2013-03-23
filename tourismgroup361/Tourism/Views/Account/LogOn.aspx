<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" 
    Inherits="System.Web.Mvc.ViewPage<Tourism.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Вход
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Вход</h2>
    <% using (Html.BeginForm())
       {%>
    <%: Html.ValidationSummary(true) %>

    <fieldset>
        <legend>Вход</legend>
        
        <div class="editor-label">
            <%: Html.LabelFor(model => model.name) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.name) %>
            <%: Html.ValidationMessageFor(model => model.name) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.password) %>
        </div>
        <div class="editor-field">
            <%: Html.PasswordFor(model => model.password) %>
            <%: Html.ValidationMessageFor(model => model.password) %>
        </div>
        
        
        <p>
            <input type="submit" value="Войти" />
        </p>
    </fieldset>
    <% } %>

        <div>
        <%: Html.ActionLink("Зарегистрироваться", "Register") %>
    </div>

</asp:Content>
