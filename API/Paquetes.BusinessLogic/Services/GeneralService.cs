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
        private readonly MunicipiosRepository _municipiosrepository;

        public GeneralService(MetodosPagoRepository metodospagorepository,
            DepartamentosRepository departamentosrepository,
            MunicipiosRepository municipiosrepository)
        {
            _metodospagorepository = metodospagorepository;
            _departamentosrepository = departamentosrepository;
            _municipiosrepository = municipiosrepository;
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

        #region Municipios
        public IEnumerable<VW_tbMunicipios> ListadoMunicipios()
        {
            try
            {
                return _municipiosrepository.List();
            }
            catch (Exception e)
            {
                return Enumerable.Empty<VW_tbMunicipios>();
            }
        }

        public IEnumerable<VW_tbMunicipios> ListadoMunicipiosXDepartamento(VW_tbMunicipios item)
        {
            try
            {
                return _municipiosrepository.MunicipiosXDepartamentos(item);
            }
            catch (Exception e)
            {
                return Enumerable.Empty<VW_tbMunicipios>();
            }
        }
        #endregion
    }
}
