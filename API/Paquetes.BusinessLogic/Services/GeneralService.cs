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
        private readonly DepartamentosRepository _departamentosrepository;

        public GeneralService(MetodosPagoRepository metodospagorepository,
            DepartamentosRepository departamentosrepository)
        {
            _metodospagorepository = metodospagorepository;
            _departamentosrepository = departamentosrepository;
        }

        #region MetodosDePago
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
        #endregion

        #region Departamentos
        public IEnumerable<VW_tbDepartamentos> ListadoDepartamentos()
        {
            try
            {
                return _departamentosrepository.List();
            }
            catch (Exception e)
            {
                return Enumerable.Empty<VW_tbDepartamentos>();
            }
        }
        #endregion
    }
}
