using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class ClienteController:Pasajeros
    {
        public DataTable List(Pasajeros data)
        {

            return this.sp_List_pasajeros(data);

        }

        public string Insert(Pasajeros data)
        {
            
            return this.sp_Insert_pasajeros(data);
            
        }

        public string Del(Pasajeros data)
        {
            String msj = this.sp_Delete_pasajeros(data);
            if (msj == "TRUE")
            {
                return ("pasajero Eliminado");

            }
            else
            {
                return (msj);
            }

        }


        public DataTable Search_pasajero(Pasajeros data)
        {

            return this.sp_Search_pasajero(data);

        }

        
    }
}
