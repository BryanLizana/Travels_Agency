using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class Ventas :Conexion
    {
        public string Ventas_id { get; set; }
        public string Venta_date_reserva { get; set; }
        public string Venta_date_venta { get; set; }
        public string Venta_status { get; set; }
        public string Venta_code { get; set; }
        public string Fecha_partida_cronograma_transpote_id { get; set; }
        public string User_id { get; set; }
        public string Comprador_pasajero_id { get; set; }
        public string Transporte_id { get; set; }
        public string Hotel_id { get; set; }
        public string Venta_sub_total { get; set; }
        public string Venta_total { get; set; }



        protected string sp_Insert_ventas(Ventas ventas)
        {
            //recuperar la conexion;
            var con = GetConexion();

            //activar una consulta, un comando sql
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                ventas.Hotel_id = (ventas.Hotel_id == "0") ? null : ventas.Hotel_id;
                ventas.Transporte_id = (ventas.Transporte_id == "0") ? null : ventas.Transporte_id;

                //avisamos que es un store procedure
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Insert_ventas";

                sqlcommand.Parameters.Add("@ventas_id", SqlDbType.VarChar, 30).Value = ventas.Ventas_id;
                sqlcommand.Parameters.Add("@venta_date_reserva", SqlDbType.VarChar, 30).Value = ventas.Venta_date_reserva;
                sqlcommand.Parameters.Add("@venta_date_venta", SqlDbType.VarChar, 30).Value = ventas.Venta_date_venta;
                sqlcommand.Parameters.Add("@venta_status", SqlDbType.VarChar, 30).Value = ventas.Venta_status;
                sqlcommand.Parameters.Add("@venta_code", SqlDbType.VarChar, 30).Value = ventas.Venta_code;
                sqlcommand.Parameters.Add("@fecha_partida_cronograma_transpote_id", SqlDbType.VarChar, 30).Value = ventas.Fecha_partida_cronograma_transpote_id;
                sqlcommand.Parameters.Add("@user_id", SqlDbType.VarChar, 30).Value = ventas.User_id;
                sqlcommand.Parameters.Add("@comprador_pasajero_id", SqlDbType.VarChar, 30).Value = ventas.Comprador_pasajero_id;
                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = ventas.Transporte_id;
                sqlcommand.Parameters.Add("@hotel_id", SqlDbType.VarChar, 30).Value = ventas.Hotel_id;
                sqlcommand.Parameters.Add("@venta_sub_total", SqlDbType.VarChar, 30).Value = ventas.Venta_sub_total;
                sqlcommand.Parameters.Add("@venta_total", SqlDbType.VarChar, 30).Value = ventas.Venta_total; 


                sqlcommand.Connection.Open();
                sqlcommand.ExecuteNonQuery();
                sqlcommand.Connection.Close();


                SqlCommand sqlcommandDOS = new SqlCommand();
                sqlcommandDOS.CommandType = CommandType.StoredProcedure;
                sqlcommandDOS.Connection = con;
                sqlcommandDOS.CommandText = "sp_Get_last_id_venta";
                SqlDataAdapter da = new SqlDataAdapter(sqlcommandDOS);
                DataTable dt_list = new DataTable();

                da.Fill(dt_list);

                return dt_list.Rows[0]["ventas_id"].ToString();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }


        }


        protected String sp_Delete_ventas(Ventas ventas)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_ventas";
                sqlcommand.Parameters.Add("@ventas_id", SqlDbType.VarChar, 30).Value = ventas.Ventas_id;

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

        protected DataTable sp_List_ventas(Ventas ventas)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_ventas";
                sqlcommand.Parameters.Add("@ventas_id", SqlDbType.VarChar, 30).Value = ventas.Ventas_id;


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


        protected String get_next_code_venta() {

            String code = "";

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Get_last_code_venta";

                con.Open();
                SqlDataReader dr = sqlcommand.ExecuteReader();
                //SqlDataAdapter da = new SqlDataAdapter(sqlcommand);
                while (dr.Read())
                {
                    code = String.Format("{0}", dr[0]);
                }

                con.Close();

            }
            catch (Exception ex)
            {

                code =  ex.Message;
            }


            return "VENTA"+code;
        }

        protected String sp_Update_status_venta(Ventas ventas) {

            String code = "";

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Update_status_venta";
                sqlcommand.Parameters.Add("@ventas_id", SqlDbType.VarChar, 30).Value = ventas.Ventas_id;
                sqlcommand.Parameters.Add("@venta_status", SqlDbType.VarChar, 30).Value = ventas.Venta_status;


                sqlcommand.Connection.Open();
                sqlcommand.ExecuteNonQuery();
                sqlcommand.Connection.Close();
                code =  "TRUE";


            }
            catch (Exception ex)
            {

                code =  ex.Message;
            }


            return "VENTA"+code;
        }

        protected DataTable sp_List_fechas_viaje()

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_fechas_viaje";
           
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


        
        protected String sp_Get_total_venta(Ventas ventas)
        {

            String code = "";

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Get_total_venta";
                sqlcommand.Parameters.Add("@ventas_id", SqlDbType.VarChar, 30).Value = ventas.Ventas_id;

                con.Open();
                SqlDataReader dr = sqlcommand.ExecuteReader();
                //SqlDataAdapter da = new SqlDataAdapter(sqlcommand);
                while (dr.Read())
                {
                    code = String.Format("{0}", dr[0]);
                }

                con.Close();

            }
            catch (Exception ex)
            {

                code = ex.Message;
            }

            //total de la venta
            return  code;
        }

    }
}
