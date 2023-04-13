﻿using Microsoft.Extensions.DependencyInjection;
using Paquetes.BusinessLogic.Services;
using Paquetes.DataAccess;
using Paquetes.DataAccess.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paquetes.BusinessLogic
{
    public static class ServiceConfiguration
    {
        public static void DataAccess(this IServiceCollection service, string connectionString)
        {
            service.AddScoped<PaquetesRepository>();
            service.AddScoped<MetodosPagoRepository>();
            service.AddScoped<SucursalesRepository>();

            PaquetesContext.BuildConnectionString(connectionString);
        }
        public static void BusinessLogic(this IServiceCollection service)
        {
            service.AddScoped<PaquetesService>();
            service.AddScoped<GeneralService>();
        }
    }
}
