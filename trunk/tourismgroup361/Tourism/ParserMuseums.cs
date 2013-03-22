using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using Tourism.Models;

namespace Tourism
{
    public class ParserMuseums
    {
        private MuseumsDBEntities2 dataBase = new MuseumsDBEntities2();

        public void Parse()
        {
            string str = deleteBR(getResponse("http://klingof.narod.ru/Peter/doc/Museums.htm"));
            parse(str);
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

        // получаем общее количество музеев
        private static int numOfMuseums(string htmlCode)
        {
            string objectToSearch = "Всего музеев :";
            int positionInCode = htmlCode.IndexOf(objectToSearch);
            positionInCode += 15;
            string number = "";
            while (htmlCode[positionInCode] != '<')
            {
                number += htmlCode[positionInCode++];
            }
            return Convert.ToInt32(number);
        }

        private string deleteBR(string htmlCode)
        {
            string result = "";
            List<int> arrayOfBR = new List<int>();
            //List<int> arrayOfOpenB = new List<int>();
            //List<int> arrayOfCloseB = new List<int>();
            int posBR = 0;
            //int posOpenB = 0;
            //int posClosedB = 0;
            while (/*posOpenB != -1 || */posBR != -1/* || posClosedB != -1*/)
            {
                posBR = htmlCode.IndexOf("<BR>", posBR + 4);
                arrayOfBR.Add(posBR);
                /*
                posOpenB = htmlCode.IndexOf("<B>", posOpenB + 3);
                arrayOfOpenB.Add(posOpenB);

                posClosedB = htmlCode.IndexOf("</B>", posClosedB + 4);
                arrayOfCloseB.Add(posClosedB);
                */
            }

            for (int i = 880; i < htmlCode.Length; i++)
            {
                if (arrayOfBR.Contains(i))
                {
                    i += 4;
                }
                /*
                if (arrayOfOpenB.Contains(i))
                {
                    i += 3;
                }

                if (arrayOfCloseB.Contains(i))
                {
                    i += 4;
                }*/
                result += htmlCode[i];
            }

            return result;
        }

        private string parse(string htmlCode)
        {
            string nameRUS = " ", nameENG = " ";
            string phones = " ";
            string addressRUS = " ", addressENG = " ";
            string description = " ";
            int propertyNumber = 0;
            string result = " ";

            for (int i = 0; i < htmlCode.Length; i++)
            {
                if (htmlCode[i] == '<' && htmlCode[i + 1] == 'H')
                {
                    propertyNumber = 0;

                    // добавление в базу
                    Museum museum = new Museum();
                    museum.nameRUS = nameRUS;
                    museum.nameENG = nameENG;
                    museum.contacts = phones;
                    museum.addressRUS = addressRUS;
                    museum.addressENG = addressENG;
                    museum.description = description;
                    dataBase.AddToMuseums(museum);
                    dataBase.SaveChanges();
                }
                
                if (htmlCode[i] == '>' && htmlCode[i + 1] != '<')
                {
                    result = getText(htmlCode, i + 1);
                    if (result == "\r\n") continue;
                    switch (propertyNumber)
                    {
                        case 0:
                            nameRUS = result;
                            break;
                        case 1:
                            if (isEnglish(result))
                            {
                                nameENG = result;
                            }
                            else
                            {
                                phones = result;
                            }
                            break;
                        case 2:
                            phones += result;
                            break;
                        case 3:
                            addressRUS = result;
                            break;
                        case 4:
                            if (isEnglish(result))
                            {
                                addressENG = result;
                            }
                            break;
                        default:
                            description += result;
                            break;
                    }
                    propertyNumber++;

                }

            }

            return result;
        }

        private bool isEnglish(string str)
        {
            str = str.ToLower();
            
            for (int i = 0; i < str.Length; i++)
            {
                if (str[i] >= 'a' && str[i] <= 'z')
                    return true;
            }
            return false;
        }

        private string getText(string htmlCode, int pos)
        {
            string res = "";
            while (htmlCode[pos] != '<')
            {
                res += htmlCode[pos++];
            }

            return res;
        }
    }
}