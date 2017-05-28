using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos 
{
    public class Hoteles:Conexion
    {
        public string Hotel_id { get; set; }
        public string Hotel_description { get; set; }
        public string Hotel_precio_uni { get; set; }
        public string Origen_ciudad_id { get; set; }
        public string Agencia_id { get; set; }


        protected string sp_Insert_hoteles(Hoteles hoteles)
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
                sqlcommand.CommandText = "sp_Insert_hoteles";

                sqlcommand.Parameters.Add("@hotel_id", SqlDbType.VarChar, 30).Value = hoteles.Hotel_id;
                sqlcommand.Parameters.Add("@hotel_description", SqlDbType.VarChar, 30).Value = hoteles.Hotel_description;
                sqlcommand.Parameters.Add("@hotel_precio_uni", SqlDbType.VarChar, 30).Value = hoteles.Hotel_precio_uni;
                sqlcommand.Parameters.Add("@origen_ciudad_id", SqlDbType.VarChar, 30).Value = hoteles.Origen_ciudad_id;
                sqlcommand.Parameters.Add("@agencia_id", SqlDbType.VarChar, 30).Value = hoteles.Agencia_id;

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


        protected String sp_Delete_hoteles(Hoteles hoteles)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_hoteles";

                sqlcommand.Parameters.Add("@hotel_id", SqlDbType.VarChar, 30).Value = hoteles.Hotel_id;

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

        protected DataTable sp_List_hoteles(Hoteles hoteles)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_hoteles";
                sqlcommand.Parameters.Add("@hotel_id", SqlDbType.VarChar, 30).Value = hoteles.Hotel_id;


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
