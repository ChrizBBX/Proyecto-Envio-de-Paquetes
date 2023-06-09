﻿using System;
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
        public static string UDP_PaquetesXMunicipio_Select = "paqu.UDP_PaquetesXMunicipio_VW";
        public static string UDP_Paquetes_Insert = "paqu.UDP_tbPaquetes_Insert";
        public static string UDP_Paquetes_Edit = "paqu.UDP_tbPaquetes_Edit";
        public static string UDP_Paquetes_Delete = "paqu.UDP_tbPaquetes_Delete";
        public static string UDP_PaquetesXCliente_Select = "paqu.UDP_tbPaquetes_PaquetesXCliente";
        #endregion

        #region Metodos de pago
        public static string UDP_MetodosPago_Select = "gral.UDP_tbMetodosPago_VW";
        #endregion

        #region Sucursales
        public static string UDP_Sucursales_Select = "paqu.UDP_tbSucursales_VW";
        #endregion

        #region Usuarios
        public static string UDP_Login = "acce.UDP_Login";
        public static string UDP_Register = "acce.UDP_Register";
        public static string UDP_RecoverPassword = "acce.UDP_Recover_Password";
        #endregion

        #region Clientes
        public static string UDP_Clientes_Select = "paqu.UDP_tbClientes_VW";
        #endregion

        #region Departamentos
        public static string UDP_Departamentos_Select = "gral.UDP_tbDepartamentos_VW";
        #endregion

        #region Municipios
        public static string UDP_Municipios_Select = "gral.UDP_tbMunicipios_VW";
        public static string UDP_MunicipiosXDepartamento_Select = "gral.UDP_tbMunicipiosXtbDepartamentos";
        #endregion
    }
}
