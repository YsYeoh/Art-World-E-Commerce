using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtWorld_Web.page
{
    public partial class login : System.Web.UI.Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            string sql1 = @"SELECT COUNT(*) FROM Users as a 
                        WHERE a.email = @email 
                        AND a.password = @password
                        AND a.verified = @verified";

            string sql2 = @"UPDATE Users 
                        SET lastLogin=@lastLogin 
                        WHERE email = @email 
                        AND password = @password";

            bool userExist = false;
            int count = 0;

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd1 = new SqlCommand(sql1, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);

            cmd1.Parameters.AddWithValue("@email", email);
            cmd1.Parameters.AddWithValue("@password", password);
            cmd1.Parameters.AddWithValue("@verified", true);

            con.Open();
            count = (int)cmd1.ExecuteScalar();
            if (count > 0)
            {
                userExist = true;
            }

            if (userExist)
            {
                DateTime myDateTime = DateTime.Now;
                string lastLogin = myDateTime.ToString("yyyy-MM-dd HH:mm:ss");

                cmd2.Parameters.AddWithValue("@email", email);
                cmd2.Parameters.AddWithValue("@password", password);
                cmd2.Parameters.AddWithValue("@lastLogin", lastLogin);

                count = cmd2.ExecuteNonQuery();
            }
            con.Close();

            if (count>0)
            {
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Redirect("login.aspx?status=unsuccess");
            }
        }
    }
}