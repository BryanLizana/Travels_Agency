using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class Pasajeros :Conexion
    {
        public string Pasajero_id { get; set; }
        public string Pasajero_dni { get; set; }
        public string Pasajero_name { get; set; }
        public string Pasajero_last_name { get; set; }
        public string Pasajero_edad { get; set; }
        public string Pasajero_status { get; set; }


        protected string sp_Insert_pasajeros(Pasajeros pasajeros)
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
                sqlcommand.CommandText = "sp_Insert_pasajeros";

                sqlcommand.Parameters.Add("@pasajero_id", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_id;
                sqlcommand.Parameters.Add("@pasajero_dni", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_dni;
                sqlcommand.Parameters.Add("@pasajero_name", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_name;
                sqlcommand.Parameters.Add("@pasajero_last_name", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_last_name;
                sqlcommand.Parameters.Add("@pasajero_edad", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_edad;
                sqlcommand.Parameters.Add("@pasajero_status", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_status;

                sqlcommand.Connection.Open();
                sqlcommand.ExecuteNonQuery();
                sqlcommand.Connection.Close();

                SqlCommand sqlcommandDOS = new SqlCommand();
                sqlcommandDOS.CommandType = CommandType.StoredProcedure;
                sqlcommandDOS.Connection = con;
                sqlcommandDOS.CommandText = "sp_Get_last_id_pasajero";
                SqlDataAdapter da = new SqlDataAdapter(sqlcommandDOS);
                DataTable dt_list = new DataTable();

                da.Fill(dt_list);

                return dt_list.Rows[0]["pasajero_id"].ToString();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }


        }


        protected String sp_Delete_pasajeros(Pasajeros pasajeros)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_pasajeros";

                sqlcommand.Parameters.Add("@pasajero_id", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_id;

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

        protected DataTable sp_List_pasajeros(Pasajeros pasajeros)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_pasajeros";
                sqlcommand.Parameters.Add("@pasajero_id", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_id;

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

        protected DataTable sp_Search_pasajero(Pasajeros pasajeros)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Search_pasajero";
                sqlcommand.Parameters.Add("@pasajero_dni", SqlDbType.VarChar, 30).Value = pasajeros.Pasajero_dni + "%";

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
