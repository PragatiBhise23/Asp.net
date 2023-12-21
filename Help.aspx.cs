using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Text;
using System.Data.SqlClient;
public partial class Help : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetHelpData(string HelpType,string WhereClause)
    {
        DAL dal = new DAL();
        dal.ClearParameters();
        dal.IsProcedureCall = false;
        StringBuilder sb = new StringBuilder();
        sb.AppendLine("<table border=\"1\" style=\"width:100%\">");
        sb.AppendLine("<tr><th>EmployeeID</th><th>EmployeeName</th></tr>");
        SqlDataReader rdr;
        if(HelpType.Contains("employee"))
        {
            rdr = dal.GetReader("select employeeid id,employeename name from employeemaster where employeename like '%" + WhereClause + "%'");
        }
        else
        {
            rdr = dal.GetReader("select designationid id,designation name from designationmaster where designation like '%" + WhereClause + "%'");
        }
        if(rdr!=null && rdr.HasRows)
        {
            while(rdr.Read())
            {
                sb.AppendFormat("<tr onclick=\"SelectRecord(this);\"><td>{0}</td><td>{1}</td></tr>",
                    rdr["id"].ToString(), rdr["name"].ToString());
            }
        }
        sb.AppendLine("</table>");
        return sb.ToString();
    }
}