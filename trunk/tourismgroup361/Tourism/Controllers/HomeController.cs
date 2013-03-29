using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tourism.Models;

namespace Tourism.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        private MuseumsDBEntities3 db = new MuseumsDBEntities3();
        
        public ActionResult Index()
        {
            ViewData["header"] = "Добро пожаловать на наш сайт!";
            return View();
        }

        public ActionResult ShowMonumentsDB()
        {
            ViewData["header"] = "База данных по музеям(самая первая)";
            var monuments = (from monument in db.Monuments select monument).ToList();
            return View(monuments);
        }

        public ActionResult Contacts()
        {
            ViewData["header"] = "Контакты";
            return View();
        }

        public ActionResult MapOfSite()
        {
            ViewData["header"] = "Карта сайта";
            return View();
        }

        public ActionResult Links()
        {
            ViewData["header"] = "Полезные ссылки";
            return View();
        }

        public ActionResult ShowMuseumsDB()
        {
            //ParserMuseums parser = new ParserMuseums();
            //parser.Parse();
            ViewData["header"] = "База данных по музеям(самая вторая)";
            var museums = (from museum in db.Museums select museum).ToList();
            return View(museums);
        }

        public ActionResult UpdateKultNasDB()
        {
            ViewData["header"] = "Обновление базы данных";
            //ParserKN parser = new ParserKN();
            //parser.AddMonumentToDB();
            return View();
        }

        public ActionResult Error404()
        {
            ViewData["header"] = "Такой страницы не существует!";
            return View();
        }
    }
}
