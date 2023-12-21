using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Repeater : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ShowGrid();
    }
    protected void ShowGrid()
    {
        DAL dal = new DAL();

        dal.ClearParameters();
        dal.AddParameter("employeeid", "0");
        dal.AddParameter("action", "select");
        dal.IsProcedureCall = true;
        DataTable dt = dal.GetTable("pr_employeemaster");

        rpt.DataSource = dt;
        rpt.DataBind();
    }
}