<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    MapOfSite</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="mapOfSiteForm" runat="server">
        
        <div id="header" align="center">
            <h1><%: ViewData["Header"] %></h1>
        </div>

        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        
        <div id="right">
            <p>И даже здесь будет всякая реклама располагаться.</p>     
        </div>
        
        <div id="center" >
            <asp:TreeView ID="TreeView2" runat="server" DataSourceID="SiteMapDataSource1" 
                ImageSet="Arrows" NodeIndent="10" 
                meta:resourcekey="TreeView1Resource1" LineImagesFolder="~/TreeLineImages" 
                onselectednodechanged="TreeView1_SelectedNodeChanged" NodeWrap="True" 
                ShowExpandCollapse="False">
                <HoverNodeStyle Font-Underline="True" BackColor="White" ForeColor="#3366FF" />
                <NodeStyle Font-Names="Arial" Font-Size="10pt" ForeColor="Black" 
                    HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                <ParentNodeStyle Font-Bold="False" />
                <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" 
                    VerticalPadding="0px" />
            </asp:TreeView>
        </div>
    </form>
</asp:Content>