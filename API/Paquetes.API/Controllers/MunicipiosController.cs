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
    public class MunicipiosController : ControllerBase
    {
        private readonly GeneralService _generalservice;
        private readonly IMapper _mapper;

        public MunicipiosController(GeneralService generalservice, IMapper mapper)
        {
            _generalservice = generalservice;
            _mapper = mapper;
        }

        [HttpPost]
        public IActionResult MunicipiosXDepartamentos(VW_tbMunicipios item)
        {
            var listado = _generalservice.ListadoMunicipiosXDepartamento(item);
            return Ok(listado);
        }
    }
}
