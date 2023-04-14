using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Paquetes.DataAccess.Repository
{
    public class ScriptsDataBase
    {
        #region Paquetes
        public static string UDP_Paquetes_Select = "paqu.UDP_tbPaquetes_VW";
        #endregion

        #region Metodos de pago
        public static string UDP_MetodosPago_Select = "gral.UDP_tbMetodosPago_VW";
        #endregion

        #region Sucursales
        public static string UDP_Sucursales_Select = "paqu.UDP_tbSucursales_VW";
        #endregion

        #region Usuarios
        public static string UDP_Login = "acce.UDP_Login";
        #endregion
    }
}
