﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace Paquetes.Entities.Entities
{
    public partial class VW_tbPaquetes
    {
        public int paqu_ID { get; set; }
        public int paqu_Cliente { get; set; }
        public string paqu_ClienteNombreCompleto { get; set; }
        public int sucu_ID { get; set; }
        public string sucu_Nombre { get; set; }
        public int paqu_Peso { get; set; }
        public bool paqu_Fragil { get; set; }
        public int meto_ID { get; set; }
        public string muni_ID { get; set; }
        public string muni_Descripcion { get; set; }
        public string paqu_DireccionExacta { get; set; }
        public DateTime paqu_FechaSalida { get; set; }
        public int? trac_ID { get; set; }
        public string Tracking { get; set; }
        public DateTime? paqu_FechaCreacion { get; set; }
        public int paqu_UserCreacion { get; set; }
        public DateTime? paqu_FechaModificacion { get; set; }
        public int? paqu_UserModificacion { get; set; }
        public bool? paqu_Estado { get; set; }
    }
}