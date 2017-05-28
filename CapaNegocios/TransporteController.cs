using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class TransporteController :Transportes
    {

        public DataTable List(Transportes transport)
        {

            return this.sp_List_transportes(transport);

        }

        public string Insert(Transportes transport)
        {
            String msj = this.sp_Insert_transportes(transport);
            if (msj == "TRUE")
            {
                return "transporte guardado correctamente";

            }
            else
            {

                return msj;

            }

        }

        public string Del(Transportes transport)
        {
            String msj = this.sp_Delete_transportes(transport);
            if (msj == "TRUE")
            {
                return ("Transporte Eliminado");

            }
            else
            {
                return (msj);
            }

        }
     
        

    }
}
