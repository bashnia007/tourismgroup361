using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tourism.Models;

namespace Tourism.Controllers
{
    public class RouteController : Controller
    {
        //
        // GET: /Route/

        private MuseumsDBEntities3 db = new MuseumsDBEntities3();

        public ActionResult StandartRoute()
        {
            ViewData["header"] = "Получение маршрута из стандартных объектов";
            /*var standartList = (from museums in db.Museums where museums.ID == 6 || museums.ID == 5
                                select museums.addressRUS).ToList();
            //var model = new RouteModel(standartList);*/
            string[] standartList = new string[]
                {
                    "Эрмитаж",
                    "Русский музей",
                    "Петропавловская крепость",
                    "Медный всадник",
                    "Домик Петра Первого",
                    "Крейсер \"Аврора\"",
                    "Казанский собор",
                    "Исакиевский собор",
                    "Храм Спаса на Крови",
                    "Фонтаны Петергофа",
                };
            return View(standartList);
        }

        public ActionResult OwnerRoute()
        {
            ViewData["header"] = "Составление своего маршрута";
            return View();
        }

        public ActionResult ResRoute()
        {
            ViewData["header"] = "Итоговый маршрут";
            return View();
        }

        public ActionResult Map()
        {
            ViewData["header"] = "Итоговый маршрут";
            return View();
        }
    }
}
