using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GridViewPaging : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ShowGrid();
    }

    protected void ShowGrid()
    {
        DAL dal = new DAL();
        List<DesignationMaster> desiglist =new List<DesignationMaster>();
        dal.ClearParameters();

        dal.IsProcedureCall = false;
        SqlDataReader rdr = dal.GetReader("select * from designationmaster");
        if(rdr!=null && rdr.HasRows)
        {
            while(rdr.Read())
            {
                DesignationMaster d = new DesignationMaster();
                d.DesignationID= Convert.ToInt32(rdr["designationid"].ToString());
                d.Designation = rdr["designation"].ToString();
                desiglist.Add(d);

            }
        }
        rdr.Close();
       
            ViewState["dataDesig"] = desiglist;
        dal.ClearParameters();
        dal.AddParameter("employeeid", "0");
        dal.AddParameter("action", "select");
        dal.IsProcedureCall = true;
        DataTable dt = dal.GetTable("pr_employeemaster");

        grdEmp.DataSource = dt;
        grdEmp.DataBind();
        if (grdEmp.Rows.Count>0)
        {
            grdEmp.HeaderRow.Cells[0].Text = "EmpID";
            grdEmp.HeaderRow.Cells[1].Text = "EmpName";
            grdEmp.HeaderRow.Cells[2].Text = "Designation";
            
        }

    }



    protected void grdEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdEmp.PageIndex = e.NewPageIndex;
        ShowGrid();
    }

    protected void grdEmp_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[7].Visible = false;
        //    DropDownList ddldesignation = (DropDownList)e.Row.FindControl("ddldesignation");
        //    DataTable dtDesig = (DataTable)ViewState["dataDesig"];
        //    ddldesignation.DataSource = dtDesig;
        //    ddldesignation.DataTextField = "designation";
        //    ddldesignation.DataValueField = "designationid";
        //    if (e.Row.DataItem != null)
        //        ddldesignation.SelectedValue = (((System.Data.DataRowView)e.Row.DataItem).Row.ItemArray
        //            [2]).ToString();
        //    e.Row.Attributes.Add("onkeyup", "CalculateHTotal(this);");
        //
        //
       }
    }

    protected void grdEmp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            List<DesignationMaster> desiglist = (List<DesignationMaster>)ViewState["dataDesig"];
            string DesigID = (((System.Data.DataRowView)e.Row.DataItem).Row.ItemArray[2]).ToString();
            e.Row.Cells[2].Text = desiglist.Find(x => x.DesignationID.ToString() == DesigID).Designation;
        }
    }

    [Serializable]
    public class DesignationMaster
    {
        public int DesignationID { get; set; }
        public string Designation { get; set; }
    }
}