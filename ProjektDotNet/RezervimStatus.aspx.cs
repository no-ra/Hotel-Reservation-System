using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace ProjektDotNet
{
    public partial class RezervimStatus : System.Web.UI.Page
    {

        private string connectionString =
                WebConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;

        private SqlConnection getSqlCon()
        {
            return new SqlConnection(connectionString);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Veprim(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];
            int RezervimId = Convert.ToInt32(Server.HtmlDecode(row.Cells[0].Text));

            switch (e.CommandName)
            {
                case "Anullo":
                    fshiRezervim(RezervimId);
                    break;

                case "CheckIn":
                    CheckInRezervim(RezervimId);
                    break;

                case "CheckOut":
                    CheckOutRezervim(RezervimId);
                    break;

                default:
                    break;
            }
        }

        private void fshiRezervim(int RezervimId)
        {
            SqlConnection con = getSqlCon();
            
            con.Open();
            string query = String.Format("DELETE FROM Rezervim_Dhome WHERE RezervimID = '{0}'", RezervimId);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();

          
            con.Close();
            Response.Redirect(Request.RawUrl);

        }

        protected void CheckInRezervim(int RezervimId)
        {
            SqlConnection con = getSqlCon();
            con.Open();

            DateTime myDateTime = DateTime.Now;
            string sqlFormattedDate = myDateTime.ToString("yyyy-MM-dd");
            string query = String.Format("UPDATE Rezervim SET Date_CheckIn = '{0}' WHERE RezervimID = '{1}'",
                sqlFormattedDate, RezervimId);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.RawUrl);
        }

        private void CheckOutRezervim(int RezervimId)
        {
            SqlConnection con = getSqlCon();
            con.Open();

            DateTime myDateTime = DateTime.Now;
            string sqlFormattedDate = myDateTime.ToString("yyyy-MM-dd");
            string query = String.Format("UPDATE Rezervim SET Date_CheckOut = '{0}' WHERE RezervimID = '{1}'",
                sqlFormattedDate, RezervimId);

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            
            Response.Redirect(Request.RawUrl);
        }

    }
}