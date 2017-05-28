using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
   public class Agencias :Conexion
    {
        public string Agencia_id { get; set; }
        public string Agencia_description { get; set; }
        public string Agencia_phone { get; set; }
        public string Agencia_mail { get; set; }



        protected string sp_Insert_agencias(Agencias agencias)
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
                sqlcommand.CommandText = "sp_Insert_agencias";

                sqlcommand.Parameters.Add("@agencia_id", SqlDbType.VarChar, 30).Value = agencias.Agencia_id;
                sqlcommand.Parameters.Add("@agencia_description", SqlDbType.VarChar, 30).Value = agencias.Agencia_description;
                sqlcommand.Parameters.Add("@agencia_phone", SqlDbType.VarChar, 30).Value = agencias.Agencia_phone;
                sqlcommand.Parameters.Add("@agencia_mail", SqlDbType.VarChar, 30).Value = agencias.Agencia_mail;

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


        protected String sp_Delete_agencias(Agencias agencias)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_agencias";

                sqlcommand.Parameters.Add("@agencia_id", SqlDbType.VarChar, 30).Value = agencias.Agencia_id;

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

        protected DataTable sp_List_agencias(Agencias agencias)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_agencias";
                sqlcommand.Parameters.Add("@agencia_id", SqlDbType.VarChar, 30).Value = agencias.Agencia_id;


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
