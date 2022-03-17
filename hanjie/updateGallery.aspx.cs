using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace ArtWorld_Web.page
{

    
    public partial class updateGallery : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bool found = false;

                string id = gVar.galleryId;

                string sql = "SELECT * FROM Galleries WHERE galleryId = @galleryId";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@galleryId", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    txtGalleryName.Text = (string)dr[1];
                    txtGalleryDescription.Text = (dr[2] == DBNull.Value) ? string.Empty : dr[2].ToString();
                    imgPreview.ImageUrl = dr[5].ToString();
                }

                con.Close();
                dr.Close();

                if (!found)
                {
                    Response.Redirect("artishGallery.aspx");
                }


            }



        }

        protected void btnUpdateGallery_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string id = gVar.galleryId;
                string name = txtGalleryName.Text;
                string description = txtGalleryDescription.Text;

                ////////////////////
                string owner = "3";
                string createdDate = DateTime.Now.ToString("yyyy-MM-dd h:m:s");

                string sql = @"UPDATE Galleries SET name=@name, description=@description, 
                    createdDate=@createdDate, owner=@owner, imgPath=@imgPath WHERE galleryId=@id";

                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand(sql, con);

                if (fudGalleryImage.HasFile)
                {
                    string imgName = Path.GetFileName(fudGalleryImage.FileName);
                    fudGalleryImage.SaveAs(Server.MapPath("~/artImage/" + imgName));
                    cmd.Parameters.AddWithValue("@imgPath", "~/artImage/" + imgName);
                }
                else
                {
                    string imgUrl = imgPreview.ImageUrl;
                    cmd.Parameters.AddWithValue("@imgPath", imgUrl);
                }

                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@createdDate", createdDate);
                cmd.Parameters.AddWithValue("@owner", owner);

                con.Open();

                int count = cmd.ExecuteNonQuery();


                con.Close();

                if (count > 0)
                {
                    Response.Redirect("artistGallery.aspx");
                }
            }
        }


        protected void btnDeleteGallery_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string id = gVar.galleryId;
                string sql = @"DELETE FROM Galleries WHERE galleryId=@galleryId";
                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@galleryId", id);

                con.Open();

                int count = cmd.ExecuteNonQuery();

                con.Close();


                if (count > 0)
                {

                    Server.Transfer("artistGallery.aspx");
                }

            }
        }



            protected void btnCancel_Click(object sender, EventArgs e)
        {
            Server.Transfer("artistGallery.aspx");
        }
    }
}