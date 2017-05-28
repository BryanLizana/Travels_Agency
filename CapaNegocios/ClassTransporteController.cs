using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class ClassTransporteController:Transporte_clase
    {
        public DataTable List(Transporte_clase traclass)
        {

            return this.sp_List_transporte_clase(traclass);

        }

        public string Insert(Transporte_clase traclass)
        {
            String msj = this.sp_Insert_transporte_clase(traclass);
            if (msj == "TRUE")
            {
                return "Clase guardada correctamente";

            }
            else
            {

                return msj;

            }

        }

        public string Del(Transporte_clase traclass)
        {
            String msj = this.sp_Delete_transporte_clase(traclass);
            if (msj == "TRUE")
            {
                return ("Clase Eliminada");

            }
            else
            {
                return (msj);
            }

        }

        public string Get_id_transporte_class(Transporte_clase transport)
        {
            
            return this.sp_Get_id_transporte_class(transport);

        }

        public string Get_precio_transporte_class(Transporte_clase transport)
        {

            return this.sp_Get_precio_transporte_class(transport);

        }
    }
}
