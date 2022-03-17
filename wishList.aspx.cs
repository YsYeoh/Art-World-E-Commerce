using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtWorld_Web.page
{
    public partial class wishList : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            string value = "";
            foreach (RepeaterItem item in Repeater1.Items)
            {
                CheckBox chk = item.FindControl("cbSelect") as CheckBox;
                if (chk.Checked)
                {
                    HiddenField hf = item.FindControl("cbHf") as HiddenField;
                    value += (string)hf.Value + ",";

                }
            }
            //lblWishList.Text = "WishList : <b>" + value.Trim(',', ' ') + "</b>";
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            string wishListId = (item.FindControl("cbhf") as HiddenField).Value;

            string sql = "DELETE FROM WishLists WHERE wishListId = @wishListId";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@wishListId", wishListId);

            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("wishList.aspx");
        }

    }
}