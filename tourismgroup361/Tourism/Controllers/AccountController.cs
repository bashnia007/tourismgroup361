using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Tourism.Models;

namespace Tourism.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/

        private MuseumsDBEntities3 db = new MuseumsDBEntities3();

        public bool isValid(string name, string password)
        {
            try
            {
                var selectedUser = (from user in db.Users
                                    where user.name == name && user.password == password
                                    select user).First();
                return !selectedUser.Equals(null);
            }
            catch
            {
            }
            return false;
        }

        private bool isAdmin(string name, string password)
        {
            return (name == "админ" && password == "пингвины");
        }

        public ActionResult LogOn()
        {
            return View();
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index","Home");
        }

        [HttpPost]
        public ActionResult LogOff(AccountModel model)
        {
            return RedirectToAction("HomePage");
        }

        [HttpPost]
        public ActionResult LogOn(AccountModel model)
        {
            FormsAuthentication.SetAuthCookie(model.Name, false);
            if (isAdmin(model.Name, model.Password))
                return RedirectToAction("AdminPage");

            if (isValid(model.Name, model.Password))
                return RedirectToAction("HomePage");

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
            ViewData["header"] = "Регистрация";
            User user = new User();
            return View(user);
        }

        [HttpPost]
        public ActionResult Register(User user)
        {
            ViewData["header"] = "Вход";
            if (isCorrectEnter(user))
            {
                try
                {
                    if (ModelState.IsValid && user.password == user.confirmPassword)
                    {
                        db.AddToUsers(user);
                        db.SaveChanges();
                        return RedirectToAction("HomePage");
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("Error", ex);
                }
            }
            return View();
        }

        [Authorize(Users = "админ")]
        public ActionResult AdminPage()
        {
            ViewData["header"] = "Администраторская(Прегадкое название)";
            return View();
        }


        // delete this shame!!!!
        public ActionResult HomePage()
        {
            ViewData["header"] = "Домашняя страница";
            return View();
        }
    }
}
