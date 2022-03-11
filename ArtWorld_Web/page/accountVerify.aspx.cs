using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtWorld_Web
{
    
    public partial class accountVerify : Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string token = Request.QueryString["token"] ?? "";
                if(token == "")
                {
                    Response.Redirect("login.aspx");
                }

                response.Text = token;

                string sql = @"SELECT COUNT(*) FROM Users as a WHERE a.registerToken = @token";
                string sqlUpdate = @"UPDATE Users SET verified = @verified WHERE registerToken = @token";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlCommand cmdUpdate = new SqlCommand(sqlUpdate, con);

                cmd.Parameters.AddWithValue("@token", token);
                cmdUpdate.Parameters.AddWithValue("@token", token);
                cmdUpdate.Parameters.AddWithValue("@verified", true);

                con.Open();
                int updateStatus = 0;
                int count = (int)cmd.ExecuteScalar();
                if(count > 0)
                {
                    updateStatus = cmdUpdate.ExecuteNonQuery();
                    
                }
                con.Close();
                
                if(updateStatus > 0)
                {
                    Response.Redirect("login.aspx?status=verified");
                }
                else
                {
                    response.Text = "Verification unseccessfully";
                }
                
            }
        }
    }
}