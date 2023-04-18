using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paquetes.API.Models;
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
    public class PaquetesController : ControllerBase
    {
        private readonly PaquetesService _paquetesService;
        private readonly IMapper _mapper;

        public PaquetesController(PaquetesService terminalService, IMapper mapper)
        {
            _paquetesService = terminalService;
            _mapper = mapper;
        }

        [HttpGet]
        public IActionResult List()
        {
            var listado = _paquetesService.ListadoPaquetes();
            return Ok(listado);
        }

        [HttpPost("Insert")]
        public IActionResult Insert(PaquetesViewModel item)
        {
            var listadoMapeado = _mapper.Map<tbPaquetes>(item);
            var listado = _paquetesService.InsertarPaquete(listadoMapeado);
            return Ok(listado);
        }
    }
}
