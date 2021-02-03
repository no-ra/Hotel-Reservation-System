using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace ProjektDotNet
{
    public partial class Rregjistrim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool ekzistonUser(string username)
        {
            string connectionString =
                    WebConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string query = String.Format("SELECT * FROM Menaxher WHERE Username = '{0}'", username);
            int rows = 0;

            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                rows++;
            }

            con.Close();

            if (rows == 0)
                return false;
            else
                return true;

            
        }

        protected void Btn_Rregjistro(object sender, EventArgs e)
        {

            int admin = 0;
           

            string username = Username.Text;

            if (ekzistonUser(username))
            {
                RegjistrimStatus.Text = "Username ekziston, zgjidhni nje tjeter!";
            }
            else
            {

                try
                {
                    string connectionString =
                        WebConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

                    SqlConnection con = new SqlConnection(connectionString);
                    con.Open();


                    if (RadioButton1.Checked == true)
                    {
                        admin = 1;
                    }
                    else
                    {
                        admin = 0;
                    }

           

                        string query = String.Format("INSERT INTO Menaxher (Emer, Mbiemer, Username,Password, Admin) values('{0}','{1}','{2}','{3}','{4}')",
                            Emri.Text, Mbiemri.Text, username, Password.Text, admin);

                        SqlCommand cmd = new SqlCommand(query, con);
                    
                       
                    cmd.ExecuteNonQuery();
                    
                    
                       
                        if (Page.IsValid)
                        {
                            Rregjistro.Text = "I vlefshem";
                            
                        }
                        else
                        {
                            Rregjistro.Text = "Jo i vlefshem!";
                        }
                    
             
                    con.Close();
                    Response.Redirect(Request.RawUrl);

                }
                catch (Exception ex)
                {
                    Response.Write("Error" + ex.ToString());
                }

            }
           
        }

        protected void Btn_Reset(object sender, EventArgs e)
        {
            Emri.Text = string.Empty;
            Mbiemri.Text = string.Empty;
            Username.Text = string.Empty;
            Password.Text = string.Empty;
            ConfirmPassword.Text = string.Empty;

        }


        protected void Veprim(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];
            int MenaxherId = Convert.ToInt32(Server.HtmlDecode(row.Cells[0].Text));

            switch (e.CommandName)
            {
                case "Fshi":
                    fshiUser(MenaxherId);
                    break;
                
                default:
                    break;
            }
            Response.Redirect(Request.RawUrl);
        }

        private void fshiUser(int MenaxherId)
         {

            string connectionString =
                       WebConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = String.Format("DELETE FROM Menaxher WHERE MenaxherID = '{0}'", MenaxherId);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

       
   
    
    }


}