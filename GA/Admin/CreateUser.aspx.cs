using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Admin_CreateUser : System.Web.UI.Page
{
    const string passwordQuestion = "What is your favorite color?";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateUser.Question = passwordQuestion;
            lblResult.Visible = false;
            refAddMoreUser.Visible = false;
        }
    }
    protected void CreateUser_CreatedUser(object sender, EventArgs e)
    {
    }
    protected void CreateUser_CreatingUser(object sender, LoginCancelEventArgs e)
    {
        CreateUser.Visible = false;
        lblResult.Visible = true;
        refAddMoreUser.Visible = true;
        MembershipCreateStatus createStatus;

        MembershipUser newUser = Membership.CreateUser(CreateUser.UserName, CreateUser.Password, CreateUser.Email, passwordQuestion, CreateUser.Answer, true, out createStatus);
        switch (createStatus)
        {
            case MembershipCreateStatus.Success:
                lblResult.Text = "The user account was successfully created!";
                break;
            case MembershipCreateStatus.DuplicateUserName:
                lblResult.Text = "There already exists a user with this username.";
                break;

            case MembershipCreateStatus.DuplicateEmail:
                lblResult.Text = "There already exists a user with this email address.";
                break;
            case MembershipCreateStatus.InvalidEmail:
                lblResult.Text = "There email address you provided in invalid.";
                break;
            case MembershipCreateStatus.InvalidAnswer:
                lblResult.Text = "There security answer was invalid. User profile is not created.";
                break;
            case MembershipCreateStatus.InvalidPassword:
                lblResult.Text = "The password you provided is invalid. It must be seven characters long and have at least one non-alphanumeric character.";

                break;
            default:
                lblResult.Text = "There was an unknown error; the user account was NOT created.";
                break;
        }
    }
}