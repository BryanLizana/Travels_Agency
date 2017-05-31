using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CapaNegocios;
namespace CapaPresentacion
{
    public partial class FrmUsers : Form
    {

        //funciones comunes
        public void limpiarcampos() {
            txtuserdni.Text = "";
            txtuserid.Text = "0";
            txtuserpass.Text = "";

        }


        public void llenartablauser()
        {

            UserController Obj = new UserController();
            UserController User = new UserController();
            User.User_id = "0";
            tableuser.DataSource = Obj.List(User);


        }

        public void btnsavestatus() {

            if (txtuserid.Text == "0")
            {
                btnusersave.Text = "CREAR USUARIO";
            }
            else
            {
                btnusersave.Text = "EDITAR USUARIO";
            }

        }


        public FrmUsers()
        {
            InitializeComponent();
            llenartablauser();
            limpiarcampos();
            btnsavestatus();
        }

        private void FrmUsers_Load(object sender, EventArgs e)
        {

        }

        private void btnusersave_Click(object sender, EventArgs e)
        {

            if ( txtuserdni.Text != "" && txtuserpass.Text != ""  && 
                txtusertype.SelectedItem.ToString() != ""
                //txtusernamafull.Text != "" &&
                //txtusertel.Text != "" 
                )
            {
                UserController Obj = new UserController();
                UserController User = new UserController();

                User.User_id = txtuserid.Text;

                User.User_dni = txtuserdni.Text;
                User.User_pass = txtuserpass.Text;
                User.User_status = "ACTIVE";
                User.User_type = txtusertype.SelectedItem.ToString();
             
                MessageBox.Show(Obj.Insert(User));
                llenartablauser();
                limpiarcampos();
            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }
         


        }

        private void tableuser_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            //se obtiene info del row selecionado

            DataGridViewRow fila_selected = tableuser.CurrentRow;

            //sacamos el valor de la primea column (sólo funciona con convert y no con tostring())
            string id = Convert.ToString(fila_selected.Cells[0].Value);
            string dni = Convert.ToString(fila_selected.Cells[1].Value);
            string pass = Convert.ToString(fila_selected.Cells[2].Value);
            string type = Convert.ToString(fila_selected.Cells[4].Value);



            txtuserdni.Text = dni;
            txtuserid.Text = id;
            txtuserpass.Text = pass;
            txtusertype.SelectedItem = type;

            btnsavestatus();
        }

        private void btnuserclear_Click(object sender, EventArgs e)
        {
            limpiarcampos();
            btnsavestatus();
        }

        private void btnuserdel_Click(object sender, EventArgs e)
        {

            if (txtuserdni.Text != "" && txtuserpass.Text != "" && txtusertype.SelectedItem.ToString() != "")
            {
                UserController Obj = new UserController();
                UserController User = new UserController();

                User.User_id = txtuserid.Text;

                User.User_dni = txtuserdni.Text;
                User.User_pass = txtuserpass.Text;
                User.User_status = "DESACTIVE";
                User.User_type = txtusertype.SelectedItem.ToString();

                Obj.Insert(User);
                MessageBox.Show("Usuario Desactivado");
                llenartablauser();
                limpiarcampos();
                btnsavestatus();
            }
            else
            {
                MessageBox.Show("No deje campos vacíos¡¡");
            }

        }

        private void btnlogout_Click(object sender, EventArgs e)
        {
            Login frm = new Login();
            frm.Show();
            this.Close();
        }
    }
}
