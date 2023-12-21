using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if(!IsPostBack)
        //{
        //    txtuser.Text = Session["UserId"].ToString();
        //    txtpass.Text = Session["UserPass"].ToString();
        //}

    }

    protected void btnnext_Click(object sender, EventArgs e)
    {
        //Session["UserId"] = txtuser.Text;
        //Session["UserPass"] = txtpass.Text;
        // Response.Redirect("page1.aspx?UID=" + txtuser.Text + "&Pass=" + txtpass.Text);

        var base64 = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(txtuser.Text +
            "#" + txtpass.Text));
        Response.Redirect("page2.aspx?" + base64);
    }
}