using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Odbc;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PostgreAPI
{
    public partial class FormMainMenu : Form
    {
        public FormMainMenu()
        {
            InitializeComponent();
        }

        private void FormMainMenu_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'ergasia1.accident' table. You can move, or remove it, as needed.
            // this.accidentTableAdapter.Fill(this.ergasia1.accident);


        }

        private void button1_Click(object sender, EventArgs e)
        {

            var query = richTextBox1.Text;

            OdbcConnection connection = new OdbcConnection("Dsn=PostGreVS;uid=postgres;pwd=4201337");
            //OdbcCommand    command = new OdbcCommand(query, connection);
            connection.Open();
            var dataAdapter = new OdbcDataAdapter(query, connection);

            try
            {
                var commandBuilder = new OdbcCommandBuilder(dataAdapter);
                var dataSet = new DataSet();
                dataAdapter.Fill(dataSet);
                dataGridView1.ReadOnly = true;
                dataGridView1.DataSource = dataSet.Tables[0];

                label1.Visible = false;

            }
            catch (Exception ex)
            {
                label1.Text = "Something went wrong. (" + ex.Message + ")";
                label1.Visible = true;
            }
            
        }

        private void onErotimaButtonClick(object sender, EventArgs e)
        {
            Button buttonPressed = (Button)sender;
            string filename = "";

            switch (buttonPressed.Name)
            {
                case "button2":
                    filename = "a.sql";
                    break;
                case "button3":

                    filename = "b.sql";
                    break;
                case "button4":
                    if (MessageBox.Show("Ποια παραλλαγή του ερωτήματος θα δείτε;\n\nΠατήστε YES για την πρώτη παραλλαγή.\nΠατήστε NO για την δεύτερη παραλλαγή.", "Παραλλαγή Θέματος", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        filename = "c1.sql";
                    else
                        filename = "c2.sql";
                    break;
                case "button5":
                    filename = "d.sql";
                    break;
                case "button6":
                    filename = "e.sql";
                    break;
                case "button7":
                    filename = "f.sql";
                    break;
            }

            StreamReader sr = new StreamReader(filename, Encoding.UTF8);
            richTextBox1.Text = sr.ReadToEnd();
            sr.Close();
        }
    }
}
