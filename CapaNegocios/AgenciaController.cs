using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class AgenciaController : Agencias
    {

        public DataTable List(Agencias agencia)
        {

            return this.sp_List_agencias(agencia);

        }

        public string Insert(Agencias agencia)
        {
            String msj = this.sp_Insert_agencias(agencia);
            if (msj == "TRUE")
            {
                return "Agencia guardada correctamente";

            }
            else
            {

                return msj;

            }

        }

        public string Del(Agencias agencia)
        {
            String msj = this.sp_Delete_agencias(agencia);
            if (msj == "TRUE")
            {
                return("Agencia Eliminada");

            }
            else
            {
                return (msj);
            }

        }


    }
}
