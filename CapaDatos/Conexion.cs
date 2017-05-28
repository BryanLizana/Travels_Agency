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
            conx = new SqlConnection(@"Data Source =DESKTOP-054G1P2\ADMIN; Initial Catalog = DBTRAVELMAIN; User ID = sa; Password = root");

            return conx;

        }

    }
}
