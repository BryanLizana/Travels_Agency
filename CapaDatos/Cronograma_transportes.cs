using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Cronograma_transportes :Conexion
    {
        public string Cronograma_transporte_id { get; set; }
        public string Cronograma_fecha { get; set; }
        public string Cronograma_fecha_regreso { get; set; }

        public string Transporte_id { get; set; }


        protected string sp_Insert_cronograma_transportes(Cronograma_transportes cronograma_transportes)
        {
            //recuperar la conexion;
            var con = GetConexion();

            //activar una consulta, un comando sql
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                //avisamos que es un store procedure
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Insert_cronograma_transportes";

                sqlcommand.Parameters.Add("@cronograma_transporte_id", SqlDbType.VarChar, 30).Value = cronograma_transportes.Cronograma_transporte_id;
                sqlcommand.Parameters.Add("@cronograma_fecha", SqlDbType.VarChar, 30).Value = cronograma_transportes.Cronograma_fecha;
                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = cronograma_transportes.Transporte_id;

                sqlcommand.Parameters.Add("@cronograma_fecha_regreso", SqlDbType.VarChar, 30).Value = cronograma_transportes.Cronograma_fecha_regreso;


                
                sqlcommand.Connection.Open();
                sqlcommand.ExecuteNonQuery();
                sqlcommand.Connection.Close();

                return "TRUE";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }


        }


        protected String sp_Delete_cronograma_transportes(Cronograma_transportes cronograma_transportes)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_cronograma_transportes";

                sqlcommand.Parameters.Add("@cronograma_transporte_id", SqlDbType.VarChar, 30).Value = cronograma_transportes.Cronograma_transporte_id;

                sqlcommand.Connection.Open();
                sqlcommand.ExecuteNonQuery();
                sqlcommand.Connection.Close();


                //verificar el int que te da el execnomquery
                return "TRUE";
            }
            catch (Exception ex)
            {

                return ex.Message;
            }

        }

        protected DataTable sp_List_cronograma_transportes(Cronograma_transportes cronograma_transportes)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_cronograma_transportes";
                sqlcommand.Parameters.Add("@cronograma_transporte_id", SqlDbType.VarChar, 30).Value = cronograma_transportes.Cronograma_transporte_id;
                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = cronograma_transportes.Transporte_id;


                //SqlDataReader dr = sqlcommand.ExecuteReader();
                SqlDataAdapter da = new SqlDataAdapter(sqlcommand);
                DataTable dt_list = new DataTable();

                da.Fill(dt_list);
                return dt_list;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

    }
}
