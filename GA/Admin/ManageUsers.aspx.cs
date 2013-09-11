using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Admin_ManageUsers : System.Web.UI.Page
{
    MembershipUser m;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void grdUserAccounts_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void grdUserAccounts_RowEditing(object sender, GridViewEditEventArgs e)
    {
    }
    protected void grdUserAccounts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        int index = grdUserAccounts.EditIndex;
        m = Membership.GetUser(grdUserAccounts.Rows[index].Cells[2].Text);
        if (m != null)
        {
            m.Email = grdUserAccounts.Rows[index].Cells[3].Text;
            m.LastLoginDate = Convert.ToDateTime(grdUserAccounts.Rows[index].Cells[4].Text);
            Membership.UpdateUser(m);
        }

    }
}