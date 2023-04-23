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
    public class MunicipiosRepository : IRepository<tbMunicipios, VW_tbMunicipios>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public VW_tbMunicipios Find(int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbMunicipios item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<VW_tbMunicipios> List()
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            var parametros = new DynamicParameters();
            return db.Query<VW_tbMunicipios>(ScriptsDataBase.UDP_Municipios_Select, null, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<VW_tbMunicipios> MunicipiosXDepartamentos(VW_tbMunicipios item)
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            var parametros = new DynamicParameters();
            parametros.Add("@dept_ID", item.dept_ID, DbType.String, ParameterDirection.Input);
            return db.Query<VW_tbMunicipios>(ScriptsDataBase.UDP_MunicipiosXDepartamento_Select, parametros, commandType: CommandType.StoredProcedure);
        }

        public RequestStatus Update(tbMunicipios item)
        {
            throw new NotImplementedException();
        }
    }
}
