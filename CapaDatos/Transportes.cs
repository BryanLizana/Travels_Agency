using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
    public class Transportes :Conexion
    {
        public string Transporte_id { get; set; }
        public string Agencia_id { get; set; }
        public string Origen_ciudad_id { get; set; }
        public string Destino_ciudad_id { get; set; }
        public string Type_transporte { get; set; }
        public string Transporte_status { get; set; }
        

        protected string sp_Insert_transportes(Transportes transportes)
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
                sqlcommand.CommandText = "sp_Insert_transportes";

                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = transportes.Transporte_id;
                sqlcommand.Parameters.Add("@agencia_id", SqlDbType.VarChar, 30).Value = transportes.Agencia_id;
                sqlcommand.Parameters.Add("@origen_ciudad_id", SqlDbType.VarChar, 30).Value = transportes.Origen_ciudad_id;
                sqlcommand.Parameters.Add("@destino_ciudad_id", SqlDbType.VarChar, 30).Value = transportes.Destino_ciudad_id;
                sqlcommand.Parameters.Add("@type_transporte", SqlDbType.VarChar, 30).Value = transportes.Type_transporte;
                sqlcommand.Parameters.Add("@transporte_status", SqlDbType.VarChar, 30).Value = transportes.Transporte_status;                

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


        protected String sp_Delete_transportes(Transportes transportes)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_transportes";

                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = transportes.Transporte_id;

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

        protected DataTable sp_List_transportes(Transportes transportes)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_transportes";
                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = transportes.Transporte_id;


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
