using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Paquetes.API.Models
{
    public class PaquetesViewModel
    {
        public int paqu_ID { get; set; }
        public int paqu_Cliente { get; set; }
        public int sucu_ID { get; set; }
        public int paqu_Peso { get; set; }
        public bool paqu_Fragil { get; set; }
        public int meto_ID { get; set; }
        public string muni_ID { get; set; }
        public string paqu_DireccionExacta { get; set; }
        public DateTime paqu_FechaSalida { get; set; }
        public int? trac_ID { get; set; }
        public DateTime? paqu_FechaCreacion { get; set; }
        public int paqu_UserCreacion { get; set; }
        public DateTime? paqu_FechaModificacion { get; set; }
        public int? paqu_UserModificacion { get; set; }
        public bool? paqu_Estado { get; set; }
    }
}
