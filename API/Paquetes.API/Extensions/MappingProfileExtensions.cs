using AutoMapper;
using Paquetes.API.Models;
using Paquetes.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paquetes.API.Extensions
{
    public class MappingProfileExtensions: Profile
    {
        public MappingProfileExtensions()
        {
            CreateMap<PaquetesViewModel, tbPaquetes>().ReverseMap();
        }
    }
}
