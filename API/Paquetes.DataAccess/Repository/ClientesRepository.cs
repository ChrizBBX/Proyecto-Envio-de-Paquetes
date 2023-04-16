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
    public class ClientesRepository : IRepository<tbPersonas, VW_tbClientes>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public VW_tbClientes Find(int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbPersonas item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<VW_tbClientes> List()
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            var parametros = new DynamicParameters();
            return db.Query<VW_tbClientes>(ScriptsDataBase.UDP_Clientes_Select, null, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbPersonas item)
        {
            throw new NotImplementedException();
        }
    }
}
