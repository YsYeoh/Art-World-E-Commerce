using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ArtWorld_Web.page
{
    public partial class artistArt : System.Web.UI.Page
    {

       

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                
               
                SqlDataSourceArt.FilterExpression += "gallery="+gVar.galleryId.ToString();

             


            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            int index = gvr.RowIndex;
            string artid = GridViewArt.Rows[index].Cells[0].Text;

            gVar.updateArtId = artid;

            Response.Redirect("updateArt.aspx");
        }



        protected void btnAddArts_Click(object sender, EventArgs e)
        {
            
            
            Response.Redirect("addArt.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("artistGallery.aspx");
        }
    }
}