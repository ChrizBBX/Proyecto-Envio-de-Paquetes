using Paquetes.DataAccess.Repository;
using Paquetes.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paquetes.BusinessLogic.Services
{
    public class AccesoService
    {
        private readonly UsuariosRepository _usuariosrepository;
        private readonly RegisterRepository _registerrepository;

        public AccesoService(UsuariosRepository usuariosrepository,
            RegisterRepository registerrepository)
        {
            _usuariosrepository = usuariosrepository;
            _registerrepository = registerrepository;
        }
        public IEnumerable<VW_tbUsuarios> Login(VW_tbUsuarios item)
        {
            try
            {
                return _usuariosrepository.Login(item);
            }
            catch (Exception e)
            {

                return Enumerable.Empty<VW_tbUsuarios>();
            }
        }

        public ServiceResult Registrarse(VW_Register item)
        {
            var result = new ServiceResult();
            try
            {
                var insertar = _registerrepository.Insert(item);
                if (insertar.MessageStatus == "1")
                {
                    return result.Ok(insertar.MessageStatus);
                }
                else if (insertar.MessageStatus == "0")
                {
                    return result.Conflict(insertar.MessageStatus);
                }
                else
                {
                    return result.BadRequest(insertar.MessageStatus);
                }

            }
            catch (Exception e)
            {

                throw;
            }
        }
    }
}
