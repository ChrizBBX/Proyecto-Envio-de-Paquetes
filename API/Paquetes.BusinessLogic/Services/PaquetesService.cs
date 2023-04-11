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

        public PaquetesService(PaquetesRepository paquetesrepository)
        {
            _paquetesrepository = paquetesrepository;
        }
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
    }
}
