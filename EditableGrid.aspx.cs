using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditableGrid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ShowGrid();

    }

    protected void ShowGrid()
    {
        DAL dal = new DAL();
        dal.IsProcedureCall = false;
        DataTable dtdesig = dal.GetTable("select * from designationmaster");
        if (ViewState["dtdesig"] == null)
            ViewState.Add("dtdesig", dtdesig);
        else
            ViewState["dtdesig"] = dtdesig;

        dal.AddParameter("employeeid", "0");
        dal.AddParameter("action", "select");
        dal.IsProcedureCall = true;
        DataTable dt = dal.GetTable("pr_employeemaster");

        if (ViewState["data"] == null)
            ViewState.Add("data", dt);
        else
            ViewState["data"] = dt;
        grdEmp.DataSource = dt;
        grdEmp.DataBind();
    }



    //protected void chkall_CheckedChanged(object sender, EventArgs e)
    //{
    //    CheckBox chkall = (CheckBox)grdEmp.HeaderRow.FindControl("chkall");
    //    for (int i = 0; i < grdEmp.Rows.Count; i++)
    //    {
    //        CheckBox chkisactive = (CheckBox)grdEmp.Rows[i].FindControl("chkisactive");
    //        chkisactive.Checked = chkall.Checked;
    //    }
    //}



    protected void grdEmp_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddldesignation = (DropDownList)e.Row.FindControl("ddldesignation");
            DataTable dtDesig = (DataTable)ViewState["datadesig"];
            ddldesignation.DataSource = dtDesig;
            ddldesignation.DataTextField = "designation";
            ddldesignation.DataValueField = "designationid";
            if(e.Row.DataItem!=null)
                ddldesignation.SelectedValue=(((System.Data.DataRowView)e.Row.DataItem).Row.ItemArray
                    [2]).ToString();
            e.Row.Attributes.Add("onkeyup", "CalculateHTotal(this);");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grdEmp.Rows.Count; i++)
        {
            CheckBox chkSelect = (CheckBox)grdEmp.Rows[i].FindControl("chkselect");
            if (chkSelect.Checked)
            {
                TextBox txtempid = (TextBox)grdEmp.Rows[i].FindControl("txtempid");
                TextBox txtempname = (TextBox)grdEmp.Rows[i].FindControl("txtempname");
                DropDownList ddldesignation = (DropDownList)grdEmp.Rows[i].FindControl("ddldesignation");
                TextBox txtgrossalary = (TextBox)grdEmp.Rows[i].FindControl("txtgrossalary");
                TextBox txtdeductions = (TextBox)grdEmp.Rows[i].FindControl("txtdeductions");
                TextBox txtnetsalary = (TextBox)grdEmp.Rows[i].FindControl("txtnetsalary");
                CheckBox chkisactive = (CheckBox)grdEmp.Rows[i].FindControl("chkisactive");
                DAL dal = new DAL();
                dal.AddParameter("employeeid", txtempid.Text);
                dal.AddParameter("employeename", txtempname.Text);
                dal.AddParameter("designationid", ddldesignation.SelectedValue);
                dal.AddParameter("grosssalary", txtgrossalary.Text);
                dal.AddParameter("deductions", txtdeductions.Text);
                dal.AddParameter("netsalary", txtnetsalary.Text);
                dal.AddParameter("isactive", chkisactive.Checked == true ? "Y" : "N");

                HiddenField hdnemployeeid = (HiddenField)grdEmp.Rows[i].FindControl("hdnemployeeid");
                if(hdnemployeeid.Value=="0")
                dal.AddParameter("action", "insert");
                else
                    dal.AddParameter("action", "update");

                dal.IsProcedureCall = true;
                int result = dal.ExecuteQuery("pr_employeemaster");

            }
        }
        ShowGrid();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < grdEmp.Rows.Count; i++)
        {
            CheckBox chkSelect = (CheckBox)grdEmp.Rows[i].FindControl("chkselect");
            if (chkSelect.Checked)
            {
                TextBox txtempid = (TextBox)grdEmp.Rows[i].FindControl("txtempid");
                DAL dal = new DAL();
                dal.AddParameter("employeeid", txtempid.Text);
                dal.AddParameter("action", "delete");
                dal.IsProcedureCall = true;
                int result = dal.ExecuteQuery("pr_employeemaster");


            }
        }
        ShowGrid();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["data"];
        DataRow rw = dt.NewRow();
        rw["employeeid"] = 0;
        rw["designationid"] = 1;
        dt.Rows.Add(rw);
        grdEmp.DataSource = dt;
        grdEmp.DataBind();
    }
}