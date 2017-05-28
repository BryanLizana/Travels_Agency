using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class HotelController:Hoteles
    {
        public DataTable List(Hoteles hotel)
        {

            return this.sp_List_hoteles(hotel);

        }

        public string Insert(Hoteles hotel)
        {
            String msj = this.sp_Insert_hoteles(hotel);
            if (msj == "TRUE")
            {
                return "Hotel guardada correctamente";

            }
            else
            {

                return msj;

            }

        }

        public string Del(Hoteles hotel)
        {
            String msj = this.sp_Delete_hoteles(hotel);
            if (msj == "TRUE")
            {
                return ("Hotel Eliminada");

            }
            else
            {
                return (msj);
            }

        }


    }
}
