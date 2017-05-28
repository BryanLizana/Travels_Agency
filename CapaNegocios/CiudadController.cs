using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class CiudadController :Ciudades
    {

        public DataTable List(Ciudades obj)
        {

            return this.sp_List_ciudades(obj);

        }

        public DataTable ListForHotels()
        {

            return this.sp_List_ciudades_of_hoteles();

        }

        public DataTable ListForTransportes()
        {

            return this.sp_List_ciudades_of_transporte();

        }

        public DataTable ListReporteCiudadesTransporte()
        {

            return this.sp_List_ciudades_visitadas();

        }
        
    }
}
