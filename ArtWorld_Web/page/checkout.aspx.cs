using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtWorld_Web.page
{
    public partial class checkout : Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindRepeater();
                QueryDefaultValue();
            }
            
        }

        private void BindRepeater()
        {
            //sql statement
            string sql = @"SELECT * FROM Arts as a, Carts as b WHERE a.artId=b.artId AND b.cartId in (2, 4, 5, 6, 7)";
            string sqlTotal = @"SELECT SUM(a.price*b.qty) as total FROM Arts as a, Carts as b WHERE a.artId=b.artId AND b.cartId in (2, 4, 5, 6, 7)";

            //establish connection
            SqlConnection con = new SqlConnection(cs);

            //sql command
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlCommand cmdTotal = new SqlCommand(sqlTotal, con);

            //open database
            con.Open();

            //execute command, return record will store in SqlDataReader
            SqlDataReader dr = cmd.ExecuteReader();

/*            double price = 0;

            if (dr.Read())
            {
                price += Convert.ToDouble(dr["price"]);
            }
            lblTtlPrice.Text = price.ToString();*/

            //data binding, pass source to data bound control
            Repeater1.DataSource = dr;
            Repeater1.DataBind();
            dr.Close();

            double total = Convert.ToDouble(cmdTotal.ExecuteScalar());

            lblTtlPrice.Text = total.ToString();

            //close database
            con.Close();
            
        }

        private void QueryDefaultValue()
        {
            string sqlFindUser = "SELECT * FROM Users as a LEFT JOIN Locations as b ON a.location = b.locationId LEFT JOIN States as c ON b.state = c.stateId WHERE a.userId = @userId";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmdFindUser = new SqlCommand(sqlFindUser, con);

            cmdFindUser.Parameters.AddWithValue("@userId", 1);
            bool exist = false;
            con.Open();
            SqlDataReader dr = cmdFindUser.ExecuteReader();
            if (dr.Read())
            {
                exist = true;
                if (!(dr["name"] is DBNull))
                {
                    txtName.Text = (string)dr["name"];
                }

                if (!(dr["email"] is DBNull))
                {
                    txtEmail.Text = (string)dr["email"];
                }
                if (!(dr["contact"] is DBNull))
                {
                    txtContact.Text = (string)dr["contact"];
                }
                if (!(dr["address1"] is DBNull))
                {
                    txtAddress1.Text = (string)dr["address1"];
                }
                if (!(dr["address2"] is DBNull))
                {
                    txtAddress2.Text = (string)dr["address2"];
                }
                if (!(dr["city"] is DBNull))
                {
                    txtCity.Text = (string)dr["city"];
                }
                if (!(dr["postcode"] is DBNull))
                {
                    txtPostcode.Text = (string)dr["postcode"];
                }
                if (!(dr["country"] is DBNull))
                {
                    txtCountry.Text = (string)dr["country"];
                }
                if (!(dr["state"] is DBNull))
                {
                    selectState.SelectedValue = Convert.ToInt32(dr["stateId"]).ToString();
                }
            }
            dr.Close();
            con.Close();
            if (!exist)
            {
                Console.WriteLine("Cannot find user");
            }
        }
    }
}