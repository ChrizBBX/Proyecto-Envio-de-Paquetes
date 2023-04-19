using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paquetes.BusinessLogic.Services;
using Paquetes.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paquetes.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {
        private readonly AccesoService _accesoservice;
        private readonly IMapper _mapper;

        public UsuariosController(AccesoService accesoservice, IMapper mapper)
        {
            _accesoservice = accesoservice;
            _mapper = mapper;
        }

        [HttpPut("Login")]
        public IActionResult Login(VW_tbUsuarios item)
        {
            var listado = _accesoservice.Login(item);
            return Ok(listado);
        }

        [HttpPut("Recover")]
        public IActionResult Recover(VW_tbUsuarios item)
        {
            var listado = _accesoservice.Recover(item);
            return Ok(listado);
        }
    }
}
