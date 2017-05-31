using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Printing;
using System.IO;
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
            ImprimirInfomre();

            Graphics g = this.CreateGraphics();
            btm = new Bitmap(  this.Size.Width, this.Size.Height, g);

            Graphics mg = Graphics.FromImage(btm);
            mg.CopyFromScreen(this.Location.X, this.Location.Y, 0, 0, this.Size);
            printPreviewDialog1.ShowDialog();


           



        }

        private void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            e.Graphics.DrawImage(btm, 0, 0);
        }





        ///////////////////////////////////////

        private IList<Stream> pages = new List<Stream>();
        private int currentPageIndex;

        public void ImprimirInfomre()
        {

            
               String ruta = @"C:\Users\BL-PC\Desktop\TravelsAgency\CapaPresentacion";
            //List<object> dtoContent = new List<object>();
            //Operario op1 = new Operario() { nombre = "Pepe", cargo = "Pintor" };
            //dtoContent.Add(op1);


            ReportViewer reportViewer = new ReportViewer();
            //ReportDataSource rds = new ReportDataSource("DataSourceName", dtoContent);
            //reportViewer.LocalReport.DataSources.Add(rds);

            reportViewer.LocalReport.ReportPath = ruta + "\\" + "Report1.rdlc";
            reportViewer.ProcessingMode = ProcessingMode.Local;


            Warning[] warnings;
            string[] streamids;
            string mimeType;
            string encoding;
            string filenameExtension;

            byte[] bytes = reportViewer.LocalReport.Render(
                "PDF", null, out mimeType, out encoding, out filenameExtension,
                out streamids, out warnings);

            using (FileStream fs = new FileStream(@"C:\Users\BL-PC\Downloads\fraps 3.5.99 2016\output.pdf", FileMode.Create))
            {
                fs.Write(bytes, 0, bytes.Length);
            }


            Export(reportViewer.LocalReport);

            // Debe existir al menos una pagina a imprimir
            if (pages == null || pages.Count == 0)
                return;

            PrintDocument printDocument = new PrintDocument();
            printDocument.PrinterSettings.PrinterName = "NombreImpresora";

            if (!printDocument.PrinterSettings.IsValid)
                return; //ImpresoraNoEncontrada

            printDocument.PrintPage += new PrintPageEventHandler(PrintPage);
            printDocument.Print();

        }

        /// <summary>
        /// Handler que es llamado para cada página que se va a imprimir
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="ev"></param>
        private void PrintPage(object sender, PrintPageEventArgs ev)
        {
            // Se crea un objeto Metafile que define un grafico
            // en base a la información contenida en un stream
            Metafile pageImage = new Metafile(pages[currentPageIndex]);

            // Se dibuja la página en el reporte
            ev.Graphics.DrawImage(pageImage, ev.PageBounds);

            // Se procesan las paginas siguientes
            currentPageIndex++;
            ev.HasMorePages = (currentPageIndex < pages.Count);
        }

        /// <summary>
        /// Export the given report as an EMF (Enhanced Metafile) file.
        /// </summary>
        /// <param name="report"></param>
        private void Export(LocalReport report)
        {
            string deviceInfo =
                "<DeviceInfo>" +
                "  <OutputFormat>EMF</OutputFormat>" +
                "  <PageWidth>8.3in</PageWidth>" +
                "  <PageHeight>11.7in</PageHeight>" +
                "  <MarginTop>0.25in</MarginTop>" +
                "  <MarginLeft>0.25in</MarginLeft>" +
                "  <MarginRight>0.10in</MarginRight>" +
                "  <MarginBottom>0.25in</MarginBottom>" +
                "</DeviceInfo>";

            Warning[] warnings;

            try
            {
                // El método render es el encargado de crear el stream
                // (llamando a CreateStream) en el formato especificado,
                // usando el stream proveido por la funcion de callback
                // en este caso, un aun archivo EMF con ciertas medidas
                report.Render("Image", deviceInfo, CreateStream, out warnings);

                // Se encarga de resetear la posicion de
                // todos los stream al inicio de los mismos
                foreach (Stream stream in pages)
                    stream.Position = 0;
            }
            catch (LocalProcessingException ex)
            {
                throw ex;
            }
        }

        private Stream CreateStream(string name, string fileNameExtension, Encoding encoding, string mimeType, bool willSeek)
        {
            // Creamos un MemoryStream para no tener que grabar en el
            // disco duro cada una de las páginas que pudiera haber
            Stream stream = new MemoryStream();

            // Se añade el stream al listado
            pages.Add(stream);

            return stream;
        }
  





    /////////////////////////////////////////















}
}
