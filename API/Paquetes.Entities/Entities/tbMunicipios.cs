﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace Paquetes.Entities.Entities
{
    public partial class tbMunicipios
    {
        public tbMunicipios()
        {
            tbPaquetes = new HashSet<tbPaquetes>();
            tbSucursales = new HashSet<tbSucursales>();
        }

        public string dept_ID { get; set; }
        public string muni_ID { get; set; }
        public string muni_Descripcion { get; set; }
        public int? muni_Estado { get; set; }
        public int? muni_UserCreacion { get; set; }
        public DateTime? muni_FechaCreacion { get; set; }
        public int? muni_UserModificacion { get; set; }
        public DateTime? muni_FechaModificacion { get; set; }

        public virtual tbDepartamentos dept { get; set; }
        public virtual ICollection<tbPaquetes> tbPaquetes { get; set; }
        public virtual ICollection<tbSucursales> tbSucursales { get; set; }
    }
}