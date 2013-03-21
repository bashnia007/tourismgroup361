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

        private MuseumsDBEntities db = new MuseumsDBEntities();

        public ActionResult Index()
        {
            // как я понимаю, добавить надо в базу 1 раз, так что этот код не нужно расскоментировывать
            //AddMonumentToDB();
            //
            //string str = deleteBR(getResponse("http://klingof.narod.ru/Peter/doc/Museums.htm"));
            //parse(str);
            //var monuments = (from monument in db.Monuments select monument).ToList();
            //db.DeleteDatabase();
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

        public ActionResult StandartRoute()
        {
            return View();
        }
        public bool isValid(string name, string password)
        {
            try
            {
                var selectedUser = (from user in db.Users
                                    where user.name == name && user.password == password
                                    select user).First();
                return !selectedUser.Equals(null);
            }
            catch { }
            return false;
        }

        public ActionResult OwnerRoute()
        {
            return View();
        }

        public ActionResult HomePage()
        {
            return View();
        }

        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(AccountModel model)
        {
            if (isValid(model.Name, model.Password))
            {
                return RedirectToAction("HomePage");
            }

            return View();
        }

        private bool isCorrectEnter(User user)
        {
            return (user.e_mail != null &&
                user.name != null &&
                user.password != null);
        }

        public ActionResult Register()
        {
            User user = new User();
            return View(user);
        }

        [HttpPost]
        public ActionResult Register(User user)
        {
            if (isCorrectEnter(user))
            {
                try
                {
                    if (ModelState.IsValid)
                    {
                        db.AddToUsers(user);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("Error", ex);
                }
            }
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
