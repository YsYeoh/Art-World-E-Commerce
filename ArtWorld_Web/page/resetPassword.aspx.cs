using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtWorld_Web.page
{
    public partial class resetPassword : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string token = Request.QueryString["token"] ?? "";

                if(token == "") {
                    Response.Redirect("forgetPassword.aspx");
                }

                string sql = @"SELECT COUNT(*) FROM Users as a WHERE a.resetPWToken = @token";
                string sqlEmail = @"SELECT a.email FROM Users as a WHERE a.resetPWToken = @token";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlCommand cmdEmail = new SqlCommand(sqlEmail, con);

                cmd.Parameters.AddWithValue("@token", token);
                cmdEmail.Parameters.AddWithValue("@token", token);

                con.Open();
                int count = (int)cmd.ExecuteScalar();
                string email = "";
                if(count > 0)
                {
                    email = (string)cmdEmail.ExecuteScalar();
                }
                con.Close();

                if(email != "" && count > 0)
                {
                    lblEmail.Text = "Account: " + email;
                }
                else
                {
                    Response.Redirect("forgetPassword.aspx?status=tokenNotFound");
                }
                
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"] ?? "";

            if (token == "")
            {
                Response.Redirect("forgetPassword.aspx");
            }

            string password1 = txtPassword1.Text;
            string password2 = txtPassword2.Text;

            if (!(password1.Equals(password2)))
            {
                Response.Redirect("resetPassword.aspx?status=unsuccess&token=" + token);
            }

            string sql = @"UPDATE Users SET password = @password WHERE resetPWToken = @token";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@password", password1);
            cmd.Parameters.AddWithValue("@token", token);

            con.Open();
            int count = cmd.ExecuteNonQuery();
            con.Close();

            if (count > 0)
            {
                Response.Redirect("login.aspx?status=passwordResetSuccess");
            }
            else
            {
                Response.Redirect("resetPassword.aspx?status=unsuccess&token=" + token);
            }
        }
    }
}