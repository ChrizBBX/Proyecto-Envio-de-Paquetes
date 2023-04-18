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
    public class PaquetesXMunicipioRepository : IRepository<tbPaquetes, VW_PaquetesXMunicipio>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public VW_PaquetesXMunicipio Find(int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbPaquetes item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<VW_PaquetesXMunicipio> List()
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            var parametros = new DynamicParameters();
            return db.Query<VW_PaquetesXMunicipio>(ScriptsDataBase.UDP_PaquetesXMunicipio_Select, null, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbPaquetes item)
        {
            throw new NotImplementedException();
        }
    }
}
