using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Transporte_clase :Conexion
    {
        public string Transporte_clase_id { get; set; }
        public string Transporte_id { get; set; }
        public string Transporte_clase_costo_pasaje { get; set; }
        public string Transporte_clase_typo_pasaje { get; set; }
        public string Transporte_clase_asientos { get; set; }



        protected string sp_Insert_transporte_clase(Transporte_clase transporte_clase)
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
                sqlcommand.CommandText = "sp_Insert_transporte_clase";

                sqlcommand.Parameters.Add("@transporte_clase_id", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_clase_id;
                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_id;
                sqlcommand.Parameters.Add("@transporte_clase_costo_pasaje", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_clase_costo_pasaje.ToString().Replace(',', '.'); ;
                sqlcommand.Parameters.Add("@transporte_clase_typo_pasaje", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_clase_typo_pasaje;
                sqlcommand.Parameters.Add("@transporte_clase_asientos", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_clase_asientos;

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


        protected String sp_Delete_transporte_clase(Transporte_clase transporte_clase)
        {

            var con = GetConexion();
            SqlCommand sqlcommand = new SqlCommand();

            try
            {
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Delete_transporte_clase";

                sqlcommand.Parameters.Add("@transporte_clase_id", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_clase_id;

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

        protected DataTable sp_List_transporte_clase(Transporte_clase transporte_clase)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_List_transporte_clase";
                sqlcommand.Parameters.Add("@transporte_clase_id", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_clase_id;
                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_id;


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


        

        protected String sp_Get_id_transporte_class(Transporte_clase transporte_clase)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Get_id_transporte_class";
                sqlcommand.Parameters.Add("@transporte_id", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_id;
                sqlcommand.Parameters.Add("@transporte_clase_typo_pasaje", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_clase_typo_pasaje;


                //SqlDataReader dr = sqlcommand.ExecuteReader();
                SqlDataAdapter da = new SqlDataAdapter(sqlcommand);
                DataTable dt_list = new DataTable();

                da.Fill(dt_list);
                String id_trans_class;
                if (dt_list.Rows.Count > 0)
                {
                    id_trans_class = dt_list.Rows[0]["transporte_clase_id"].ToString();

                }
                else {
                    id_trans_class = "FALSE";
                }

                return id_trans_class;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        
        protected String sp_Get_precio_transporte_class(Transporte_clase transporte_clase)

        {

            try
            {
                var con = GetConexion();
                SqlCommand sqlcommand = new SqlCommand();
                sqlcommand.CommandType = CommandType.StoredProcedure;
                sqlcommand.Connection = con;
                sqlcommand.CommandText = "sp_Get_precio_transporte_class";
                sqlcommand.Parameters.Add("@transporte_clase_id", SqlDbType.VarChar, 30).Value = transporte_clase.Transporte_clase_id;
               

                //SqlDataReader dr = sqlcommand.ExecuteReader();
                SqlDataAdapter da = new SqlDataAdapter(sqlcommand);
                DataTable dt_list = new DataTable();

                da.Fill(dt_list);
                String precio = dt_list.Rows[0][0].ToString();
                return precio;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
    }
}
