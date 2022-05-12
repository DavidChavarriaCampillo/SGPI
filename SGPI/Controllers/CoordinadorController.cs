using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SGPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SGPI.Controllers
{
    public class CoordinadorController : Controller
    {

        SGPDBContext context;

        public CoordinadorController(SGPDBContext contexto)
        {

            context = contexto;

        }

        // GET: CoordinadorController
        public ActionResult MenuCoordinador()
        {
            return View();
        }

        // GET: CoordinadorController/Details/5
        public IActionResult ConsultarEstudiante()
        {
            Usuario user = new Usuario();
            ViewBag.programa = context.Programas.ToList();
            return View(user);
        }

        [HttpPost]
        public IActionResult ConsultarEstudiante(Usuario user)
        {

            var listaEstudiantes = context.Usuarios.Where(u => u.Documento.Contains(user.Documento) && 
            u.IdRol==3 && u.IdPrograma==user.IdPrograma).ToList();
            ViewBag.programa = context.Programas.ToList();
            ViewBag.genero = context.Generos.Find(listaEstudiantes[0].IdGenero).ToString();
            if (listaEstudiantes != null)
            {
                return View(listaEstudiantes.SingleOrDefault());
            }
            else
            {
                return View();
            }

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
