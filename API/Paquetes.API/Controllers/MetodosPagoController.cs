using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Paquetes.BusinessLogic.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paquetes.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MetodosPagoController : ControllerBase
    {
        private readonly GeneralService _generalservice;
        private readonly IMapper _mapper;

        public MetodosPagoController(GeneralService generalservice, IMapper mapper)
        {
            _generalservice = generalservice;
            _mapper = mapper;
        }

        [HttpGet]
        public IActionResult List()
        {
            var listado = _generalservice.ListadoDepartamentos();
            return Ok(listado);
        }
    }
}
