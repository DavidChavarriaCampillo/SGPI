using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SGPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SGPI.Controllers
{
    public class AdministradorController : Controller
    {

        //SGPDBContext context;

        /*public AdministradorController(SGPDBContext contexto)
        {

            context = contexto;

        }*/

        // GET: AdministradorController
        public ActionResult MenuAdministrador()
        {
            return View();
        }

        // GET: AdministradorController/Details/5
        public IActionResult CrearUsuario()
        {

            SGPDBContext context = new SGPDBContext();
            ViewBag.tipodoc = context.Documentos.ToList();
            ViewBag.programa = context.Programas.ToList();
            ViewBag.rol = context.Rols.ToList();
            ViewBag.genero = context.Generos.ToList();
            return View();

        }

        // POST: AdministradorController/Create
        [HttpPost]
        public IActionResult CrearUsuario(Usuario user)
        {

            SGPDBContext context = new SGPDBContext();
            context.Add(user);
            context.SaveChanges();
            return View();

        }

        // GET: AdministradorController/BuscarUsuario
        public IActionResult BuscarUsuario()
        {
            return View();
        }

        [HttpPost]
        public IActionResult BuscarUsuario(Usuario user)
        {

            //var listaUsuarios = context.Usuarios.
            return View();
        }

        // GET: AdministradorController/Informes
        public ActionResult Informes()
        {
            return View();
        }

        // POST: AdministradorController/Create
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

        // GET: AdministradorController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: AdministradorController/Edit/5
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

        // GET: AdministradorController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: AdministradorController/Delete/5
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
