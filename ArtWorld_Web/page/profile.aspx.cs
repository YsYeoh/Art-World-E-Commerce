using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ArtWorld_Web.page
{
    public partial class profile : Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
                    /*if(!(dr["locationId"] is DBNull))
                    {
                        locationId = (int)dr["locationId"];
                    }*/
                    if(!(dr["name"] is DBNull))
                    {
                        txtName.Text = (string)dr["name"];
                    }

                    if (!(dr["nickname"] is DBNull))
                    {
                        txtNickname.Text = (string)dr["nickname"];
                    }

                    if (!(dr["email"] is DBNull))
                    {
                        txtEmail.Text = (string)dr["email"];
                    }
                    if (!(dr["contact"] is DBNull))
                    {
                        txtContact.Text = (string)dr["contact"];
                    }
                    if (!(dr["birth"] is DBNull))
                    {
                        txtBirth.Text = Convert.ToDateTime(dr["birth"]).ToString("yyyy-MM-dd");
                    }
                    if (!(dr["gender"] is DBNull))
                    {
                        rblGender.SelectedValue = (string)dr["gender"];
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                int locationId = 0;
                string name = txtName.Text;
                string nickname = txtName.Text;
                string birth = txtBirth.Text;
                string contact = txtContact.Text;
                string gender = rblGender.Text;

                string address1 = txtAddress1.Text;
                string address2 = txtAddress2.Text;
                string state = selectState.Text;
                string postcode = txtPostcode.Text;
                string country = txtCountry.Text;
                string city = txtCity.Text;

                string sqlFindUser = @"SELECT location FROM Users WHERE userId=@userId";

                string sqlUpdateUser = @"UPDATE Users SET name=@name, 
                                        nickname=@nickname, birth=@birth, 
                                        contact=@contact, gender=@gender, location=@location
                                        WHERE userId=@userId";


                string sqlInsertLocation = @"INSERT INTO Locations 
                                        (address1, address2, state, postcode, country, city)  OUTPUT Inserted.locationId
                                        VALUES (@address1, @address2, @state, @postcode, @country, @city)";
                
                string sqlUpdateLocation = @"UPDATE Locations SET
                                        address1=@address1, address2=@address2, state=@state,
                                        postcode=@postcode, country=@country,
                                        city=@city WHERE locationId=@locationId";
                

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmdFindUser = new SqlCommand(sqlFindUser, con);
                SqlCommand cmdUpdateLocation = new SqlCommand(sqlUpdateLocation, con);
                SqlCommand cmdInsertLocation = new SqlCommand(sqlInsertLocation, con);
                SqlCommand cmdUpdateUser = new SqlCommand(sqlUpdateUser, con);

                cmdFindUser.Parameters.AddWithValue("@userId", 1);

                cmdUpdateLocation.Parameters.AddWithValue("@address1", address1);
                cmdUpdateLocation.Parameters.AddWithValue("@address2", address2);
                cmdUpdateLocation.Parameters.AddWithValue("@state", state);
                cmdUpdateLocation.Parameters.AddWithValue("@postcode", postcode);
                cmdUpdateLocation.Parameters.AddWithValue("@country", country);
                cmdUpdateLocation.Parameters.AddWithValue("@city", city);

                cmdInsertLocation.Parameters.AddWithValue("@address1", address1);
                cmdInsertLocation.Parameters.AddWithValue("@address2", address2);
                cmdInsertLocation.Parameters.AddWithValue("@state", state);
                cmdInsertLocation.Parameters.AddWithValue("@postcode", postcode);
                cmdInsertLocation.Parameters.AddWithValue("@country", country);
                cmdInsertLocation.Parameters.AddWithValue("@city", city);

                cmdUpdateUser.Parameters.AddWithValue("@name", name);
                cmdUpdateUser.Parameters.AddWithValue("@nickname", nickname);
                cmdUpdateUser.Parameters.AddWithValue("@contact", contact);
                cmdUpdateUser.Parameters.AddWithValue("@gender", gender);
                cmdUpdateUser.Parameters.AddWithValue("@birth", birth);

                //UserId
                cmdUpdateUser.Parameters.AddWithValue("@userId", 1);

                int updateUserStatus = 0;
                int updateLocationStatus = 0;
                con.Open();

                if(cmdFindUser.ExecuteScalar() is DBNull)
                {
                    locationId = (int)cmdInsertLocation.ExecuteScalar();
                    updateLocationStatus = 1;
                }
                else
                {
                    locationId = (int)cmdFindUser.ExecuteScalar();
                    cmdUpdateLocation.Parameters.AddWithValue("@locationId", locationId);
                    updateLocationStatus = cmdUpdateLocation.ExecuteNonQuery();
                }
                if(updateLocationStatus > 0)
                {
                    cmdUpdateUser.Parameters.AddWithValue("@location", locationId);
                    updateUserStatus = cmdUpdateUser.ExecuteNonQuery();
                }
                

                con.Close();

                if (updateUserStatus > 0 && updateLocationStatus > 0)
                {
                    Response.Redirect("profile.aspx?status=success");
                }
                else
                {
                    Response.Redirect("profile.aspx?status=unsuccess");
                }
             
            }
        }
    }
}