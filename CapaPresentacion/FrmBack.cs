using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocios;
namespace CapaPresentacion
{
    public partial class FrmBack : Form
    {

        //funciones comunes
        public void limpiarcamposagencia()
        {
            txtagenciaemai.Text = "";
            txtagenciaid.Text = "0";
            txtagencianame.Text = "";
            txtagenciaphone.Text = "";
            btnagenciaaddhotel.Enabled = false;
            btnagenciaaddtransporte.Enabled = false;
            btnstatussave();
        }

        public void limpiarcamposcrono()
        {
            txtcronopartename.Text = "";
            txtcronoid.Text = "0";
            txtcronotransid.Text = "0";
            txtcronopartida.Text = "";
            txtcronoregreso.Text = "";

            btnstatussave();
            llenartablacrono();

        }

        public void limpiarcamposclass()
        {
            txtclasspreciotrans.Text = "";
            txtclassid.Text = "0";
            txtclasstransid.Text = "0";
         

            btnstatussave();

        }
        public void limpiarcampostransporte()
        {
            txttransagenciid.Text = "0";
            txttransid.Text = "0";
            txttransagenciname.Text = "NULL";
            txttransciudadfromid.Text = "";
            txttransciudadtoid.Text = "";
            txttransfrom.Text = "";
            txttransto.Text = "";

            btnstatussave();


        }
        public void limpiarcamposhotel()
        {
            txthotelname.Text = "";
            txthotelid.Text = "0";
            txthotelagenciaid.Text = "";
            txthotelagencianame.Text = "NULL";
            txthotelciudadid_temp.Text = "";
            txthotelprecio.Text = "";

            btnstatussave();
        }


        public void llenartablaagencia()
        {

            AgenciaController Obj = new AgenciaController();
            AgenciaController Data = new AgenciaController();
            Data.Agencia_id = "0";
            tableagencias.DataSource = Obj.List(Data);


        }
        public void llenartablaclass()
        {

            ClassTransporteController Obj = new ClassTransporteController();
            ClassTransporteController Data = new ClassTransporteController();
            Data.Transporte_clase_id = "0";

            //si este campo está lleno se lista las class únicos de ese transporte
            Data.Transporte_id = txtclasstransid.Text;
            tableclasstransporte.DataSource = Obj.List(Data);


        }
        public void llenartablaciudades()
        {

            CiudadController Obj = new CiudadController();
            CiudadController Data = new CiudadController();
            Data.Ciudad_id = "0";
            tableciudades.DataSource = Obj.List(Data);


        }


        public void llenartablacrono()
        {

            CronogramaTransController Obj = new CronogramaTransController();
            CronogramaTransController Data = new CronogramaTransController();
            Data.Cronograma_transporte_id = "0";

            //si este campo está lleno se lista los cronogramas unicos de ese transporte
            Data.Transporte_id = txtcronotransid.Text;

            tablecronogramatransporte.DataSource = Obj.List(Data);


        }

        public void llenartablahotel()
        {

            HotelController Obj = new HotelController();
            HotelController Data = new HotelController();
            Data.Hotel_id = "0";
            tablehotel.DataSource = Obj.List(Data);


        }

        public void llenartablatransporte()
        {

            TransporteController Obj = new TransporteController();
            TransporteController Data = new TransporteController();
            Data.Transporte_id = "0";
            tabletransporte.DataSource = Obj.List(Data);


        }
        public void btnstatussave()
        {
            btnhotelsave.Text = (txthotelid.Text == "0") ? "Crear Hotel" : "Editar Hotel";
            btnagesave.Text = (txtagenciaid.Text == "0") ? "Crear Agencia" : "Editar Agencia";
            btntranssave.Text = (txttransid.Text == "0") ? "Crear Transporte" : "Editar Transporte";
            btncronosave.Text = (txtcronoid.Text == "0") ? "Crear Cronograma" : "Editar Cronograma";
            btnclasssave.Text = (txtclassid.Text == "0") ? "Crear Clase" : "Editar Clase";

        }




        public FrmBack()
        {
            InitializeComponent();
            limpiarcamposagencia();
            limpiarcamposhotel();
            limpiarcampostransporte();
            limpiarcamposcrono();
            llenartablaclass();

            llenartablaagencia();
            llenartablahotel();
            llenartablatransporte();
            llenartablacrono();
            llenartablaclass();
            llenartablaciudades();


            btnstatussave();
        }

        private void btnagesave_Click(object sender, EventArgs e)
        {
            if (txtagenciaemai.Text != "" && txtagencianame.Text != "" && txtagenciaphone.Text!= "")
            {
                AgenciaController Obj = new AgenciaController();
                AgenciaController Data = new AgenciaController();
                Data.Agencia_id = txtagenciaid.Text;            

                Data.Agencia_description = txtagencianame.Text;
                Data.Agencia_mail = txtagenciaemai.Text;
                Data.Agencia_phone = txtagenciaphone.Text;

                MessageBox.Show(Obj.Insert(Data));
                llenartablaagencia();
                limpiarcamposagencia();
            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }
        }

        private void tableagencias_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //se obtiene info del row selecionado

            DataGridViewRow fila_selected = tableagencias.CurrentRow;

            //sacamos el valor de la primea column (sólo funciona con convert y no con tostring())
            string valoruno = Convert.ToString(fila_selected.Cells[0].Value);
            string valordos = Convert.ToString(fila_selected.Cells[1].Value);
            string valortress = Convert.ToString(fila_selected.Cells[2].Value);
            string valorcuatro = Convert.ToString(fila_selected.Cells[3].Value);
            

            txtagenciaid.Text = valoruno;
            txtagencianame.Text = valordos;
            txtagenciaemai.Text = valorcuatro;
            txtagenciaphone.Text = valortress;

            btnagenciaaddhotel.Enabled = true;
            btnagenciaaddtransporte.Enabled = true;

            btnstatussave();
        }

        private void btnageclear_Click(object sender, EventArgs e)
        {
            limpiarcamposagencia();
        }

        private void btnagedel_Click(object sender, EventArgs e)
        {
            if (txtagencianame.Text != "" && txtagenciaid.Text != "0")
            {
                AgenciaController Obj = new AgenciaController();
                AgenciaController data = new AgenciaController();

                data.Agencia_id = txtagenciaid.Text;

                MessageBox.Show(Obj.Del(data));
            
                llenartablaagencia();
                limpiarcamposagencia();
            }
            else
            {
                MessageBox.Show("No, el campo name vacío campos vacío¡¡");
            }
        }

        private void btnagenciaaddhotel_Click(object sender, EventArgs e)
        {
            if (txtagenciaid.Text != "0")
            {
                TabControlFrmBack.SelectedTab = tabhoteles;
                llenartablahotel();
                limpiarcamposhotel();
                txthotelagenciaid.Text = txtagenciaid.Text;
                txthotelagencianame.Text = txtagencianame.Text;


            }
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void btnhotelsave_Click(object sender, EventArgs e)
        {

            if (txthotelagencianame.Text != "NULL" && txthotelciudadid_temp.Text != "" && txthotelname.Text != "" && txthotelprecio.Text != "")
            {
                HotelController Obj = new HotelController();
                HotelController Data = new HotelController();
                Data.Hotel_id = txthotelid.Text;

                Data.Hotel_description = txthotelname.Text;
                Data.Hotel_precio_uni = txthotelprecio.Text;
                Data.Origen_ciudad_id = txthotelciudadid.Text;
                Data.Agencia_id = txthotelagenciaid.Text;

                MessageBox.Show(Obj.Insert(Data));
                llenartablahotel();
                limpiarcamposhotel();
            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }
        }

        private void tablehotel_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //se obtiene info del row selecionado

            DataGridViewRow fila_selected = tablehotel.CurrentRow;

            //sacamos el valor de la primea column (sólo funciona con convert y no con tostring())
            string valoruno = Convert.ToString(fila_selected.Cells[0].Value);
            string valordos = Convert.ToString(fila_selected.Cells[1].Value);
            string valortress = Convert.ToString(fila_selected.Cells[2].Value);
            string valorcuatro = Convert.ToString(fila_selected.Cells[3].Value);
            string valorcinco = Convert.ToString(fila_selected.Cells[4].Value);
            string valorseis = Convert.ToString(fila_selected.Cells[5].Value);
            string valorsiete = Convert.ToString(fila_selected.Cells[6].Value);




            txthotelid.Text = valoruno;
            txthotelname.Text = valordos;
            txthotelprecio.Text = valortress;
            txthotelciudadid_temp.Text = valorcuatro;
           txthotelciudadid.Text = valorcinco;
            txthotelagenciaid.Text = valorseis;
            txthotelagencianame.Text = valorsiete;



            btnstatussave();
        }

        private void btnhotelclear_Click(object sender, EventArgs e)
        {
            limpiarcamposhotel();
        }

        private void btnhoteldel_Click(object sender, EventArgs e)
        {
            if (txthotelname.Text != "" && txthotelid.Text != "0")
            {
                HotelController Obj = new HotelController();
                HotelController data = new HotelController();

                data.Hotel_id = txthotelid.Text;

                MessageBox.Show(Obj.Del(data));

                llenartablahotel();
                limpiarcamposhotel();
            }
            else
            {
                MessageBox.Show("No, el campo name vacío¡¡");
            }
        }

        private void btnagenciaaddtransporte_Click(object sender, EventArgs e)
        {
            if (txtagenciaid.Text != "0")
            {
                TabControlFrmBack.SelectedTab = tabtransportes;
                llenartablatransporte();
                limpiarcampostransporte();
                txttransagenciid.Text = txtagenciaid.Text;
                txttransagenciname.Text = txtagencianame.Text;


            }
        }

        private void btntranssave_Click(object sender, EventArgs e)
        {

            //if (txttransagenciname.Text != "NULL" && txttransciudadfromid.Text != "" && txttransciudadtoid.Text != "" && txttranstype.SelectedItem.ToString() != "" )
            if (txttransagenciname.Text != "NULL" && txttransfrom.Text != "" && txttransto.Text != ""  && txttranstype.SelectedItem.ToString() != "")

                {
                TransporteController Obj = new TransporteController();
                TransporteController Data = new TransporteController();
                Data.Transporte_id = txttransid.Text;

                Data.Transporte_status = "ACTIVE";
                Data.Agencia_id = txttransagenciid.Text;
                Data.Origen_ciudad_id = txttransciudadfromid.Text;
                //Data.Origen_ciudad_id = txttransfrom.Text;
                //Data.Destino_ciudad_id = txttransto.Text;
                Data.Destino_ciudad_id = txttransciudadtoid.Text;
                Data.Type_transporte = txttranstype.SelectedItem.ToString();
                

                MessageBox.Show(Obj.Insert(Data));
                llenartablatransporte();
                limpiarcampostransporte();
            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }
        }

        private void tabletransporte_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //se obtiene info del row selecionado

            DataGridViewRow fila_selected = tabletransporte.CurrentRow;
            //t.transporte_id,t.type_transporte,t.transporte_status, t.agencia_id,a.agencia_description,co.ciudad_id as 'ciudad_o_id'
            //,co.ciudad_name as 'Parte de', cd.ciudad_id as 'ciudad_d_id',cd.ciudad_name as 'A :'

            ////sacamos el valor de la primea column (sólo funciona con convert y no con tostring())
            string valoruno = Convert.ToString(fila_selected.Cells[0].Value);
            string valordos = Convert.ToString(fila_selected.Cells[1].Value);
            string valortress = Convert.ToString(fila_selected.Cells[2].Value);
            string valorcuatro = Convert.ToString(fila_selected.Cells[3].Value);
            string valorcinco = Convert.ToString(fila_selected.Cells[4].Value);
            string valorseis = Convert.ToString(fila_selected.Cells[5].Value);
            string valorsiete = Convert.ToString(fila_selected.Cells[6].Value);
            string valorocho = Convert.ToString(fila_selected.Cells[7].Value);
            string valornueve = Convert.ToString(fila_selected.Cells[8].Value);
           

            txttransid.Text = valoruno;
            txttranstype.SelectedItem= valordos;
            //txt.Text = valortress;
             txttransagenciid.Text = valorcuatro;
            txttransagenciname.Text = valorcinco;

            txttransciudadfromid.Text = valorseis;
            txttransfrom.Text = valorsiete; // Ciudad parte de :  name

            txttransciudadtoid.Text = valorocho;
            txttransto.Text = valornueve; // Ciudad To :  name

           btnstatussave();
        }

        private void btntransclear_Click(object sender, EventArgs e)
        {
            limpiarcampostransporte();
        }

        private void btntransdel_Click(object sender, EventArgs e)
        {
            if (txttransid.Text != "0" )
            {
                TransporteController Obj = new TransporteController();
                TransporteController data = new TransporteController();

                data.Transporte_id = txttransid.Text;

                MessageBox.Show(Obj.Del(data));

                llenartablatransporte();
                limpiarcampostransporte();
            }
            else
            {
                MessageBox.Show("No, es imposible eliminar el registro¡¡");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //btntransaddcrono
            if (txttransid.Text != "0")
            {
                limpiarcamposcrono();
                txtcronopartename.Text = txttransfrom.Text;
                txtcronotransid.Text = txttransid.Text;                
                llenartablacrono();
                TabControlFrmBack.SelectedTab = tabcronogramatrans;
            }
        }

        private void btncronoclear_Click(object sender, EventArgs e)
        {
            limpiarcamposcrono();
        }

        private void btncronosave_Click(object sender, EventArgs e)
        {
            if (txtcronotransid.Text != "0" && txtcronopartida.Text != "" && txtcronoregreso.Text != "")

            {
                CronogramaTransController Obj = new CronogramaTransController();
                CronogramaTransController Data = new CronogramaTransController();
                Data.Cronograma_transporte_id = txtcronoid.Text;

                Data.Cronograma_fecha = txtcronopartida.Text;
                Data.Cronograma_fecha_regreso = txtcronoregreso.Text;
                Data.Transporte_id = txtcronotransid.Text;

                MessageBox.Show(Obj.Insert(Data));
                llenartablacrono();
                limpiarcamposcrono();
            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }
        }

        private void tablecronogramatransporte_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //se obtiene info del row selecionado

            DataGridViewRow fila_selected = tablecronogramatransporte.CurrentRow;
            //cr.cronograma_transporte_id,cr.cronograma_fecha,cr.cronograma_fecha_regreso,cr.transporte_id,c.ciudad_name


            ////sacamos el valor de la primea column (sólo funciona con convert y no con tostring())
            string valoruno = Convert.ToString(fila_selected.Cells[0].Value);
            string valordos = Convert.ToString(fila_selected.Cells[1].Value);
            string valortress = Convert.ToString(fila_selected.Cells[2].Value);
            string valorcuatro = Convert.ToString(fila_selected.Cells[3].Value);
            string valorcinco = Convert.ToString(fila_selected.Cells[4].Value);
           


            txtcronoid.Text = valoruno;
            txtcronopartida.Text = valordos;
            txtcronoregreso.Text = valortress;
            txtcronotransid.Text = valorcuatro;
            txtcronopartename.Text = valorcinco;

         

            btnstatussave();
        }

        private void btncronodel_Click(object sender, EventArgs e)
        {
            if (txtcronoid.Text != "0")
            {
                CronogramaTransController Obj = new CronogramaTransController();
                CronogramaTransController data = new CronogramaTransController();
                data.Cronograma_transporte_id = txtcronoid.Text;
                MessageBox.Show(Obj.Del(data));
                limpiarcamposcrono();
                llenartablacrono();
            }
        }

        private void txtcronopartida_ValueChanged(object sender, EventArgs e)
        {
            txtcronoregreso.Text = txtcronopartida.Text;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            //btntransaddclass
            if (txttransid.Text != "0")
            {
                limpiarcamposclass();
                txtclasstransid.Text = txttransid.Text;
                llenartablaclass();
                TabControlFrmBack.SelectedTab = tabclasstransporte;
            }
        }

        private void btnclassclear_Click(object sender, EventArgs e)
        {
            limpiarcamposclass();
            llenartablaclass();
        }

        private void btnclasssave_Click(object sender, EventArgs e)
        {
            if (txtclasstransid.Text != "0" && txtclasspreciotrans.Text != "" && txtclasstypetrans.Text != "")

            {
                ClassTransporteController Obj = new ClassTransporteController();
                ClassTransporteController Data = new ClassTransporteController();
                Data.Transporte_clase_id = txtclassid.Text;

                Data.Transporte_clase_costo_pasaje = txtclasspreciotrans.Text;
                Data.Transporte_clase_typo_pasaje = txtclasstypetrans.SelectedItem.ToString();
                Data.Transporte_id = txtclasstransid.Text;
                Data.Transporte_clase_asientos = txtclasasientos.Text;
                MessageBox.Show(Obj.Insert(Data));
                llenartablaclass();
                limpiarcamposclass();
            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }
        }

        private void tableclasstransporte_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //se obtiene info del row selecionado

            DataGridViewRow fila_selected = tableclasstransporte.CurrentRow;
            //cr.cronograma_transporte_id,cr.cronograma_fecha,cr.cronograma_fecha_regreso,cr.transporte_id,c.ciudad_name


            ////sacamos el valor de la primea column (sólo funciona con convert y no con tostring())
            string valoruno = Convert.ToString(fila_selected.Cells[0].Value);
            string valordos = Convert.ToString(fila_selected.Cells[1].Value);
            string valortress = Convert.ToString(fila_selected.Cells[2].Value);
            string valorcuatro = Convert.ToString(fila_selected.Cells[3].Value);
            string valorcinco = Convert.ToString(fila_selected.Cells[4].Value);




            txtclassid.Text = valoruno;
            txtclasstransid.Text = valordos; //transporteid

            txtclasspreciotrans.Text = valortress; //costo
            txtclasstypetrans.SelectedItem = valorcuatro; //psj
            txtclasasientos.Text = valorcinco;


            btnstatussave();
        }

        private void btntransirfrom_Click(object sender, EventArgs e)
        {
           txtirtxtid.Text = txttransciudadfromid.Name;
           txtirtxtname.Text = txttransfrom.Name;
            TabControlFrmBack.SelectedTab = tabCiudades;
        }

        private void tableciudades_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

            //se obtiene info del row selecionado

            DataGridViewRow fila_selected = tableciudades.CurrentRow;


            txtselected.Text = Convert.ToString(fila_selected.Cells[1].Value);


        }

        private void button3_Click(object sender, EventArgs e)
        {
            //select ciudad

            //selecionar e ir a txt
            DataGridViewRow fila_selected = tableciudades.CurrentRow;
            
            string valoruno = Convert.ToString(fila_selected.Cells[0].Value);
            string valordos = Convert.ToString(fila_selected.Cells[1].Value);

            String ciudadid = valoruno;
            String ciudadname = valordos;
            

            switch (txtirtxtname.Text)
            {

                case "txttransfrom":
                    TabControlFrmBack.SelectedTab = tabtransportes;
                    txttransfrom.Text = ciudadname;
                    txttransciudadfromid.Text = ciudadid;
                    break;
                case "txttransto":
                    TabControlFrmBack.SelectedTab = tabtransportes;
                    txttransto.Text = ciudadname;
                    txttransciudadtoid.Text = ciudadid;
                    break;
                case "txthotelciudadid_temp": //ciudad de hotel
                    TabControlFrmBack.SelectedTab = tabhoteles;
                    txthotelciudadid_temp.Text = ciudadname;
                    txthotelciudadid.Text = ciudadid;
                    break;
                default:
                    break;
            }


        }

        private void button2_Click(object sender, EventArgs e)
        {
            txtirtxtid.Text = txttransciudadtoid.Name;
            txtirtxtname.Text = txttransto.Name;
            TabControlFrmBack.SelectedTab = tabCiudades;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            txtirtxtid.Text = txthotelciudadid.Name;
            txtirtxtname.Text = txthotelciudadid_temp.Name;
            TabControlFrmBack.SelectedTab = tabCiudades;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //buscar
            if (txtbuscar.Text == "")
            {
                llenartablaciudades();
            }
            else {
                (tableciudades.DataSource as DataTable).DefaultView.RowFilter = string.Format("ciudad_name like '%{0}%'", txtbuscar.Text);
            }

        }

        private void btnlogout_Click(object sender, EventArgs e)
        {
            Login frm = new Login();
            frm.Show();
            this.Close();
        }

        private void btnhotelbuscar_Click(object sender, EventArgs e)
        {
            //buscar
            if (txthotelciudadid.Text == "0")
            {
                llenartablahotel();
            }
            else
            {
                (tablehotel.DataSource as DataTable).DefaultView.RowFilter = string.Format("ciudad_name like '%{0}%'", txthotelciudadid_temp.Text);
            }

        }

        private void btnageniasearch_Click(object sender, EventArgs e)
        {
            //buscar
            if (txtagencianame.Text == "")
            {
                llenartablaagencia();
            }
            else
            {
                (tableagencias.DataSource as DataTable).DefaultView.RowFilter = string.Format("agencia_description like '%{0}%'", txtagencianame.Text);
            }
        }

        private void txtclasspreciotrans_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) &&  e.KeyChar != '.' )
            {
                e.Handled = true;
            }
        }

        private void tableclasstransporte_CellContentDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
