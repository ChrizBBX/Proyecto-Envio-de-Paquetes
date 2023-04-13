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

        public PaquetesService(PaquetesRepository paquetesrepository, SucursalesRepository sucursalesrepository)
        {
            _paquetesrepository = paquetesrepository;
            _sucursalesrepository = sucursalesrepository;
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

    }
}
