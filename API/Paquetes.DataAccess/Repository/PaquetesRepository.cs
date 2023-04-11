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
    public class PaquetesRepository : IRepository<tbPaquetes, VW_tbPaquetes>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public VW_tbPaquetes Find(int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbPaquetes item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<VW_tbPaquetes> List()
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            var parametros = new DynamicParameters();
            return db.Query<VW_tbPaquetes>(ScriptsDataBase.UDP_Paquetes_Select, null, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbPaquetes item)
        {
            throw new NotImplementedException();
        }
    }
}
