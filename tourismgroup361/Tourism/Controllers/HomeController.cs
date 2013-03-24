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

        private MuseumsDBEntities2 db = new MuseumsDBEntities2();
        private bool isEnglish = false;

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ShowMonumentsDB()
        {
            var monuments = (from monument in db.Monuments select monument).ToList();
            return View(monuments);
        }

        public ActionResult Contacts()
        {
            return View();
        }

        public ActionResult MapOfSite()
        {
            return View();
        }

        public ActionResult ShowMuseumsDB()
        {
            ParserMuseums parser = new ParserMuseums();
            //parser.Parse();
            var museums = (from museum in db.Museums select museum).ToList();
            return View(museums);
        }

        public ActionResult UpdateKultNasDB()
        {
            ParserKN parser = new ParserKN();
            //parser.AddMonumentToDB();
            return View();
        }
    }
}
