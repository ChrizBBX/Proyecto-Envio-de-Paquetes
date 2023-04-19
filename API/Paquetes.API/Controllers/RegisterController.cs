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
    public class RegisterController : ControllerBase
    {
        private readonly AccesoService _accesoservice;
        private readonly IMapper _mapper;

        public RegisterController(AccesoService accesoservice, IMapper mapper)
        {
            _accesoservice = accesoservice;
            _mapper = mapper;
        }

        [HttpPost]
        public IActionResult Register(VW_Register item)
        {
            var listado = _accesoservice.Registrarse(item);
            return Ok(listado);
        }
    }
}
