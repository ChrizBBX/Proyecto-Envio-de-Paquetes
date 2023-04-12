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
    public class MetodosPagoRepository : IRepository<tbMetodosPago, VW_tbMetodosPago>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public VW_tbMetodosPago Find(int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbMetodosPago item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<VW_tbMetodosPago> List()
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            var parametros = new DynamicParameters();
            return db.Query<VW_tbMetodosPago>(ScriptsDataBase.UDP_MetodosPago_Select, null, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbMetodosPago item)
        {
            throw new NotImplementedException();
        }
    }
}
