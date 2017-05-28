using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;

namespace CapaNegocios
{
  public  class UserController : Users
    {
        public DataTable login(Users user) {

            return this.sp_login(user);

        }

        public DataTable List(Users user)
        {

            return this.sp_List_users(user);

        }

        public string Insert(Users user)
        {
            String msj = this.sp_Insert_users(user);
            if (msj == "TRUE")
            {
                return "Usuario guardado correctamente";

            }
            else
            {

                return msj;

            }

        }



        public DataTable List_ciudades_visitadas()
        {

            return this.sp_List_ciudades_visitadas();

        }


        public DataTable List_users_ventas()
        {

            return this.sp_List_users_ventas();

        }

        public DataTable List_fechas_viajes()
        {

            return this.sp_List_fechas_viajes();

        }

        public DataTable List_fechas_ventas()
        {

            return this.sp_List_fechas_ventas();

        }
        public DataTable List_pasajeros_viajeros()
        {

            return this.sp_List_pasajeros_viajeros();

        }

    }
}
