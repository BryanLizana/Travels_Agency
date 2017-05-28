using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Ciudades :Conexion
    {
        public string Ciudad_id { get; set; }
        public string Ciudad_name { get; set; }
        public string Departamento_id { get; set; }
        
        protected string sp_Insert_ciudades(Ciudades ciudades)
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
                sqlcommand.CommandText = "sp_Insert_ciudades";

                sqlcommand.Parameters.Add("@ciudad_id", SqlDbType.VarChar, 30).Value = ciudades.Ciudad_id;
                sqlcommand.Parameters.Add("@ciudad_name", SqlDbType.VarChar, 30).Value = ciudades.Ciudad_name;
                sqlcommand.Parameters.Add("@departamento_id", SqlDbType.VarChar, 30).Value = ciudades.Departamento_id;

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


        protected String sp_Delete_ciudades(Ciudades ciudades)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_ciudades";

                sqlcommand.Parameters.Add("@ciudad_id", SqlDbType.VarChar, 30).Value = ciudades.Ciudad_id;

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

        protected DataTable sp_List_ciudades(Ciudades ciudades)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_ciudades";
                sqlcommand.Parameters.Add("@ciudad_id", SqlDbType.VarChar, 30).Value = ciudades.Ciudad_id;


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


        protected DataTable sp_List_ciudades_of_hoteles()

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_ciudades_of_hoteles";
               

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

        protected DataTable sp_List_ciudades_of_transporte()

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_ciudades_of_transporte";


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


        protected DataTable sp_List_ciudades_visitadas()

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_ciudades_visitadas";
               

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
