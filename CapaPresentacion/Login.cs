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
    public partial class Login : Form
    {
        static UserController UsuarioActual = new UserController();

        public Login()
        {
            InitializeComponent();

        }

        private void btnlogin_Click(object sender, EventArgs e)
        {
            UserController Obj = new UserController();
            Obj.User_dni = txtloguser.Text;
            Obj.User_pass = txtlogpass.Text;
            DataTable dt = new DataTable();
            ///uhmmm es correcto hacer esto ?
            dt = Obj.login(Obj);
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                UsuarioActual.User_dni = dr[0].ToString();
                UsuarioActual.User_id = dr[1].ToString();
                UsuarioActual.User_pass = dr[2].ToString();
                UsuarioActual.User_status = dr[3].ToString();
                UsuarioActual.User_type = dr[4].ToString();

                if (UsuarioActual.User_status == "ACTIVE")
                {
                    switch (UsuarioActual.User_type)
                    {
                        case "AREAVENTAS":
                            FrmVentas frm = new FrmVentas();
                            frm.txtvenusername.Text = UsuarioActual.User_dni;
                            frm.txtvenuserid.Text = UsuarioActual.User_id;
                            frm.Show();
                            break;
                        case "AREAREGISTROS":
                            FrmBack frm2 = new FrmBack();
                            frm2.Show();
                            break;
                        case "AREAREPORTES":
                            frmReportes frm3 = new frmReportes();
                            frm3.Show();
                            break;
                        case "AREAUSUARIOS":
                            FrmUsers frm4 = new FrmUsers();
                            frm4.Show();
                            break;
                        case "ROOT":
                            FrmBack frm5 = new FrmBack();
                            frm5.Show();
                            break;
                    }

                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Usted está baneado");

                }
             


            }
            else
            {
                //FrmVentas frm = new FrmVentas();
                //frm.txtvenusername.Text = "123456789";
                //frm.txtvenuserid.Text = "1";
                //frm.Show();
                MessageBox.Show("Credenciales incorrectas");

                txtloguser.Text = Obj.User_dni.ToString();
            }
        }
    }
}
