<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Contacts</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="contactsForm" runat="server">
        <div id="header" align="center">
            <h1><%: Html.ViewData["header"] %></h1>
        </div>
        
        <div id="left">
            <p>Здесь будет всякая реклама располагаться.</p>
            <img src="http://www.abakan-gazeta.ru/files/u1/gon_021209_13.jpg" />
        </div>
        
        <div id="center">
            <p>	  По вопросам насчет сайта обращайтесь к разработчикам:
		        <ul>
		            <li>  Александру Кавокину, alexanderkavokin@gmail.com</li>
		            <li>  Андрею Иванову, ivanovandrew2004@gmail.com</li>
                </ul>
            </p>
	        <p>  Если наш сайт Вас заинтересовал, Вы хотите получить что-то подобное или разместить рекламу на нашем сайте, то обращайтесь по выше указанным адресам. Цены можно узнать лично.</p>
            <p>  Если Вы хотите предложить трудоустройство талантливым программистам, освоившим за месяц веб-программирование с нуля, также обращайтесь по указанным выше адресам.</p>
            <p>  Разработкой документов к данном сайту занимались: 
		        <ul>
		            <li>  Андрей Иванов, ivanovandrew2004@gmail.com</li>
		            <li>  Александр Кавокин, alexanderkavokin@gmail.com</li>
		            <li>  Дарья Николаева, daryanika@gmail.com</li>
                </ul>
            </p>
	        <p>  Также в нашей команде зарегистрированы Альбина Борисова и Ксения Царева</p>
        </div>
    </form>
</asp:Content>
