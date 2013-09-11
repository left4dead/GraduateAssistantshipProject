using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        return;
    }

    protected void btnExportToExcelDeptUser_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "GridViewExport_DeptUser.xls"));
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        grvDeptUser.AllowPaging = false;
        grvDeptUser.DataBind();
        grvDeptUser.HeaderRow.Style.Add("background-color", "#FFFFFF");
        grvDeptUser.RenderControl(htw);
        Response.Write(sw.ToString());
        Response.End();
    }

}