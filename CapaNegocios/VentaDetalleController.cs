using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
   public class VentaDetalleController:Venta_detelles
    {
        public DataTable List(Venta_detelles data)
        {

            return this.sp_List_venta_detelles(data);

        }

        public string Insert(Venta_detelles data)
        {
            //int i = 0;
            String msj = this.sp_Insert_venta_detelles(data);
            //if (int.TryParse(msj, out i))
            return msj;

        }

        public string Del(Venta_detelles data)
        {
            String msj = this.sp_Delete_venta_detelles(data);
            if (msj == "TRUE")
            {
                return ("Venta Eliminado");

            }
            else
            {
                return (msj);
            }

        }


        public string RemovePsj(Venta_detelles data)
        {
            String msj = this.sp_Remove_pasajero(data);
            if (msj == "TRUE")
            {
                //psaeroid ytransporte
                return ("Venta Removida");

            }
            else
            {
                return (msj);
            }

        }
    }
}
