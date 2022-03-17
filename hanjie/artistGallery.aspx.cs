using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtWorld_Web.page
{
    public partial class artistGallery : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            ////////////
            gVar.userId = "3";
            SqlDataSourceGallery.FilterExpression += "owner= " + gVar.userId.ToString();
        }

        

        protected void btnAddGallery_Click(object sender, EventArgs e)
        {
            Server.Transfer("addGallery.aspx");
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            int index = gvr.RowIndex;
            string galleryid = GridViewGallery.Rows[index].Cells[0].Text;

            gVar.galleryId = galleryid;

            Response.Redirect("artistArt.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            int index = gvr.RowIndex;
            string galleryid = GridViewGallery.Rows[index].Cells[0].Text;

            gVar.galleryId = galleryid;

            Response.Redirect("updateGallery.aspx");
        }

        
    }
}