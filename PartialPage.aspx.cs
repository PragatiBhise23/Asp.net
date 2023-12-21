using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PartialPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void txt_pnl_1_1_TextChanged(object sender, EventArgs e)
    {
        txt_pnl_1_2.Text = txt_pnl_1_1.Text;
        txt_pnl_2_2.Text = txt_pnl_1_1.Text;
    }



    protected void btn_pnl_1_1_Click(object sender, EventArgs e)
    {
        lbl_pnl_1.Text = "Panel One Label Updated";
        lbl_pnl_2.Text= "Panel Two Label Updated";
    }

  

    protected void btn_pnl_2_1_Click(object sender, EventArgs e)
    {
        lbl_pnl_1.Text = "Panel One Label Updated";
        lbl_pnl_2.Text = "Panel Two Label Updated";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Write(txt_pnl_1_1.Text + " " + txt_pnl_1_2.Text + " " + txt_pnl_2_1.Text + 
            " " + txt_pnl_2_2.Text);

    }

   
}