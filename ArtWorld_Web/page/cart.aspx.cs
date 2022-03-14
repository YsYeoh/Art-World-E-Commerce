using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtWorld_Web.page
{
    public partial class cart : Page
    {

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
        
    }
}