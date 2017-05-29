using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        Bitmap btm;
        private void button1_Click(object sender, EventArgs e)
        {

            Graphics g = this.CreateGraphics();
            btm = new Bitmap(this.Size.Width, this.Size.Height, g);

            Graphics mg = Graphics.FromImage(btm);
            mg.CopyFromScreen(this.Location.X, this.Location.Y, 0, 0, this.Size);
            printPreviewDialog1.ShowDialog();
        }

        private void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            e.Graphics.DrawImage(btm, 0, 0);
        }
    }
}
