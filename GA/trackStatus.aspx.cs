using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GADataSetTableAdapters;

public partial class About : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblStatus.Visible = false;
    }

    protected void btnTrack_Click(object sender, EventArgs e)
    {
        try
        {
            lblStatus.Visible = true;
            StudentTableAdapter sta = new StudentTableAdapter();
            string status = sta.getAppStatus(int.Parse(txtTrack.Text));
        
            if (status == null)
                lblStatus.Text = "The tracking number " + txtTrack.Text + " is not registered with us. Please try to register first!!!";
            else
                lblStatus.Text = "Your current status of application is: " + status;
        }
        catch
        {
            lblStatus.Text = "Could not retrieve the application status at this time. Please try again later!!!";
        }
    }
}