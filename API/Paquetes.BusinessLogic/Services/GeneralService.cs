using Paquetes.DataAccess.Repository;
using Paquetes.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paquetes.BusinessLogic.Services
{
    public class GeneralService
    {
        private readonly MetodosPagoRepository _metodospagorepository;

        public GeneralService(MetodosPagoRepository metodospagorepository)
        {
            _metodospagorepository = metodospagorepository;
        }

        public IEnumerable<VW_tbMetodosPago> ListadoMetodosPago()
        {
            try
            {
                return _metodospagorepository.List();
            }
            catch (Exception e)
            {

                return Enumerable.Empty<VW_tbMetodosPago>();
            }
        }
    }
}
