﻿using Dapper;
using Microsoft.Data.SqlClient;
using Paquetes.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paquetes.DataAccess.Repository
{
    public class SucursalesRepository : IRepository<tbSucursales, VW_tbSucursales>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public VW_tbSucursales Find(int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbSucursales item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<VW_tbSucursales> List()
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            var parametros = new DynamicParameters();
            return db.Query<VW_tbSucursales>(ScriptsDataBase.UDP_Sucursales_Select, null, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbSucursales item)
        {
            throw new NotImplementedException();
        }
    }
}
