<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<Tourism.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Регистрация
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Регистрация</h2>
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Зарегистрироватсья</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.name) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.name) %>
                <%: Html.ValidationMessageFor(model => model.name) %>
            </div>
            
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.e_mail) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.e_mail) %>
                <%: Html.ValidationMessageFor(model => model.e_mail) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.password) %>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(model => model.password) %>
                <%: Html.ValidationMessageFor(model => model.password) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.confirmPassword) %>
            </div>
            <div class="editor-field">
                <%: Html.PasswordFor(model => model.confirmPassword)%>
                <%: Html.ValidationMessageFor(model => model.confirmPassword)%>
            </div>
            
            <p>
                <input type="submit" value="Зарегистрироватсья" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Назад", "Index", "Home") %>
    </div>
</asp:Content>
