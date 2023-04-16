using Dapper;
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
    public class DepartamentosRepository : IRepository<tbDepartamentos, VW_tbDepartamentos>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public VW_tbDepartamentos Find(int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbDepartamentos item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<VW_tbDepartamentos> List()
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            var parametros = new DynamicParameters();
            return db.Query<VW_tbDepartamentos>(ScriptsDataBase.UDP_Departamentos_Select, null, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbDepartamentos item)
        {
            throw new NotImplementedException();
        }
    }
}
