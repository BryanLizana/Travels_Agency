using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;


namespace CapaDatos
{
    public class Conexion
    {
        public SqlConnection conx;

        public SqlConnection GetConexion() {
            //conx = new SqlConnection(@"Data Source =DESKTOP-054G1P2\ADMIN; Initial Catalog = DBTRAVELMAIN; User ID = sa; Password = root");
            conx = new SqlConnection(@"Data Source =DESKTOP-3TGM96T; Initial Catalog = DBTRAVELMAIN; User ID = sa; Password = root");

            //Provider = SQLNCLI11.1; Persist Security Info = False; User ID = sa; Initial Catalog = DBTRAVELMAIN; Data Source = DESKTOP - 3TGM96T; Initial File Name = ""; Server SPN = ""

            return conx;

        }

    }
}
