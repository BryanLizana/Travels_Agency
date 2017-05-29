using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CapaNegocios;
using System.Drawing.Imaging;
using System.Drawing.Printing;
using System.IO;

namespace CapaPresentacion
{
    public partial class FrmVentas : Form
    {
        //funciones comunes
        public void limpiarcamposclientes()
        {
            txtclidni.Text = "";
            txtcliedad.Text = "";
            txtcliname.Text = "";
            txtcliid.Text = "0";

            txtvenid.Text = "0";
            txtvenhotelid.Text = "0";
            txtventransid.Text = "0";


            btnstatussave();
        }
        public void limpiarcampospasajero()
        {
            txtpsjid.Text = "0";
            txtpsjdni.Text = "";
            txtpsjedad.Text = "";
            txtpsjname.Text = "";
            txtpsjnameape.Text = "";

            btnstatussave();
        }
        public void limpiarcamposventadetalle()
        {
            limpiarcampospasajero();

            txtdethotelid.Text = "0";
            txthotelhave.Text = "NO";
            txttrashave.Text = "NO";
            txtdettransid.Text = "0";
            txtdetid.Text = "0";
            txtdettransclassid.Text = "0";

            btnstatussave();
        }

        public void limpiarcamposventa()
        {

            txtvenid.Text = "0";
            txtvencliape.Text = "";
            txtvenclidni.Text = "";
            txtvencliname.Text = "";

            VentaController Obj = new VentaController();
            txtvencode.Text = Obj.getcode();

            txtvenhotelid.Text = "0";
            txtvenhotelorigen.Text = "ORIGEN";
            txtventransid.Text = "0";
            txtvenpreciohotel.Text = "0";
            btnstatussave();
        }
        public void llenartablaclientes()
        {

            ClienteController Obj = new ClienteController();
            ClienteController Data = new ClienteController();
            Data.Pasajero_id = "0";
            tableclientes.DataSource = Obj.List(Data);


        }
        public void llenartablaventas()
        {

            VentaController Obj = new VentaController();
            VentaController Data = new VentaController();
            Data.Ventas_id = "0";
            tablelistventas.DataSource = Obj.List(Data);


        }
        public void llenartabladetallesventa()
        {

            VentaDetalleController Obj = new VentaDetalleController();
            VentaDetalleController Data = new VentaDetalleController();
            Data.Venta_id = txtvenid.Text;
            tableventadetalles.DataSource = Obj.List(Data);


        }


        public void llenartablaciudadeshotel()
        {

            CiudadController Obj = new CiudadController();

            tableciudadeshotels.DataSource = Obj.ListForHotels();


        }

        public void llenartablaciudadestrans()
        {

            CiudadController Obj = new CiudadController();

            tableciudadestransportes.DataSource = Obj.ListForTransportes();



        }
        public void btnstatussave()
        {
            btnclisave.Text = (txtcliid.Text == "0") ? "Crear Cliente" : "Editar Cliente";
            btnpsjsave.Text = (txtpsjid.Text == "0") ? "Crear Pasajero" : "Editar Pasajero";

            txttrashave.Text = (txtventransid.Text == "0") ? "NO" : "SÍ";
            txthotelhave.Text = (txtvenhotelid.Text == "0") ? "NO" : "SÍ";



        }


        public void Search_Pasajero(String dni, String Where) {

            ClienteController Obj = new ClienteController();
            ClienteController Data = new ClienteController();
            Data.Pasajero_dni = dni;
            DataTable PasajeroSearched = Obj.Search_pasajero(Data);

            switch (Where) {
                case "pasajeros":
                    txtpsjdni.Text = PasajeroSearched.Rows[4].ToString();
                    txtpsjname.Text = PasajeroSearched.Rows[3].ToString();
                    txtpsjnameape.Text = PasajeroSearched.Rows[2].ToString();
                    txtpsjedad.Text = PasajeroSearched.Rows[1].ToString();

                    txtpsjid.Text = PasajeroSearched.Rows[0].ToString();

                    break;

                default:
                    //comprador
                    txtclidni.Text = PasajeroSearched.Rows[4].ToString();
                    txtcliname.Text = PasajeroSearched.Rows[4].ToString();
                    txtclinameape.Text = PasajeroSearched.Rows[4].ToString();
                    txtcliedad.Text = PasajeroSearched.Rows[4].ToString();
                    txtcliid.Text = PasajeroSearched.Rows[0].ToString();

                    break;
            }
        }


        public FrmVentas()
        {
            InitializeComponent();
            llenartablaclientes();
            llenartablaciudadeshotel();
            llenartablaciudadestrans();
            llenartablaventas();

            limpiarcamposclientes();
            limpiarcamposventadetalle();
            limpiarcamposventa();
        }



        private void btncliclear_Click(object sender, EventArgs e)
        {
            limpiarcamposclientes();
        }

        private void btnclisave_Click(object sender, EventArgs e)
        {
            //add cliente- comprador
            if (txtclidni.Text != "" && txtclinameape.Text != "" && txtcliname.Text != "")
            {
                if (txtclidni.Text.Length == 9)
                {
                    ClienteController Obj = new ClienteController();
                    ClienteController Data = new ClienteController();
                    Data.Pasajero_id = txtcliid.Text;

                    Data.Pasajero_dni = txtclidni.Text;
                    Data.Pasajero_edad = txtcliedad.Text;
                    Data.Pasajero_last_name = txtcliname.Text;
                    Data.Pasajero_name = txtcliname.Text;
                    Data.Pasajero_status = "ACTIVE";

                    string id_cli = Obj.Insert(Data);
                    txtcliid.Text = id_cli;



                    // limpiarcamposclientes();

                    llenartablaclientes();


                    txtvencliape.Text = txtclinameape.Text;
                    txtvenclidni.Text = txtclidni.Text;
                    txtvencliid.Text = txtcliid.Text;

                    txtvencliname.Text = txtcliname.Text;
                    txtvencode.Text = "In Process";
                    txtvenfechaactual.Text = DateTime.Now.ToShortDateString();

                    VentaController ObjVen = new VentaController();
                    txtvencode.Text = ObjVen.getcode();



                    TabControlFrmVentas.SelectedTab = tabventas;
                }
                else {
                    MessageBox.Show("DNI no válido");
                }

            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }
        }

        private void tableclientes_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //se obtiene info del row selecionado

            DataGridViewRow fila_selected = tableclientes.CurrentRow;

            //sacamos el valor de la primea column (sólo funciona con convert y no con Tostring())
            string valoruno = Convert.ToString(fila_selected.Cells[0].Value);
            string valordos = Convert.ToString(fila_selected.Cells[1].Value);
            string valortress = Convert.ToString(fila_selected.Cells[2].Value);
            string valorcuatro = Convert.ToString(fila_selected.Cells[3].Value);
            string valorcinco = Convert.ToString(fila_selected.Cells[4].Value);

            string valorseis = Convert.ToString(fila_selected.Cells[5].Value);

            txtcliid.Text = valoruno;
            txtclidni.Text = valordos;
            txtcliname.Text = valortress;
            txtclinameape.Text = valorcuatro;
            txtcliedad.Text = valorcinco;


            btnstatussave();
        }

        private void tableciudadeshotels_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //se obtiene info del row selecionado
            DataGridViewRow fila_selected = tableciudadeshotels.CurrentRow;
            txtciudadhotel.Text = Convert.ToString(fila_selected.Cells[1].Value);
        }

        private void tableciudadestransportes_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow fila_selected = tableciudadestransportes.CurrentRow;
            txtciudadtrasnpote.Text = Convert.ToString(fila_selected.Cells[1].Value);
        }

        private void btnaddhotelciudad_Click(object sender, EventArgs e)
        {
            DataGridViewRow fila_selected = tableciudadeshotels.CurrentRow;
            txtvenhotelid.Text = Convert.ToString(fila_selected.Cells[2].Value);
            txtvenhotelorigen.Text = Convert.ToString(fila_selected.Cells[1].Value);
            TabControlFrmVentas.SelectedTab = tabventas;

        }

        private void button3_Click(object sender, EventArgs e)
        {
            //add transporte a venta
            DataGridViewRow fila_selected = tableciudadestransportes.CurrentRow;
            txtventransid.Text = Convert.ToString(fila_selected.Cells[0].Value);
            txtventransorigen.Text = Convert.ToString(fila_selected.Cells[3].Value);
            txtventransfechapartida.Text = Convert.ToString(fila_selected.Cells[5].Value);
            txtventransfechapartidaid.Text = Convert.ToString(fila_selected.Cells[6].Value);



            TabControlFrmVentas.SelectedTab = tabventas;
        }

        private void btnvenaddtransid_Click(object sender, EventArgs e)
        {
            TabControlFrmVentas.SelectedTab = tabciudadestrans;
        }

        private void txtvenaddhotelid_Click(object sender, EventArgs e)
        {
            TabControlFrmVentas.SelectedTab = tabciudadeshotel;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //clear transporte id
            txtventransid.Text = "";
            txtventransorigen.Text = "ORIGEN";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            //clear hotel id

            txtvenhotelid.Text = "";
            txtvenhotelorigen.Text = "ORIGEN";
        }

        private void button7_Click(object sender, EventArgs e)
        {
            //add pasajeros

            VentaController Obj = new VentaController();
            VentaController Data = new VentaController();
            //crear pre de la venta 
            Data.Ventas_id = txtvenid.Text;
            Data.Comprador_pasajero_id = txtvencliid.Text;
            Data.Hotel_id = txtvenhotelid.Text;
            Data.Transporte_id = txtventransid.Text;
            Data.User_id = txtvenuserid.Text;
            Data.Venta_code = txtvencode.Text;
            Data.Venta_status = "ENPROCESO";

            //Data.Fecha_partida_cronograma_transpote_id = "0";
            //Data.Venta_code = txtvencode.Text;
            //Data.Venta_code = txtvencode.Text;

            string id_venta = Obj.Insert(Data);
            txtvenid.Text = id_venta;
            txtdettransid.Text = txtventransid.Text;
            txtdethotelid.Text = txtvenhotelid.Text;
            TabControlFrmVentas.SelectedTab = tabPasajeros;

            llenartabladetallesventa();
            limpiarcampospasajero();

        }

        private void btnpsjsave_Click(object sender, EventArgs e)
        {
            //add to 1 psjro
            if (txtpsjdni.Text != "" && txtpsjnameape.Text != "" && txtpsjname.Text != "")
            {

                int breake = 0;
                ClienteController Obj = new ClienteController();
                ClienteController Data = new ClienteController();
                Data.Pasajero_id = txtpsjid.Text;

                Data.Pasajero_dni = txtpsjdni.Text;
                Data.Pasajero_edad = txtpsjedad.Text;
                Data.Pasajero_last_name = txtpsjnameape.Text;
                Data.Pasajero_name = txtpsjname.Text;
                Data.Pasajero_status = "ACTIVE";

                string id_cli = Obj.Insert(Data);
                txtpsjid.Text = id_cli;
                double precio_total = 0;
                //llenar la tabla detalle
                if (txtdettransid.Text != "0")
                {
                    if (txtdetclasstypetrans.Text != "")
                    {

                        ClassTransporteController obj2 = new ClassTransporteController();
                        ClassTransporteController dataclass = new ClassTransporteController();
                        dataclass.Transporte_id = txtdettransid.Text;
                        dataclass.Transporte_clase_typo_pasaje = txtdetclasstypetrans.SelectedItem.ToString();
                        string id_class_trans = obj2.Get_id_transporte_class(dataclass);

                        if (id_class_trans != "FALSE")
                        {
                            dataclass.Transporte_clase_id = id_class_trans;
                            txtdettransclassid.Text = id_class_trans.ToString();
                            precio_total += Convert.ToDouble(obj2.Get_precio_transporte_class(dataclass));
                        }
                        else {
                            MessageBox.Show("Escojer otro tipo de asiento");
                            breake = 1;
                        }


                    } else {

                        MessageBox.Show("Escojer el tipo de asiento ");
                        breake = 1;
                    }
                }


                if (breake == 0)
                {
                    precio_total += Convert.ToDouble(txtvenpreciohotel.Text);

                    VentaDetalleController obj = new VentaDetalleController();
                    VentaDetalleController data = new VentaDetalleController();

                    data.Vendet_id = txtdetid.Text;
                    data.Vendet_cost_uni = precio_total.ToString();
                    data.Vendet_status = "ACTIVO";
                    data.Pasajero_id = txtpsjid.Text;
                    data.Venta_id = txtvenid.Text;
                    data.Transporte_clase_id = txtdettransclassid.Text;

                    obj.Insert(data);
                    llenartabladetallesventa();
                    limpiarcampospasajero();
                    //MessageBox.Show(obj.Insert(data));

                }

            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }



        }

        private void btnaddcompradortopsj_Click(object sender, EventArgs e)
        {
            ClienteController Obj = new ClienteController();

            ClienteController data = new ClienteController();
            data.Pasajero_id = txtvencliid.Text;
            DataTable ClienteComprador = Obj.List(data);

            txtpsjdni.Text = ClienteComprador.Rows[0]["pasajero_dni"].ToString();
            txtpsjname.Text = ClienteComprador.Rows[0]["pasajero_name"].ToString();
            txtpsjnameape.Text = ClienteComprador.Rows[0]["pasajero_last_name"].ToString();
            txtpsjedad.Text = ClienteComprador.Rows[0]["pasajero_edad"].ToString();
            txtpsjid.Text = ClienteComprador.Rows[0]["pasajero_id"].ToString();



        }

        private void btnremovepsj_Click(object sender, EventArgs e)
        {
            DataGridViewRow fila_selected = tableclientes.CurrentRow;
            String id_psj_remove = fila_selected.Cells[0].ToString();

            VentaDetalleController Obj = new VentaDetalleController();
            VentaDetalleController Data = new VentaDetalleController();
            Data.Vendet_id = txtvenid.Text;
            Data.Transporte_clase_id = txtdettransclassid.Text;
            Data.Pasajero_id = id_psj_remove;
            Obj.RemovePsj(Data);
            llenartabladetallesventa();
        }

        private void button6_Click(object sender, EventArgs e)
        {

            //COmpletar compra
            VentaController Obj_v = new VentaController();
            VentaController Data_v = new VentaController();
            //crear pre de la venta 
            Data_v.Ventas_id = txtvenid.Text;
            Data_v.Comprador_pasajero_id = txtvencliid.Text;
            Data_v.Hotel_id = txtvenhotelid.Text;
            Data_v.Transporte_id = txtventransid.Text;
            Data_v.User_id = txtvenuserid.Text;
            Data_v.Venta_code = txtvencode.Text;
            Data_v.Venta_status = "COMPLETADO";

            Data_v.Fecha_partida_cronograma_transpote_id = txtventransfechapartidaid.Text;
            //Data.Venta_code = txtvencode.Text;
            Data_v.Venta_code = txtvencode.Text;
            Data_v.Venta_date_reserva = txtvenfechaactual.Text;
            Data_v.Venta_date_venta = txtvenfechaactual.Text;


            VentaController Data_total = new VentaController();
            Data_total.Ventas_id = txtvenid.Text;

            Data_v.Venta_sub_total = (Obj_v.Get_total_venta(Data_total)).ToString().Replace(',', '.');
            Data_v.Venta_total = (Double.Parse(Obj_v.Get_total_venta(Data_total)) * 1.18).ToString().Replace(',', '.');

            string id_venta_de = Obj_v.Insert(Data_v);
            txtvenid.Text = id_venta_de;

            llenartabladetallesventa();
            limpiarcampospasajero();
            limpiarcamposventadetalle();
            limpiarcamposventa();
            limpiarcamposclientes();
            llenartablaventas();
            TabControlFrmVentas.SelectedTab = tabclientes;
        }

        private void txtclidni_TextChanged(object sender, EventArgs e)
        {

            if (txtclidni.Text != "")
            {
                ClienteController obj = new ClienteController();
                ClienteController data = new ClienteController();
                data.Pasajero_dni = txtclidni.Text;
                DataTable CLi = obj.Search_pasajero(data);

                if (CLi.Rows.Count > 0)
                {
                    txtcliid.Text = CLi.Rows[0][0].ToString();
                    txtcliname.Text = CLi.Rows[0][2].ToString();
                    txtclinameape.Text = CLi.Rows[0][3].ToString();
                    txtcliedad.Text = CLi.Rows[0][4].ToString();


                }
                else
                {

                    txtcliid.Text = "0";
                    txtcliname.Text = "";
                    txtclinameape.Text = "";
                    txtcliedad.Text = "";

                }
            }
            else {
                txtcliid.Text = "0";
                txtcliname.Text = "";
                txtclinameape.Text = "";
                txtcliedad.Text = "";
            }

        }

        private void txtpsjdni_TextChanged(object sender, EventArgs e)
        {
            if (txtpsjdni.Text != "")
            {
                ClienteController obj = new ClienteController();
                ClienteController data = new ClienteController();
                data.Pasajero_dni = txtpsjdni.Text;
                DataTable CLi = obj.Search_pasajero(data);

                if (CLi.Rows.Count > 0)
                {
                    txtpsjid.Text = CLi.Rows[0][0].ToString();
                    txtpsjname.Text = CLi.Rows[0][2].ToString();
                    txtpsjnameape.Text = CLi.Rows[0][3].ToString();
                    txtpsjedad.Text = CLi.Rows[0][4].ToString();

                }
                else {

                    txtpsjid.Text = "0";
                    txtpsjname.Text = "";
                    txtpsjnameape.Text = "";
                    txtpsjedad.Text = "";
                    btnstatussave();

                }
            }
        }

        private void txtclidni_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void btnlogout_Click(object sender, EventArgs e)
        {
            Login frm = new Login();
            frm.Show();
            this.Close();
        }

        private void btnclibuscar_Click(object sender, EventArgs e)
        {
            //buscar
            if (txtclinameape.Text == "" && txtcliname.Text == "")
            {
                llenartablaclientes();
            }
            else
            {
                (tableclientes.DataSource as DataTable).DefaultView.RowFilter = string.Format("pasajero_last_name like '{0}%' ", txtclinameape.Text);
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //buscar type trans
            if (textciudadtransbuscartrans.Text == "")
            {
                llenartablaciudadestrans();
            }
            else
            {
                (tableciudadestransportes.DataSource as DataTable).DefaultView.RowFilter = string.Format("type_transporte like '%{0}%'", textciudadtransbuscartrans.Text);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {

            if (textciudadhotelbuscarhotel.Text == "")
            {
                llenartablaciudadeshotel();
            }
            else
            {
                (tableciudadeshotels.DataSource as DataTable).DefaultView.RowFilter = string.Format("ciudad_name like '%{0}%'", textciudadhotelbuscarhotel.Text);
            }
        }

        private void tablelistventas_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            VentaDetalleController Obj = new VentaDetalleController();
            VentaDetalleController Data = new VentaDetalleController();

            DataGridViewRow fila_selected = tablelistventas.CurrentRow;

            Data.Venta_id = Convert.ToString(fila_selected.Cells[0].Value);
            tablelistventadetalle.DataSource = Obj.List(Data);
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            //listar transporte con cantidad de asientos disponibles
            if (textBox1.Text != "")
            {
                (tableciudadestransportes.DataSource as DataTable).DefaultView.RowFilter = string.Format("transporte_clase_asientos >= '{0}'", Convert.ToInt32(textBox1.Text));

            }
        }


        System.IO.StreamReader fileToPrint;
        System.Drawing.Font printFont;

        private System.IO.Stream streamToPrint;
        string streamType;

        //Bitmap btm;



        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        //private void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        //{

        //    //e.Graphics.DrawImage(btm, 0, 0);


        //    System.Drawing.Image image = System.Drawing.Image.FromStream(this.streamToPrint);
        //    int x = e.MarginBounds.X;
        //    int y = e.MarginBounds.Y;
        //    int width = image.Width;
        //    int height = image.Height;
        //    if ((width / e.MarginBounds.Width) > (height / e.MarginBounds.Height))
        //    {
        //        width = e.MarginBounds.Width;
        //        height = image.Height * e.MarginBounds.Width / image.Width;
        //    }
        //    else
        //    {
        //        height = e.MarginBounds.Height;
        //        width = image.Width * e.MarginBounds.Height / image.Height;
        //    }
        //    System.Drawing.Rectangle destRect = new System.Drawing.Rectangle(x, y, width, height);
        //    e.Graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, System.Drawing.GraphicsUnit.Pixel);



        //    //float yPos = 0f;
        //    //int count = 0;
        //    //float leftMargin = e.MarginBounds.Left;
        //    //float topMargin = e.MarginBounds.Top;
        //    //string line = null;
        //    //float linesPerPage = e.MarginBounds.Height / printFont.GetHeight(e.Graphics);
        //    //while (count < linesPerPage)
        //    //{
        //    //    line = fileToPrint.ReadLine();
        //    //    if (line == null)
        //    //    {
        //    //        break;
        //    //    }
        //    //    yPos = topMargin + count * printFont.GetHeight(e.Graphics);
        //    //    e.Graphics.DrawString(line, printFont, Brushes.Black, leftMargin, yPos, new StringFormat());
        //    //    count++;
        //    //}
        //    //if (line != null)
        //    //{
        //    //    e.HasMorePages = true;
        //    //}
        //}
        [System.Runtime.InteropServices.DllImportAttribute("gdi32.dll")]
        private static extern bool BitBlt
        (
            int nXDest, // handle to destination DC
        int nYDest, // x-coord of destination upper-left corner
        int nWidth, // y-coord of destination upper-left corner
        IntPtr hdcDest, // width of destination rectangle
        int nHeight, // height of destination rectangle
        IntPtr hdcSrc, // handle to source DC
        int nXSrc, // x-coordinate of source upper-left corner
        int nYSrc, // y-coordinate of source upper-left corner
        System.Int32 dwRop // raster operation code
        );
        public void StartPrint(Stream streamToPrint, string streamType)
        {
            this.printDocument1.PrintPage += new PrintPageEventHandler(printDocument1_PrintPage);
            this.streamToPrint = streamToPrint;
            this.streamType = streamType;
            System.Windows.Forms.PrintDialog PrintDialog1 = new PrintDialog();
            PrintDialog1.AllowSomePages = true;
            PrintDialog1.ShowHelp = true;
            PrintDialog1.Document = printDocument1;
            DialogResult result = PrintDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                printDocument1.Print();
                //docToPrint.Print();
            }
        }

        //private void button8_Click(object sender, EventArgs e)
        //{
        //    Graphics g1 = this.CreateGraphics();
        //    Image MyImage = new Bitmap(this.Size.Width, this.Size.Height, g1);
        //    Graphics g2 = Graphics.FromImage(MyImage);
        //    IntPtr dc1 = g1.GetHdc();
        //    IntPtr dc2 = g2.GetHdc();
        //    BitBlt(0, 0, this.ClientRectangle.Width, dc2, this.ClientRectangle.Height, dc1, 0, 0, 13369376);
        //    g1.ReleaseHdc(dc1);
        //    g2.ReleaseHdc(dc2);


        //    //const string i1Path = @"c:\my\i1.jpg";
        //    //const string i2Path = @"c:\my\i2.jpg";

        //    //var i = Image.FromFile(i1Path);

        //    //var i2 = new Bitmap(i);
        //    //i2.Save(i2Path, ImageFormat.Jpeg);

        //    //File.WriteAllBytes(@"c:\PrintPage.jpg", MyImage);
        //    MyImage.Save(@"c:\test\PrintPage.jpg", ImageFormat.Jpeg);

        //    FileStream fileStream = new FileStream(@"c:\test\PrintPage.jpg", FileMode.Open, FileAccess.Read);
        //    StartPrint(fileStream, "Image");
        //    fileStream.Close();
        //    if (System.IO.File.Exists(@"c:\test\PrintPage.jpg"))
        //    {
        //        System.IO.File.Delete(@"c:\test\PrintPage.jpg");
        //    }



            //Graphics g = this.CreateGraphics();
            //btm = new Bitmap(this.Size.Width, this.Size.Height,g);

            //Graphics mg = Graphics.FromImage(btm);
            //mg.CopyFromScreen(this.Location.X, this.Location.Y, 0, 0, this.Size);
            //printPreviewDialog1.ShowDialog();



            //string printPath = System.Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            //fileToPrint = new System.IO.StreamReader(printPath + @"\myFile.txt");
            //printFont = new System.Drawing.Font("Arial", 10);
            //printDocument1.Print();
            //fileToPrint.Close();
        //}

        private void FrmVentas_Load(object sender, EventArgs e)
        {

        }


        [System.Runtime.InteropServices.DllImport("gdi32.dll")]
        public static extern long BitBlt(IntPtr hdcDest,
        int nXDest, int nYDest, int nWidth, int nHeight,
        IntPtr hdcSrc, int nXSrc, int nYSrc, int dwRop);
        private Bitmap memoryImage;
        private void CaptureScreen()
        {
            Graphics mygraphics = this.CreateGraphics();
            Size s = this.Size;
            memoryImage = new Bitmap(s.Width, s.Height,
            mygraphics);
            Graphics memoryGraphics = Graphics.FromImage(
            memoryImage);
            IntPtr dc1 = mygraphics.GetHdc();
            IntPtr dc2 = memoryGraphics.GetHdc();
            BitBlt(dc2, 0, 0, this.ClientRectangle.Width,
            this.ClientRectangle.Height, dc1, 0, 0,
            13369376);
            mygraphics.ReleaseHdc(dc1);
            memoryGraphics.ReleaseHdc(dc2);
        }

        private void printDocument1_PrintPage(System.Object
        sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            e.Graphics.DrawImage(memoryImage, 0, 0);
        }

        private void button8_Click(System.Object sender,
        System.EventArgs e)
        {
            CaptureScreen();
            printPreviewDialog1.Document = printDocument1;
            printPreviewDialog1.Show();
        }
    }
}
