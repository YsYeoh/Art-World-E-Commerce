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
    public partial class updateArt : System.Web.UI.Page
    {
       
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                bool found = false;

                string id = gVar.updateArtId;
                string sql = "SELECT * FROM Arts WHERE artId = @artId";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@artId", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    found = true;
                    txtArtName.Text = (string)dr[1];
                    ddlArtGallery.SelectedValue = dr[7].ToString();
                    txtArtDescription.Text = (dr[2] == DBNull.Value) ? string.Empty : dr[2].ToString();
                    txtStockNumber.Text = dr[4].ToString();
                    txtArtPrice.Text = dr[3].ToString();
                    imgPreview.ImageUrl = dr[8].ToString();
                    ddlArtCategory.SelectedValue = dr[9].ToString();
                }

                con.Close();
                dr.Close();

                

                if (!found)
                {
                    Response.Redirect("artishArt.aspx");
                }
            }



        }

        protected void btnUpdateArt_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string id = gVar.updateArtId;
                string name = txtArtName.Text;
                string gallery = ddlArtGallery.SelectedValue.ToString();
                string description = txtArtDescription.Text;
                string stock = txtStockNumber.Text;
                string price = txtArtPrice.Text;
                ////////////////////
                string owner = "3";
                string createdDate = DateTime.Now.ToString("yyyy-MM-dd h:m:s");
                string category = ddlArtCategory.SelectedValue.ToString();
                


                string sql = @"UPDATE Arts SET name=@name, description=@description, price=@price, stock=@stock, 
                    createdDate=@createdDate, owner=@owner, gallery=@gallery, imgPath=@imgPath, category=@category WHERE artId=@id";

                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand(sql, con);
                if (fudArtImage.HasFile)
                {
                    string imgName = Path.GetFileName(fudArtImage.FileName);
                    fudArtImage.SaveAs(Server.MapPath("~/artImage/" + imgName));
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
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@stock", stock);
                cmd.Parameters.AddWithValue("@createdDate", createdDate);
                cmd.Parameters.AddWithValue("@owner", owner);
                cmd.Parameters.AddWithValue("@gallery", gallery);
                cmd.Parameters.AddWithValue("@category", category);

                con.Open();

                int count = cmd.ExecuteNonQuery();


                con.Close();

                if (count > 0)
                {
                    gVar.galleryId = ddlArtGallery.SelectedValue;
                    Response.Redirect("artistArt.aspx");
                }


            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            
                
                Response.Redirect("artistArt.aspx");



        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string id = gVar.updateArtId;

                string sql = @"DELETE FROM Arts WHERE artId=@artId";

                SqlConnection con = new SqlConnection(cs);

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@artId", id);
                

                con.Open();

                int count = cmd.ExecuteNonQuery();

                con.Close();


                if (count > 0)
                {
                    
                    Server.Transfer("artistArt.aspx");
                }

                
                
            
            }
        }
    }
}