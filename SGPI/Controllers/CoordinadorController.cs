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
            var listaUsuarios = context.Usuarios.ToList();
            return View(listaUsuarios);
        }

        [HttpPost]
        public IActionResult ConsultarEstudiante(Usuario user)
        {

            var listaEstudiantes = context.Usuarios.Where(u => u.Documento.Contains(user.Documento) && 
            u.IdRol==3 && u.IdPrograma==user.IdPrograma).ToList();
            ViewBag.programa = context.Programas.ToList();
            //ViewBag.genero = context.Generos.Find(listaEstudiantes[0].IdGenero).ValGenero;
            //ViewBag.programaUsuario = context.Programas.Find(listaEstudiantes[0].IdPrograma).ValPrograma;
            if (listaEstudiantes != null)
            {
                return View(listaEstudiantes);
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
    }
}
