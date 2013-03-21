using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Text;
using System.Net;
using Tourism.Models;

namespace Tourism
{
    public class ParserKN
    {
        private MuseumsDBEntities2 dataBase = new MuseumsDBEntities2();

        public ParserKN()
        {}

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

        private string parse(string htmlCode, int positionOnCode)
        {
            positionOnCode += 10;
            string result = "";
            while (htmlCode[positionOnCode] != '<')
            {
                result += htmlCode[positionOnCode++];
            }
            return result;
        }

        private void parseCode(string htmlCode, int positionInCode, int numberInRecursion)
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
            monument.name = name;
            monument.address = address;
            monument.info = architectorsAndDate;
            // вот это поле лишнее, позже надо будет убрать
            monument.date = architectorsAndDate;

            dataBase.AddToMonuments(monument);
            dataBase.SaveChanges();

            parseCode(htmlCode, positionInCode + 1, ++numberInRecursion);
        }

        string getResponse(string uri)
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
    }
}