<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<script runat="server">

    protected void titlePage_TextChanged(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    MapOfSite</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="mapOfSiteForm" runat="server">
        <div id = "line_for_register" align="right">
            <%: Html.ActionLink("Войти", "LogOn", "Account") %>
            <%: Html.ActionLink("Регистрация", "Register", "Account") %>
        </div>  
        <div id="header" align="center">
        <asp:TextBox ID="titlePage" runat="server" Height="15%" Width="37%"
                ontextchanged="titlePage_TextChanged"
                AutoCompleteType="Disabled" BorderColor="White" BorderWidth="0px" 
                Font-Bold="True" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="#0000CC" 
                ReadOnly="True" 
        meta:resourcekey="titlePageResource1" BackColor="White" BorderStyle="None" 
            CausesValidation="True" Columns="35" Enabled="False" 
            EnableTheming="False" EnableViewState="False" MaxLength="100" TabIndex="4" 
            ViewStateMode="Disabled" >Карта сайта</asp:TextBox>
        </div>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        <div id="left">
            <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" 
                ImageSet="News" NodeIndent="10" ShowLines="True" 
                meta:resourcekey="TreeView1Resource1">
                <HoverNodeStyle Font-Underline="True" />
                <NodeStyle Font-Names="Arial" Font-Size="10pt" ForeColor="Black" 
                    HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                <ParentNodeStyle Font-Bold="False" />
                <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" 
                    VerticalPadding="0px" />
            </asp:TreeView>
            <asp:Calendar ID="Calendar" runat="server" BackColor="#3366FF" 
                BorderColor="#006699" BorderStyle="Groove" FirstDayOfWeek="Monday" 
                Font-Bold="True" Font-Names="Tahoma" Font-Overline="False" 
                Font-Strikeout="False" Font-Underline="False" ForeColor="White" 
                ShowGridLines="True" TitleFormat="Month" ClientIDMode="AutoID" 
                ViewStateMode="Disabled" meta:resourcekey="CalendarResource1">
                <DayHeaderStyle ForeColor="White" HorizontalAlign="Center" 
                    VerticalAlign="Middle" />
                <DayStyle BorderStyle="Solid" Wrap="True" />
                <OtherMonthDayStyle BackColor="#6699FF" BorderColor="White" />
                <SelectedDayStyle BackColor="#CC0000" />
                <TitleStyle ForeColor="#3333FF" />
                <TodayDayStyle BorderWidth="5px" />
                <WeekendDayStyle BackColor="#0000CC" />
            </asp:Calendar>
        </div>
        
        <div id="right">
            <p>И даже здесь будет всякая реклама располагаться.</p>
            
        </div>
    </form>
</asp:Content>