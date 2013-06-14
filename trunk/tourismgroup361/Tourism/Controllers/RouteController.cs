using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Tourism.Models;

namespace Tourism.Controllers
{
    public class RouteController : Controller
    {
        //
        // GET: /Route/
        private DataManager dm = new DataManager();
        private List<MuseumViewModel> userChoice;
        private List<Tuple<string, string>> checkedMuseums;

        public ActionResult StandartRoute()
        {
            ViewData["header"] = "Получение маршрута из стандартных объектов";
            ViewData.Model = dm.GetStandartMuseum();
            return View();
        }

        public ActionResult OwnerRouteTypes()
        {
            ViewData["header"] = "Составление своего маршрута";
            var types = dm.types;
            return View(types);
        }

        [HttpPost]
        public ActionResult OwnerRouteTypes(List<TypeViewModel> lists)
        {
            List<string> checkedTypes = new List<string>();
            for (int i = 0; i < lists.Count; i++)
            {
                if (lists[i].Checked)
                {
                    string type = dm.types.ElementAt(i).Name;
                    checkedTypes.Add(type);
                }

            }
            if (checkedTypes.Count == 0)
                return View();

            userChoice = dm.GetMuseumForTypes(checkedTypes);

            Session.Add("userChoice", userChoice);
            return RedirectToAction("OwnerRouteMuseums");
        }

        public ActionResult OwnerRouteMuseums()
        {
            userChoice = (List<MuseumViewModel>)Session["userChoice"];
            return View(userChoice);
        }

        [HttpPost]
        public ActionResult OwnerRouteMuseums(List<MuseumViewModel> lists)
        {
            checkedMuseums = new List<Tuple<string, string>>();
            userChoice = (List<MuseumViewModel>) Session["userChoice"];
            for (int i = 0; i < lists.Count; i++)
            {
                if (lists[i].Checked)
                {
                    string name = userChoice[i].Name;
                    string address = userChoice[i].Address;
                    Tuple<string, string> pair = new Tuple<string, string> (name, address);

                    checkedMuseums.Add(pair);
                }

            }
            if (checkedMuseums.Count == 0)
                return View();

            Session.Add("museums", checkedMuseums);
            return RedirectToAction("ResRoute");
        }

        public ActionResult ResRoute()
        {
            var mus = Session["museums"];
            return View(mus);
        }

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
