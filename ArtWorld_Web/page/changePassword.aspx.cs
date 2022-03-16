using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace ArtWorld_Web.page
{
    public partial class changePassword : Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string oriPassword = txtOriPassword.Text;
                string password1 = txtPassword1.Text;
                string password2 = txtPassword2.Text;

                string sqlCheckOri = @"SELECT COUNT(*) FROM Users as a WHERE a.userId=@userId AND a.password=@password";
                string sqlUpdate = "UPDATE Users SET password=@password WHERE userId=@userId";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmdCheckOri = new SqlCommand(sqlCheckOri, con);
                SqlCommand cmdUpdate = new SqlCommand(sqlUpdate, con);

                cmdCheckOri.Parameters.AddWithValue("@userId", 1);
                cmdCheckOri.Parameters.AddWithValue("@password", oriPassword);
                cmdUpdate.Parameters.AddWithValue("@userId", 1);
                cmdUpdate.Parameters.AddWithValue("@password", password1);
                con.Open();
                int count = (int)cmdCheckOri.ExecuteScalar();
                int updateStatus = 0;
                if (count > 0)
                {
                    updateStatus = cmdUpdate.ExecuteNonQuery();
                }
                con.Close();

                if(updateStatus > 0 && count > 0)
                {
                    Response.Redirect("changePassword.aspx?status=success");
                }
                else
                {
                    Response.Redirect("changePassword.aspx?status=unsuccess");
                }
            }
            
        }

        protected string GenerateSalt(int nSalt)
        {
            var saltBytes = new byte[nSalt];

            using (var provider = new RNGCryptoServiceProvider())
            {
                provider.GetNonZeroBytes(saltBytes);
            }

            return Convert.ToBase64String(saltBytes);
        }

        protected string HashPassword(string password, string salt, int nIterations, int nHash)
        {
            var saltBytes = Convert.FromBase64String(salt);

            using (var rfc2898DeriveBytes = new Rfc2898DeriveBytes(password, saltBytes, nIterations))
            {
                return Convert.ToBase64String(rfc2898DeriveBytes.GetBytes(nHash));
            }
        }

    }
}