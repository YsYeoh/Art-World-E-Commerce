using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtWorld_Web.page
{
    public partial class artDetails : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["artId"] ?? "";

            SqlDataSourceArts.FilterExpression += "artId=" + id.ToString();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            DataListItem item = (sender as Button).NamingContainer as DataListItem;

            string userId = "1";
            string artId = (item.FindControl("hfArtId") as HiddenField).Value;
            string qty = "1";
            string dateCreated = DateTime.Now.ToString("yyyy-MM-dd h:m:s");

            string sql = "INSERT INTO Carts(userId,artId,qty,dateCreated) VALUES (@userId,@artId,@qty,@dateCreated)";
            //string sql = "INSERT INTO Carts(userId,artId,dateCreated) VALUES (@userId,@artId,@dateCreated)";
        

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@artId", artId);
            cmd.Parameters.AddWithValue("@qty", qty);
            cmd.Parameters.AddWithValue("@dateCreated", dateCreated);

            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();

        }

        protected void btnWishList_Click(object sender, EventArgs e)
        {
            DataListItem item = (sender as Button).NamingContainer as DataListItem;

            string userId = "1";
            string artId = (item.FindControl("hfArtId") as HiddenField).Value;
            string dateCreated = DateTime.Now.ToString("yyyy-MM-dd h:m:s");

            string sql = "INSERT INTO WishLists(userId,artId,dateCreated) VALUES (@userId,@artId,@dateCreated)";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@userId", userId);
            cmd.Parameters.AddWithValue("@artId", artId);
            cmd.Parameters.AddWithValue("@dateCreated", dateCreated);

            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();
        }


        
    }
}