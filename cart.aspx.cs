using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace ArtWorld_Web.page
{
    public partial class cart : Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void selectedArt(object sender, EventArgs e)
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
            Label1.Text = "SELECT VALUE : <b>" + value.Trim(',', ' ') + "</b>";
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            string cartId = (item.FindControl("cbhf") as HiddenField).Value;

            string sql = "DELETE FROM Carts WHERE cartId = @cartId";


            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@cartId", cartId);

            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("cart.aspx");
        }

    

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;

            string cartId = (item.FindControl("cbhf") as HiddenField).Value;
            
            string qty = (item.FindControl("lblQty") as Label).Text;
            //string dateCreated = DateTime.Now.ToString("yyyy-MM-dd h:m:s");

            //string sql = "UPDATE Carts SET qty=@qty, dateCreated=@dateCreated WHERE cartId =@cartId";
 

            string sql = "UPDATE Carts SET qty=@qty WHERE cartId =@cartId";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("cartId", cartId);
            cmd.Parameters.AddWithValue("@qty", qty);
            //cmd.Parameters.AddWithValue("@dateCreated", dateCreated);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        
            //Response.Redirect("cart.aspx");
        }


    }
}