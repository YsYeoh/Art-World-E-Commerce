using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net;
using System.Text;

namespace ArtWorld_Web
{
    public partial class register : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string name = txtName.Text;
                string nickname = txtName.Text;
                //string birth = txtBirth.Text;
                //string contact = txtContact.Text;
                //string gender = rblGender.Text;
                string email = txtEmail.Text;
                string password1 = txtPassword1.Text;
                string password2 = txtPassword2.Text;
                bool tnc = cbTnc.Checked;

                string token = generateToken();

                DateTime myDateTime = DateTime.Now;
                string createdDate = myDateTime.ToString("yyyy-MM-dd HH:mm:ss");

                if (!(password1.Equals(password2)))
                {
                    var link = "register.aspx?status=unsuccess";
                    Response.Redirect(link);
                }
                else
                {
                    if (!tnc)
                    {
                        var link = "register.aspx?status=unsuccess";
                        Response.Redirect(link);
                    }
                    string sqlCheckExist = @"SELECT COUNT(*) FROM Users as a WHERE a.email = @email";

                    string sqlInsertUser = @"INSERT INTO Users (name, nickname, email, password, createdDate, registerToken, verified) 
                            VALUES (@name, @nickname, @email, @password, @createdDate, @registerToken, @verified)";

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmdCheckExist = new SqlCommand(sqlCheckExist, con);
                    SqlCommand cmdInsertUser = new SqlCommand(sqlInsertUser, con);

                    cmdCheckExist.Parameters.AddWithValue("@email", email);
                    cmdInsertUser.Parameters.AddWithValue("@name", name);
                    cmdInsertUser.Parameters.AddWithValue("@nickname", nickname);
                    cmdInsertUser.Parameters.AddWithValue("@email", email);
                    //cmdInsertUser.Parameters.AddWithValue("@contact", contact);
                    cmdInsertUser.Parameters.AddWithValue("@password", password1);
                    cmdInsertUser.Parameters.AddWithValue("@createdDate", createdDate);
                    //cmdInsertUser.Parameters.AddWithValue("@gender", gender);
                    //cmdInsertUser.Parameters.AddWithValue("@birth", birth);
                    cmdInsertUser.Parameters.AddWithValue("@registerToken", token);
                    cmdInsertUser.Parameters.AddWithValue("@verified", false);

                    con.Open();
                    int existStatus = (int)cmdCheckExist.ExecuteScalar();
                    int insertUserStatus = 0;
                    if (existStatus == 0)
                    {
                        insertUserStatus = cmdInsertUser.ExecuteNonQuery();
                    }
                    con.Close();

                    if (existStatus == 0 && insertUserStatus > 0)
                    {
                        //Get current URL host path and generate the link
                        string host = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/page/accountVerify.aspx?token=" + token;
                        sendEmail(email, host);

                        var link = "login.aspx?status=verifying";
                        Response.Redirect(link);
                    }
                    else
                    {
                        var link = "register.aspx?status=unsuccess";
                        Response.Redirect(link);
                    }
                }
            }
        }

        protected string generateToken()
        {
            byte[] salt = new byte[128 / 8];
            using (var rngCsp = new RNGCryptoServiceProvider())
            {
                rngCsp.GetNonZeroBytes(salt);
            }
            string token = Convert.ToBase64String(salt).Replace('+', 'p') + DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1)).TotalSeconds.ToString();

            return token;
        }

        protected void sendEmail(string toEmail, string verifiedLink)
        {   
            string from = "artworldstudio6@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, toEmail);

            string mailbody = @"<!DOCTYPE html>
                                <html>
                                    <head>
                                        <meta charset='utf-8'>
                                        <meta name='viewport' content='width=device-width, initial-scale=1'>
                                    </head>
                                    <body style='width: 40%; font-family: Century Gothic, CenturyGothic, AppleGothic, sans-serif !important; margin: 0px auto !important;'>
                                        <div style=' width: 100%; background-color: #F1DCA7; text-align: center;'>
                                            <h1>Artworld Studio Registration Successfully!</h1>
                                        </div>
                                        <div id='content' style='width:100%; text-align: center;'>
                                            <h3>Thanks for register as Artworld Studio user</h3>
                                            <p>Please click the below link to verify your account now!</p>
                                            <br />" + verifiedLink + @"
                                        </div>
                                        <div id='footer' style='width: 100%; background-color: #F1DCA7; text-align: center;'>
                                            Developed by ArtWorld Studio &copy; 2022
                                        </div>
                                    </body>
                                </html>";
            message.Subject = "Artworld Studio Account Verification";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("artworldstudio6@gmail.com", "Artworld@123");
            client.EnableSsl = true;
            try
            {
                client.Send(message);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}