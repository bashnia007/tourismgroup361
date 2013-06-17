<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Error</title>
</head>
<body>
        <h1>
            Ошибка!</h1>
       
       <br/>
       Ой, что-то не так! Видимо, база данных не откликается на запросы :'(
       <br/>
       Но вы не волнуйтесь, ведь наши высококвалифицированные специалисты активно думают над этой проблемой!
       <br />
    <!---<img src="../../Img/SHkiper1.gif" width="100%" />-->
    <img src="http://localhost:60287/Img/profi.jpg" />
    <h3>
        <%: Html.ActionLink("Вернуться на главную", "Index", "Home") %></h3>
</body>
</html>
