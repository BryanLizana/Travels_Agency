using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class CronogramaTransController:Cronograma_transportes
    {
        public DataTable List(Cronograma_transportes Crono)
        {

            return this.sp_List_cronograma_transportes(Crono);

        }

        public string Insert(Cronograma_transportes Crono)
        {
            String msj = this.sp_Insert_cronograma_transportes(Crono);
            if (msj == "TRUE")
            {
                return "Cronograma guardado correctamente";

            }
            else
            {

                return msj;

            }

        }

        public string Del(Cronograma_transportes Crono)
        {
            String msj = this.sp_Delete_cronograma_transportes(Crono);
            if (msj == "TRUE")
            {
                return ("Cronograma Eliminado");
            }
            else
            {
                return (msj);
            }

        }
    }
}
