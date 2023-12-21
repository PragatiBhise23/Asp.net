using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frmEmployeeMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ViewState.Add("FoundFlag", false);
        ShowGrid();
    }

    protected void ShowGrid()
    {
        return;
        DAL dal=new DAL();
        dal.AddParameter("employeeid", "0");
        dal.AddParameter("action", "select");
        dal.IsProcedureCall = true;
        DataTable dt = dal.GetTable("pr_employeemaster");
        grdEmp.DataSource = dt;
        grdEmp.DataBind();
    }


    protected void btnsave_Click(object sender, EventArgs e)
    {
        DAL dal = new DAL();
        dal.AddParameter("employeeid", txtempid.Text);
        dal.AddParameter("employeename", txtempname.Text);
        dal.AddParameter("designationid", ddldesignation.SelectedValue);
        dal.AddParameter("grosssalary", txtgrossalary.Text);
        dal.AddParameter("deductions", txtdeductions.Text);
        dal.AddParameter("netsalary", txtnetsalary.Text);
        dal.AddParameter("IsActive",chkisactive.Checked  ==  true ? "Y":"N");

        if (((bool)ViewState["FoundFlag"]))
            dal.AddParameter("action", "update");
        else
            dal.AddParameter("action", "insert");
        dal.IsProcedureCall = true;
        int result = dal.ExecuteQuery("pr_employeemaster");
        if (result > 0)
            Response.Write("Record Saved Successfully");
        else
            Response.Write("Record Does not Saved");
        ShowGrid();
    }



    protected void txtempid_TextChanged(object sender, EventArgs e)
    {
        DAL dal = new DAL();
        dal.AddParameter("@employeeid", txtempid.Text);
        dal.AddParameter("@action", "select");
        dal.IsProcedureCall = true;
        SqlDataReader rdr = dal.GetReader("pr_employeemaster");
        if (rdr!= null && rdr.HasRows)
        {
            ViewState["FoundFlag"] = true;
            rdr.Read();
            txtempname.Text = rdr["employeename"].ToString();
            ddldesignation.SelectedValue = rdr["designationid"].ToString();
            txtgrossalary.Text = rdr["grosssalary"].ToString();
            txtdeductions.Text = rdr["deductions"].ToString();
            txtnetsalary.Text = rdr["netsalary"].ToString();
            chkisactive.Checked = rdr["IsActive"].ToString() == "Y" ? true : false;
        }
        else
        {
            ViewState["FoundFlag"] = false;
            txtempname.Text = "";
            ddldesignation.SelectedValue = "1";
            txtgrossalary.Text = "";
            txtdeductions.Text = "";
            txtnetsalary.Text = "";
            chkisactive.Checked = true;
        }
        txtempname.Focus();
        }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        DAL dal = new DAL();
        dal.AddParameter("@employeeid", txtempid.Text);
        dal.AddParameter("@action", "delete");
        dal.IsProcedureCall = true;
        int result = dal.ExecuteQuery("pr_employeemaster");
        if (result > 0)
            Response.Write("Record Deleted Successfully");
        else
            Response.Write("Unable to Delete Record");
        ShowGrid();
    }





    //protected void grdEmp_RowCreated(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    //{
    //    if(e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
    //    {
    //        e.Row.Attributes.Add("onclick", "ShowRecord(this);");
    //        e.Row.Attributes.Add("onmouseover", "SetColor(this,'Yellow');");
    //        e.Row.Attributes.Add("onmouseout", "SetColor(this,'White');");
    //        e.Row.Style.Add("curssor:hand;cursor:pointer;", "");
    //    }
    //   e.Row.Cells[6].Visible = false;
    //}

    //protected void chkall_CheckedChanged(object sender, EventArgs e)
    //{
    //    CheckBox chkall =(CheckBox)grdEmp.HeaderRow.FindControl("chkall");
    //    for(int i=0;i<grdEmp.Rows.Count;i++)
    //    {
    //        CheckBox chkisactive = (CheckBox)grdEmp.Rows[i].FindControl("chkisactive");
    //        chkisactive.Checked = chkall.Checked;
    //    }
    //<HeaderTemplate>
    //                            <asp:CheckBox ID = "chkall" runat="server" Text="SelectAll"
    //                                AutoPostBack="true" OnCheckedChanged="chkall_CheckedChanged"
    //                                Checked="true" Width="100px"></asp:CheckBox>
    //                         </HeaderTemplate>







    

    protected void grdEmp_RowCreated1(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onclick", "ShowRecord(this);");
                e.Row.Attributes.Add("onmouseover", "SetColor(this,'Yellow');");
                e.Row.Attributes.Add("onmouseout", "SetColor(this,'White');");
                e.Row.Style.Add("curssor:hand;cursor:pointer;", "");
            }
            //e.Row.Cells[7].Visible = false;
        }
    }
}

