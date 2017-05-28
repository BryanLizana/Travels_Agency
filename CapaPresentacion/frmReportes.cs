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
    public partial class frmReportes : Form
    {
       public void llenarall()
        {

            UserController Obj = new UserController();
            table1.DataSource = Obj.List_ciudades_visitadas();
            table2.DataSource = Obj.List_fechas_ventas();
            table3.DataSource = Obj.List_fechas_viajes();
            table4.DataSource = Obj.List_pasajeros_viajeros();
            table5.DataSource = Obj.List_users_ventas();
        }

        public frmReportes()
        {
            InitializeComponent();
            llenarall();
        }

        private void btnlogout_Click(object sender, EventArgs e)
        {
            Login frm = new Login();
            frm.Show();
            this.Close();
        }
    }
}
