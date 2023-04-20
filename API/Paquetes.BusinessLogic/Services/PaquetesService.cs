using Paquetes.DataAccess.Repository;
using Paquetes.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paquetes.BusinessLogic.Services
{
    public class PaquetesService
    {
        private readonly PaquetesRepository _paquetesrepository;
        private readonly SucursalesRepository _sucursalesrepository;
        private readonly ClientesRepository _clientesrepository;
        private readonly PaquetesXMunicipioRepository _paquetesxmunicipiorepository;

        public PaquetesService(PaquetesRepository paquetesrepository, 
            SucursalesRepository sucursalesrepository,
            ClientesRepository clientesrepository,
            PaquetesXMunicipioRepository paquetesxmunicipiorepository)
        {
            _paquetesrepository = paquetesrepository;
            _sucursalesrepository = sucursalesrepository;
            _clientesrepository = clientesrepository;
            _paquetesxmunicipiorepository = paquetesxmunicipiorepository;
        }
        #region Paquetes
        public IEnumerable<VW_tbPaquetes> ListadoPaquetes()
        {
            try
            {
                return _paquetesrepository.List();
            }
            catch (Exception e)
            {

                return Enumerable.Empty<VW_tbPaquetes>();
            }
        }

        public IEnumerable<VW_PaquetesXMunicipio> ListadoPaquetesXMunicipio()
        {
            try
            {
                return _paquetesxmunicipiorepository.List();
            }
            catch (Exception e)
            {

                return Enumerable.Empty<VW_PaquetesXMunicipio>();
            }
        }

        public ServiceResult InsertarPaquete(tbPaquetes item)
        {
            var result = new ServiceResult();
            try
            {
                var insertar = _paquetesrepository.Insert(item);
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
        public ServiceResult DeletePaquete(tbPaquetes item)
        {
            var result = new ServiceResult();
            try
            {
                var insertar = _paquetesrepository.Delete(item);
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
        #endregion

        #region Sucursales
        public IEnumerable<VW_tbSucursales> ListadoSucursales()
        {
            try
            {
                return _sucursalesrepository.List();
            }
            catch (Exception e)
            {

                return Enumerable.Empty<VW_tbSucursales>();
            }
        }
        #endregion

        #region Clientes
        public IEnumerable<VW_tbClientes> ListadoClientes()
        {
            try
            {
                return _clientesrepository.List();
            }
            catch (Exception e)
            {

                return Enumerable.Empty<VW_tbClientes>();
            }
        }
        #endregion

    }
}
