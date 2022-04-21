using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SGPI.Controllers
{
    public class CoordinadorController : Controller
    {
        // GET: CoordinadorController
        public ActionResult MenuCoordinador()
        {
            return View();
        }

        // GET: CoordinadorController/Details/5
        public ActionResult ConsultarEstudiante()
        {
            return View();
        }

        // GET: CoordinadorController/Create
        public ActionResult ProgramarAsignatura()
        {
            return View();
        }

        // GET: CoordinadorController/Create
        public ActionResult Homologar()
        {
            return View();
        }

        // GET: CoordinadorController/Create
        public ActionResult EntrevistaAdmicion()
        {
            return View();
        }

        // POST: CoordinadorController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: CoordinadorController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: CoordinadorController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: CoordinadorController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: CoordinadorController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
