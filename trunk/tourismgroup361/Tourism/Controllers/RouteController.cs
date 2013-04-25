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
        private DataManager dm = new DataManager();
        //private Museum[] _userChoice;

        public ActionResult StandartRoute()
        {
            ViewData["header"] = "Получение маршрута из стандартных объектов";
            ViewData.Model = dm.GetStandartMuseum();
            return View();
        }

        /*
        [HttpPost]
        public ActionResult StandartRoute (RouteModel model)
        {
            if (model.museumCollection != null)
            {
                foreach (var checkBoxTestItem in model.museumCollection)
                    ModelState.AddModelError("", string.Format("Checked CheckBox item: {0}", checkBoxTestItem));
            }
            GenerateListItems();
            return View(model);
        }*/

        /*private void GenerateListItems()
        {
            var dm = new DataManager();
            var checkBoxTestItems = dm.GetStandartMuseum();
            //var checkBoxTestItemsChecked = new[] { "CheckBoxTestItem2", "CheckBoxTestItem4" };
            ViewData["CheckBoxTestItems"] = new SelectList(checkBoxTestItems/*, checkBoxTestItemsChecked);
        }*/

        public ActionResult OwnerRoute()
        {
            ViewData["header"] = "Составление своего маршрута";
            var types = dm.Types;
            return View(types);
        }

        /*public ActionResult OwnerRoute(SelectList types)
        {
            var res = new List<Museum>();
            foreach (string type in types)
            {
                res.Add(dm.GetMuseumForType(type));
            }
            return View();
        }*/

        // it works incorrectly :'-(
        /*public ActionResult ResRoute(Museum[] checkedMuseums)
        {
            ViewData["header"] = "Ваш выбор объектов:";
            ViewData.Model = checkedMuseums;
            return View();
        }*/

        public ActionResult Map()
        {
            ViewData["header"] = "Итоговый маршрут";
            return View();
        }

        public ViewResult Search(string query)
        {
            var result = dm.Search(query);
            return View(result);
        }
    }
}
