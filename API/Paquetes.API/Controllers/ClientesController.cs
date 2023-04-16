using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Paquetes.BusinessLogic.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paquetes.API.Controllers
{
    public class ClientesController : Controller
    {
        private readonly PaquetesService _paquetesservice;
        private readonly IMapper _mapper;

        public ClientesController(PaquetesService paquetesservice, IMapper mapper)
        {
            _paquetesservice = paquetesservice;
            _mapper = mapper;
        }

        [HttpGet("api/Clientes")]
        public IActionResult List()
        {
            var listado = _paquetesservice.ListadoClientes();
            return Ok(listado);
        }
    }
}
