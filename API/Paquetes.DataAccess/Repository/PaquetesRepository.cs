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
        public RequestStatus Delete(tbPaquetes item)
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            RequestStatus result = new RequestStatus();
            var parametros = new DynamicParameters();
            parametros.Add("@paqu_ID", item.paqu_ID, DbType.Int32, ParameterDirection.Input);
            var answer = db.QueryFirst<string>(ScriptsDataBase.UDP_Paquetes_Delete, parametros, commandType: CommandType.StoredProcedure);

            result.MessageStatus = answer;
            return result;
        }

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
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            RequestStatus result = new RequestStatus();
            var parametros = new DynamicParameters();
            parametros.Add("@paqu_Cliente", item.paqu_Cliente, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@sucu_ID", item.sucu_ID, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@paqu_Peso", item.paqu_Peso, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@paqu_Fragil", item.paqu_Fragil, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@meto_ID", 1, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@muni_ID", item.muni_ID, DbType.String, ParameterDirection.Input);
            parametros.Add("@paqu_DireccionExacta", item.paqu_DireccionExacta, DbType.String, ParameterDirection.Input);
            parametros.Add("@paqu_FechaSalida", item.paqu_FechaSalida, DbType.DateTime, ParameterDirection.Input);        
            parametros.Add("@trac_ID", item.trac_ID, DbType.Int32, ParameterDirection.Input);
            parametros.Add("@paqu_UserCreacion", 1, DbType.Int32, ParameterDirection.Input);
            var answer = db.QueryFirst<string>(ScriptsDataBase.UDP_Paquetes_Insert, parametros, commandType: CommandType.StoredProcedure);

            result.MessageStatus = answer;
            return result;
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
