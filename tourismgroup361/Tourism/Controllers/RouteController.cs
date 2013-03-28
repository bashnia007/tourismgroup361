using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Tourism.Controllers
{
    public class RouteController : Controller
    {
        //
        // GET: /Route/

        public ActionResult StandartRoute()
        {
            return View();
        }

        public ActionResult OwnerRoute()
        {
            return View();
        }

        public ActionResult ResRoute()
        {
            return View();
        }

        public ActionResult Map()
        {
            return View();
        }
    }
}
