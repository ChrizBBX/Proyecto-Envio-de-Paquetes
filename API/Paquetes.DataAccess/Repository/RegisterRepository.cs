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
    public class RegisterRepository : IRepository<tbUsuarios, VW_Register>
    {
        public RequestStatus Delete(int id)
        {
            throw new NotImplementedException();
        }

        public VW_Register Find(int id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(VW_Register item)
        {
            using var db = new SqlConnection(PaquetesContext.ConnectionString);
            RequestStatus result = new RequestStatus();
            var parametros = new DynamicParameters();
            parametros.Add("@pers_Identidad", item.pers_Identidad, DbType.String, ParameterDirection.Input);
            parametros.Add("@pers_Nombres", item.pers_Nombres, DbType.String, ParameterDirection.Input);
            parametros.Add("@pers_Apellidos", item.pers_Apellidos, DbType.String, ParameterDirection.Input);
            parametros.Add("@pers_Sexo", item.pers_Sexo, DbType.String, ParameterDirection.Input);
            parametros.Add("@user_Username", item.user_Username, DbType.String, ParameterDirection.Input);
            parametros.Add("@user_Contrasena", item.user_Contrasena, DbType.String, ParameterDirection.Input);
            var answer = db.QueryFirst<string>(ScriptsDataBase.UDP_Register, parametros, commandType: CommandType.StoredProcedure);

            result.MessageStatus = answer;
            return result;
        }

        public RequestStatus Register(tbUsuarios item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<VW_Register> List()
        {
            throw new NotImplementedException();
        }

        public RequestStatus Update(tbUsuarios item)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insert(tbUsuarios item)
        {
            throw new NotImplementedException();
        }
    }
}
