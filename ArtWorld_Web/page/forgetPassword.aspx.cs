﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Security.Cryptography;

namespace ArtWorld_Web.page
{
    public partial class forgetPassword : System.Web.UI.Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

            string email = txtEmail.Text;

            string sqlExist = @"SELECT a.userId FROM Users as a WHERE a.email = @email";
            string sqlUpdate = @"UPDATE Users SET resetPWToken=@token WHERE userId=@userId";

            string token = generateToken();

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmdExist = new SqlCommand(sqlExist, con);
            SqlCommand cmdUpdate = new SqlCommand(sqlUpdate, con);

            cmdExist.Parameters.AddWithValue("@email", email);
            cmdUpdate.Parameters.AddWithValue("@token", token);

            con.Open();
            int userId = (int)cmdExist.ExecuteScalar();
            int count = 0;
            if (userId > 0)
            {
                cmdUpdate.Parameters.AddWithValue("@userId", userId);
                count = cmdUpdate.ExecuteNonQuery();
            }
            con.Close();

            if(count > 0)
            {
                string host = HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/page/resetPassword.aspx?token=" + token;
                sendEmail(email, host);

                var link = "forgetPassword.aspx?status=pending";
                Response.Redirect(link);
            }
            else
            {
                Response.Redirect("forgetPassword.aspx?status=failed");
            }

        }

        protected string generateToken()
        {
            byte[] salt = new byte[128 / 8];
            using (var rngCsp = new RNGCryptoServiceProvider())
            {
                rngCsp.GetNonZeroBytes(salt);
            }
            string token = Convert.ToBase64String(salt).Replace('+', 'p');

            return token;
        }

        protected void sendEmail(string toEmail, string verifiedLink)
        {
            string from = "artworldstudio6@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, toEmail);

            string mailbody = "Click the link to reset password " + verifiedLink;
            message.Subject = "Artworld Studio Password Reset";
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