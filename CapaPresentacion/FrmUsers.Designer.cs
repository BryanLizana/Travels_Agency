namespace CapaPresentacion
{
    partial class FrmUsers
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tableuser = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtuserid = new System.Windows.Forms.Label();
            this.txtuserpass = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtuserdni = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtusertype = new System.Windows.Forms.ComboBox();
            this.btnusersearch = new System.Windows.Forms.Button();
            this.btnuserdel = new System.Windows.Forms.Button();
            this.btnusersave = new System.Windows.Forms.Button();
            this.btnuserclear = new System.Windows.Forms.Button();
            this.btnlogout = new System.Windows.Forms.Button();
            this.label14 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.tableuser)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableuser
            // 
            this.tableuser.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.tableuser.Location = new System.Drawing.Point(55, 375);
            this.tableuser.Name = "tableuser";
            this.tableuser.Size = new System.Drawing.Size(627, 183);
            this.tableuser.TabIndex = 0;
            this.tableuser.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.tableuser_CellContentClick);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtuserid);
            this.groupBox1.Controls.Add(this.txtuserpass);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txtuserdni);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtusertype);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(55, 107);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(426, 229);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Usuario";
            // 
            // txtuserid
            // 
            this.txtuserid.AutoSize = true;
            this.txtuserid.Location = new System.Drawing.Point(28, 192);
            this.txtuserid.Name = "txtuserid";
            this.txtuserid.Size = new System.Drawing.Size(26, 20);
            this.txtuserid.TabIndex = 7;
            this.txtuserid.Text = "ID";
            this.txtuserid.Visible = false;
            // 
            // txtuserpass
            // 
            this.txtuserpass.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtuserpass.Location = new System.Drawing.Point(171, 86);
            this.txtuserpass.Name = "txtuserpass";
            this.txtuserpass.Size = new System.Drawing.Size(155, 26);
            this.txtuserpass.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(15, 137);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(54, 20);
            this.label3.TabIndex = 5;
            this.label3.Text = "ÁREA";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(15, 41);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(81, 20);
            this.label2.TabIndex = 3;
            this.label2.Text = "CodeUser";
            // 
            // txtuserdni
            // 
            this.txtuserdni.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtuserdni.Location = new System.Drawing.Point(171, 35);
            this.txtuserdni.Name = "txtuserdni";
            this.txtuserdni.Size = new System.Drawing.Size(155, 26);
            this.txtuserdni.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(15, 86);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(78, 20);
            this.label1.TabIndex = 1;
            this.label1.Text = "Password";
            // 
            // txtusertype
            // 
            this.txtusertype.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtusertype.FormattingEnabled = true;
            this.txtusertype.Items.AddRange(new object[] {
            "AREAVENTAS",
            "AREAREGISTROS",
            "AREAUSUARIOS",
            "AREAREPORTES"});
            this.txtusertype.Location = new System.Drawing.Point(171, 134);
            this.txtusertype.Name = "txtusertype";
            this.txtusertype.Size = new System.Drawing.Size(155, 28);
            this.txtusertype.TabIndex = 0;
            // 
            // btnusersearch
            // 
            this.btnusersearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnusersearch.Location = new System.Drawing.Point(555, 130);
            this.btnusersearch.Name = "btnusersearch";
            this.btnusersearch.Size = new System.Drawing.Size(127, 38);
            this.btnusersearch.TabIndex = 2;
            this.btnusersearch.Text = "BUSCAR";
            this.btnusersearch.UseVisualStyleBackColor = true;
            // 
            // btnuserdel
            // 
            this.btnuserdel.BackColor = System.Drawing.Color.IndianRed;
            this.btnuserdel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnuserdel.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btnuserdel.Location = new System.Drawing.Point(555, 178);
            this.btnuserdel.Name = "btnuserdel";
            this.btnuserdel.Size = new System.Drawing.Size(127, 38);
            this.btnuserdel.TabIndex = 3;
            this.btnuserdel.Text = "ELIMINAR";
            this.btnuserdel.UseVisualStyleBackColor = false;
            this.btnuserdel.Click += new System.EventHandler(this.btnuserdel_Click);
            // 
            // btnusersave
            // 
            this.btnusersave.BackColor = System.Drawing.Color.LimeGreen;
            this.btnusersave.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnusersave.Location = new System.Drawing.Point(555, 233);
            this.btnusersave.Name = "btnusersave";
            this.btnusersave.Size = new System.Drawing.Size(127, 36);
            this.btnusersave.TabIndex = 4;
            this.btnusersave.Text = "CREAR";
            this.btnusersave.UseVisualStyleBackColor = false;
            this.btnusersave.Click += new System.EventHandler(this.btnusersave_Click);
            // 
            // btnuserclear
            // 
            this.btnuserclear.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnuserclear.Location = new System.Drawing.Point(606, 290);
            this.btnuserclear.Name = "btnuserclear";
            this.btnuserclear.Size = new System.Drawing.Size(76, 38);
            this.btnuserclear.TabIndex = 5;
            this.btnuserclear.Text = "New";
            this.btnuserclear.UseVisualStyleBackColor = true;
            this.btnuserclear.Click += new System.EventHandler(this.btnuserclear_Click);
            // 
            // btnlogout
            // 
            this.btnlogout.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnlogout.Location = new System.Drawing.Point(534, 574);
            this.btnlogout.Name = "btnlogout";
            this.btnlogout.Size = new System.Drawing.Size(148, 38);
            this.btnlogout.TabIndex = 15;
            this.btnlogout.Text = "LogOut";
            this.btnlogout.UseVisualStyleBackColor = true;
            this.btnlogout.Click += new System.EventHandler(this.btnlogout_Click);
            // 
            // label14
            // 
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.label14.Location = new System.Drawing.Point(416, -1);
            this.label14.Name = "label14";
            this.label14.Padding = new System.Windows.Forms.Padding(10);
            this.label14.Size = new System.Drawing.Size(326, 61);
            this.label14.TabIndex = 17;
            this.label14.Text = "Travels Agency E.";
            // 
            // FrmUsers
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(740, 624);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.btnlogout);
            this.Controls.Add(this.btnuserclear);
            this.Controls.Add(this.btnusersave);
            this.Controls.Add(this.btnuserdel);
            this.Controls.Add(this.btnusersearch);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.tableuser);
            this.Name = "FrmUsers";
            this.Text = "FrmUsers";
            this.Load += new System.EventHandler(this.FrmUsers_Load);
            ((System.ComponentModel.ISupportInitialize)(this.tableuser)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView tableuser;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtuserpass;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtuserdni;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox txtusertype;
        private System.Windows.Forms.Button btnusersearch;
        private System.Windows.Forms.Button btnuserdel;
        private System.Windows.Forms.Button btnusersave;
        private System.Windows.Forms.Button btnuserclear;
        private System.Windows.Forms.Label txtuserid;
        private System.Windows.Forms.Button btnlogout;
        private System.Windows.Forms.Label label14;
    }
}