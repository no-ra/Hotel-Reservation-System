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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckLogin(object sender, EventArgs e)
        {
            string connectionString =
                WebConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
            
            SqlConnection con = new SqlConnection(connectionString);
            
            string query = String.Format("SELECT * FROM Menaxher WHERE Username='{0}' AND Password='{1}'",
                Username.Text, Password.Text);
            
            con.Open();
            
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();

            int rows = 0;
            bool isAdmin = false;
            string Emri = "";
            while (dr.Read())
            {
                rows++;
                Emri = Convert.ToString(dr["Emer"]);
                if (Convert.ToInt32(dr["Admin"]) == 1)
                {
                    isAdmin = true;
                    
                    break;
                }
                else
                {
                    isAdmin = false;

                }
                
            }
            
            string status;
            if (rows != 0)
            {
                if (isAdmin)
                    status = "Miresevini Administrator: " + Emri;
                else
                    status = "Miresevini Recepsionist: " + Emri;
            }
            else
                status = "Username ose passwordi jane gabim!";

            LoginStatus.Text = status;
        }
    }

}