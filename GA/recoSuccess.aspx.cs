using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string studentName = Request.QueryString.GetValues("name")[0];
        studentName = studentName.Replace('+',' ');
        lblRecoSuccess.Text = "Your recommendation for " + studentName + " has been submitted. Thank you for your response!!!";
        lblRecoSuccess.Visible = true;
        lblRecoSuccess.Enabled = true;
    }
}