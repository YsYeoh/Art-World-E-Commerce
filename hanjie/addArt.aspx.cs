using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace ArtWorld_Web.page
{
    public partial class addArt : System.Web.UI.Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string id = gVar.galleryId;

                ddlArtGallery.SelectedValue = id.ToString();

            }
        }

        protected void btnAddArt_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtArtName.Text;
                string gallery = ddlArtGallery.SelectedValue.ToString();
                string description = txtArtDescription.Text;
                string stock = txtStockNumber.Text;
                string price = txtArtPrice.Text;
                ////////////////////
                string owner = "3";
                string createdDate = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
                string imgName = Path.GetFileName(fudArtImage.FileName);
                fudArtImage.SaveAs(Server.MapPath("~/artImage/" + imgName));
                string category = ddlArtCategory.SelectedValue.ToString();

                string sql = @"INSERT INTO Arts (name,description,  price, stock, 
                    createdDate, owner, gallery, imgPath, category) VALUES (@name,@description, @price, @stock, 
                    @createdDate, @owner, @gallery, @imgPath, @category)";

                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@stock", stock);
                cmd.Parameters.AddWithValue("@createdDate", createdDate);
                cmd.Parameters.AddWithValue("@owner", owner);
                cmd.Parameters.AddWithValue("@gallery", gallery);
                cmd.Parameters.AddWithValue("@imgPath", "~/artImage/" + imgName);
                cmd.Parameters.AddWithValue("@category", category);

                con.Open();

                int count = cmd.ExecuteNonQuery();


                con.Close();

                if (count > 0)
                {
                    gVar.galleryId = gallery;
                    Response.Redirect("artistArt.aspx");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

            
            Response.Redirect("artistArt.aspx");
        }
    }
}