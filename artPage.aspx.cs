using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ArtWorld_Web.page
{
    public partial class artPage : System.Web.UI.Page
    {
        string cs = Global.CS;
        //string SortField;
        //SqlConnection myconnection;
        //SqlDataAdapter myda;
        //DataSet ds;
        //String strConn;
        //string SQLStmt = "Select * from Arts";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string id = Request.QueryString["galleryId"] ?? "";

                SqlDataSourceArt.FilterExpression += "gallery=" + id.ToString();

  
            }
        }
        //private void BindRepeater()
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("artId", typeof(Int32));
        //    dt.Columns.Add("name", typeof(string));


        //    dt.Rows.Add();
            
        //    DataView dvData = new DataView(dt);
        //    //Sorting Filter
        //    dvData.Sort = ViewState["Column"] + " " + ViewState["Sortorder"];
            
        //}
        protected void rptArts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {


        }

        //protected void btnCart_Click(object sender, EventArgs e)
        //{
        //    RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;


        //    string userId = "1";
        //    string artId = (item.FindControl("lblArtId") as Label).Text;
        //    string qty = "1";
        //    string dateCreated = DateTime.Now.ToString("yyyy-MM-dd h:m:s");

        //    string sql = "INSERT INTO Carts(userId,artId,qty,dateCreated) VALUES (@userId,@artId,@qty,@dateCreated)";

        //    SqlConnection con = new SqlConnection(cs);
        //    SqlCommand cmd = new SqlCommand(sql, con);

        //    cmd.Parameters.AddWithValue("@userId", userId);
        //    cmd.Parameters.AddWithValue("@artId", artId);
        //    cmd.Parameters.AddWithValue("@qty", qty);
        //    cmd.Parameters.AddWithValue("@dateCreated", dateCreated);


        //    con.Open();
        //    cmd.ExecuteNonQuery();

        //    con.Close();

        //}

        //protected void btnWishList_Click(object sender, EventArgs e)
        //{
        //    RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;


        //    string userId = "1";
        //    string artId = (item.FindControl("lblArtId") as Label).Text;
        //    string dateCreated = DateTime.Now.ToString("yyyy-MM-dd h:m:s");

        //    string sql = "INSERT INTO WishLists(userId,artId,dateCreated) VALUES (@userId,@artId,@dateCreated)";

        //    SqlConnection con = new SqlConnection(cs);
        //    SqlCommand cmd = new SqlCommand(sql, con);

        //    cmd.Parameters.AddWithValue("@userId", userId);
        //    cmd.Parameters.AddWithValue("@artId", artId);
        //    cmd.Parameters.AddWithValue("@dateCreated", dateCreated);


        //    con.Open();
        //    cmd.ExecuteNonQuery();

        //    con.Close();
        //}

   


    }
}