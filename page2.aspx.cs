using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    txtuser.Text = Session["UserId"].ToString();
        //    txtpass.Text = Session["UserPass"].ToString();
        //}

        if(!IsPostBack)
        {
            if(Request.QueryString.Count>0)
            {
                byte[] data=Convert.FromBase64String(Request.QueryString[0]);
                string decodedString=Encoding.UTF8.GetString(data);
                txtuser.Text= decodedString.Split('#')[0];
                txtpass.Text = decodedString.Split('#')[1];
            }
        }

    }

    protected void btnprevious_Click(object sender, EventArgs e)
    {
        //Session["UserId"] = txtuser.Text;
        //Session["UserPass"] = txtpass.Text;
       // Response.Redirect("page1.aspx");
        Response.Redirect("page1.aspx?UID="+txtuser.Text+"&Pass="+txtpass.Text);
    }
}