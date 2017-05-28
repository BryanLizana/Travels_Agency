using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace CapaDatos
{
    public class Venta_detelles :Conexion
    {
        public string Vendet_id { get; set; }
        public string Vendet_cost_uni { get; set; }
        public string Vendet_status { get; set; }
        public string Pasajero_id { get; set; }
        public string Venta_id { get; set; }
        public string Transporte_clase_id { get; set; }

        protected string sp_Insert_venta_detelles(Venta_detelles venta_detelles)
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
                sqlcommand.CommandText = "sp_Insert_venta_detelles";
                sqlcommand.Parameters.Add("@vendet_id", SqlDbType.VarChar, 30).Value = venta_detelles.Vendet_id;
                sqlcommand.Parameters.Add("@vendet_cost_uni", SqlDbType.VarChar, 30).Value = venta_detelles.Vendet_cost_uni.ToString().Replace(',', '.');
                sqlcommand.Parameters.Add("@vendet_status", SqlDbType.VarChar, 30).Value = venta_detelles.Vendet_status;
                sqlcommand.Parameters.Add("@pasajero_id", SqlDbType.VarChar, 30).Value = venta_detelles.Pasajero_id;
                sqlcommand.Parameters.Add("@venta_id", SqlDbType.VarChar, 30).Value = venta_detelles.Venta_id;
                sqlcommand.Parameters.Add("@transporte_clase_id", SqlDbType.VarChar, 30).Value = venta_detelles.Transporte_clase_id;

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


        protected String sp_Delete_venta_detelles(Venta_detelles venta_detelles)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_venta_detelles";

                sqlcommand.Parameters.Add("@vendet_id", SqlDbType.VarChar, 30).Value = venta_detelles.Vendet_id;

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

        
        
        protected String sp_Remove_pasajero(Venta_detelles venta_detelles)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Remove_pasajero";

                sqlcommand.Parameters.Add("@venta_id", SqlDbType.VarChar, 30).Value = venta_detelles.Venta_id;
                sqlcommand.Parameters.Add("@pasajero_id", SqlDbType.VarChar, 30).Value = venta_detelles.Pasajero_id;
                sqlcommand.Parameters.Add("@transporte_clase_id", SqlDbType.VarChar, 30).Value = venta_detelles.Transporte_clase_id;
                

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


        public DataTable sp_List_venta_detelles(Venta_detelles venta_detelles)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_venta_detelles";
                sqlcommand.Parameters.Add("@ventas_id", SqlDbType.VarChar, 30).Value = venta_detelles.Venta_id;


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
