using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class VentaController:Ventas
    {
        public DataTable List(Ventas data)
        {

            return this.sp_List_ventas(data);

        }

        public string Insert(Ventas data)
        {
            //int i = 0;
            String msj = this.sp_Insert_ventas(data);
            //if (int.TryParse(msj, out i))
            return msj;          

        }

        public string Del(Ventas data)
        {
            String msj = this.sp_Delete_ventas(data);
            if (msj == "TRUE")
            {
                return ("Venta Eliminado");

            }
            else
            {
                return (msj);
            }

        }

        public string getcode() {


            return this.get_next_code_venta();
        }

    
        public string setStatus(Ventas data) {

            return this.sp_Update_status_venta(data);
        }
        
    
         public DataTable ListFechasViajes()
        {
            return this.sp_List_fechas_viaje();

        }
        public string Get_total_venta(Ventas data)
        {
            return this.sp_Get_total_venta(data);

        }
        
    }
}
