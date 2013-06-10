 <%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Контакты</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="contactsForm" runat="server">
            <p>
                Данный сайт разработан в рамках курса "Программная инженерия" студентами кафедры системного программирования математико-механического факультета Санкт-Петербургского Государственного университета.
            </p>
            <p>	 По вопросам работы сайта и размещения рекламы обращайтесь к разработчикам:
		        <ul>
		            <li>  Александру Кавокину, alexanderkavokin@gmail.com</li>
		            <li>  Андрею Иванову, ivanovandrew2004@gmail.com</li>
                </ul>
            </p>
	        
            <p>  Если Вы хотите предложить трудоустройство талантливым программистам, освоившим за месяц веб-программирование с нуля, также обращайтесь по указанным выше адресам.</p>
            <p>  Разработкой документации к данному сайту занимались: 
		        <ul>
              	 <li>  Дарья Николаева, daryanika@gmail.com</li>
		         <li>  Андрей Иванов, ivanovandrew2004@gmail.com</li>
		         <li>  Александр Кавокин, alexanderkavokin@gmail.com</li>
                 <li>  Альбина Борисова, borisova.albina@gmail.com</li>
                </ul>
            </p>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Advertising" runat="server">
    <br/>
    <a href="http://www.math.spbu.ru/rus/">
        <img src="../../Img/spbu.png" width="100%" /></a><br />
    <br />
     <a href="http://www.math.spbu.ru/rus/"><img src="../../Img/matmex.png" width="100%" /></a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeaderLine" runat="server">
    <h1>Контакты</h1>
</asp:Content>
