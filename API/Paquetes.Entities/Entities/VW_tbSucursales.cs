﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace Paquetes.Entities.Entities
{
    public partial class VW_tbSucursales
    {
        public int sucu_ID { get; set; }
        public string sucu_Nombre { get; set; }
        public string muni_ID { get; set; }
        public string sucu_DireccionExacta { get; set; }
        public DateTime? sucu_FechaCreacion { get; set; }
        public int sucu_UserCreacion { get; set; }
        public DateTime? sucu_FechaModificacion { get; set; }
        public int? sucu_UserModificacion { get; set; }
        public bool? sucu_Estado { get; set; }
    }
}