using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;
using System.Net;
using System.IO;
using Tourism.Models;

namespace Tourism.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        private static MonumentsDBEntities db = new MonumentsDBEntities();

        public ActionResult Index()
        {
            // как я понимаю, добавить надо в базу 1 раз, так что этот код не нужно расскоментировывать
            //AddMonumentToDB();
            //

            var monuments = (from monument in db.Monuments select monument).ToList();
            return View(monuments);
        }

        #region // добавление в базу, надо будет позже вынести в отдельный класс
        public void AddMonumentToDB()
        {
            string firstPageAddress = "http://www.kulturnoe-nasledie.ru/regions.php?id=47";

            string urlPattern = "http://www.kulturnoe-nasledie.ru/regions.php?id=47&page=";
            string search = "name_obj";
            string page, address;

            page = getResponse(firstPageAddress);
            parseCode(page, page.IndexOf(search), 0);
            
            for (int pageNumber = 1; pageNumber < 282; pageNumber++)
            {
                address = String.Concat(urlPattern, pageNumber.ToString());
                page = getResponse(address);
                parseCode(page, page.IndexOf(search), 0);
            }
        }

        private static string parse(string htmlCode, int positionOnCode)
        {
            positionOnCode += 10;
            string result = "";
            while (htmlCode[positionOnCode] != '<')
            {
                result += htmlCode[positionOnCode++];
            }
            return result;
        }

        private static void parseCode(string htmlCode, int positionInCode, int numberInRecursion)
        {
            if (numberInRecursion == 10) return;
            string search = "name_obj";
            if (positionInCode == -1) return;
            // получаем имя
            positionInCode = htmlCode.IndexOf(search, positionInCode);
            if (positionInCode == -1) return;
            string name = parse(htmlCode, positionInCode);

            //получаем авторов и даты
            positionInCode = htmlCode.IndexOf(search, positionInCode + 1);
            string architectorsAndDate = parse(htmlCode, positionInCode);

            // получаем адрес
            positionInCode = htmlCode.IndexOf(search, positionInCode + 1);
            string address = parse(htmlCode, positionInCode);

            // добавляем в БД
            Monument monument = new Monument();
            monument.Name = name;
            monument.Address = address;
            monument.Date = architectorsAndDate;
            monument.Architectors = architectorsAndDate;
            db.AddToMonuments(monument);
            db.SaveChanges();

            parseCode(htmlCode, positionInCode + 1, ++numberInRecursion);
        }

        static string getResponse(string uri)
        {
            StringBuilder sb = new StringBuilder();
            byte[] buf = new byte[8192];
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            Stream resStream = response.GetResponseStream();
            int count = 0;
            do
            {
                count = resStream.Read(buf, 0, buf.Length);
                if (count != 0)
                {
                    sb.Append(Encoding.Default.GetString(buf, 0, count));
                }
            }
            while (count > 0);
            return sb.ToString();
        }
        #endregion
    }
}