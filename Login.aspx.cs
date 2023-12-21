using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Session.Clear();

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        DAL dal = new DAL();
        dal.ClearParameters();
        dal.IsProcedureCall=false;
        SqlDataReader rdr = dal.GetReader("select * from Login_User_Mar where LoginName='" +
            txtloginname.Text + "'");
        if(rdr!= null && rdr.HasRows)
        {
            rdr.Read();
            if (txtpassword.Text == rdr["LoginPassword"].ToString())
            {
                rdr.Close();
                LoadRights();
                Response.Redirect("about.aspx");
            }
            else
            {
                Response.Redirect("Invalid Password Entered");
                txtpassword.Focus();

            }
        }
        else
        {

            Response.Redirect("Invalid User Entered");
            txtloginname.Focus();

        }
        if (!rdr.IsClosed) rdr.Close();
    }
    protected void LoadRights()
    {
        List<Login_Rights_Mar> rightslist = new List<Login_Rights_Mar>();
        DAL dal = new DAL();
        dal.ClearParameters();
        dal.IsProcedureCall = false;
        SqlDataReader rdr = dal.GetReader("select * from Login_Rights_Mar where LoginName='" +
            txtloginname.Text + "'");
        if (rdr != null && rdr.HasRows)
        {
            while(rdr.Read())
            {
                Login_Rights_Mar l = new Login_Rights_Mar();
                l.LoginName = txtloginname.Text.ToLower();
                l.PageName = rdr["PageName"].ToString();
                rightslist.Add(l);
            }
        }
        rdr.Close();
        Session["UserRights"] = rightslist;
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {

    }
}