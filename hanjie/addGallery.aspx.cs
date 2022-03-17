using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Data.SqlClient;


namespace ArtWorld_Web
{
    public partial class addGallery : System.Web.UI.Page
    {

        string cs = Global.CS;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddGallery_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtGalleryName.Text;
                string description = txtGalleryDescription.Text;


                ////////////////////
                string owner = "3";
                string createdDate = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
                string imgName = Path.GetFileName(fudGalleryImage.FileName);
                fudGalleryImage.SaveAs(Server.MapPath("~/galleryImage/" + imgName));

                string sql = @"INSERT INTO Galleries (name,description
                    ,createdDate, owner, imgPath) VALUES (@name,@description,@createdDate,@owner, @imgPath)";

                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@createdDate", createdDate);
                cmd.Parameters.AddWithValue("@owner", owner);
                
                cmd.Parameters.AddWithValue("@imgPath", "~/galleryImage/" + imgName);

                con.Open();

                int count = cmd.ExecuteNonQuery();


                con.Close();

                if (count > 0)
                {
                    Response.Redirect("artistGallery.aspx");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("artistGallery.aspx");
        }
    }
}
