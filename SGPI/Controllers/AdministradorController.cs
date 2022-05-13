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
        SGPDBContext context;

        public AdministradorController(SGPDBContext contexto)
        {
            context = contexto;
        }

        // GET: AdministradorController
        public ActionResult MenuAdministrador()
        {
            return View();
        }

        // GET: AdministradorController/Details/5
        public IActionResult CrearUsuario()
        {
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
            context.Add(user);
            context.SaveChanges();
            ViewBag.tipodoc = context.Documentos.ToList();
            ViewBag.programa = context.Programas.ToList();
            ViewBag.rol = context.Rols.ToList();
            ViewBag.genero = context.Generos.ToList();
            return View();
        }

        // GET: AdministradorController/BuscarUsuario
        public IActionResult BuscarUsuario()
        {
            var listaUsuarios = context.Usuarios.ToList();
            var listaprogram = context.Programas.ToList();
            List<string> listaprogramas = new List<string>();
            foreach (var user in listaUsuarios)
            {
                if(user.IdPrograma != null)
                {
                    foreach (var programa in listaprogram)
                    {
                        if (user.IdPrograma == programa.IdPrograma)
                        {
                            listaprogramas.Add(programa.ValPrograma);
                        }
                    }
                }
                else
                {
                    listaprogramas.Add("no programa");
                }
                
            }
            ViewBag.programa = listaprogramas;
            return View(listaUsuarios);
        }

        [HttpPost]
        public IActionResult BuscarUsuario(Usuario user)
        {
            var listaUsuarios = context.Usuarios.Where(u => u.Documento.Contains(user.Documento)).ToList();
            if (listaUsuarios != null)
            {
                return View(listaUsuarios);
            }
            else
            {
                return View();
            }
        }

        // GET: AdministradorController/Informes
        public ActionResult Informes()
        {
            return View();
        }

        // GET: AdministradorController/Edit/5
        public ActionResult Edit(int id)
        {
            ViewBag.tipodoc = context.Documentos.ToList();
            ViewBag.programa = context.Programas.ToList();
            ViewBag.rol = context.Rols.ToList();
            ViewBag.genero = context.Generos.ToList();
            var listaUsuarios = context.Usuarios.Where(u => u.IdUsuario == id).ToList();
            if (listaUsuarios != null)
            {
                return View(listaUsuarios.SingleOrDefault());
            }
            else
            {
                return View();
            }
        }

        // POST: AdministradorController/Edit/5
        [HttpPost]
        public IActionResult Edit(Usuario user)
        {
            Usuario usuario = user;
            if (usuario == null)
                return ViewBag.mensaje = "Eror al editar usuario";
            else
            {
                context.Update(user);
                context.SaveChanges();
                ViewBag.tipodoc = context.Documentos.ToList();
                ViewBag.programa = context.Programas.ToList();
                ViewBag.rol = context.Rols.ToList();
                ViewBag.genero = context.Generos.ToList();
            }

            return RedirectToAction("BuscarUsuario");
        }

        // GET: AdministradorController/Delete/5
        public ActionResult Delete(Usuario user)
        {
            Usuario usuario = user;
            if (usuario == null)
                return ViewBag.mensaje = "Eror al editar usuario";
            else
            {
                context.Remove(user);
                context.SaveChanges();
            }

            return RedirectToAction("BuscarUsuario");
        }
    }
}
