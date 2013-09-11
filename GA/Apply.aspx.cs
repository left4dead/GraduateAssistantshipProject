using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GADataSetTableAdapters;
using System.Data;
using System.Net.Mail;
using System.IO;

public partial class _Default : Page
{
    string resumePath;
    int newAppID;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected bool IsPDF(string filePath)
    {
        bool isPDF = false;
        try
        {
            FileStream fs = new FileStream(filePath, FileMode.Open);
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes(4);
            br.Close();
            fs.Close();
            if (bytes[0] == 0x25 && bytes[1] == 0x50 && bytes[2] == 0x44 && bytes[3] == 0x46)
                isPDF = true;

            return isPDF;
        }
        catch
        {
            Response.Write("<script>alert('Error while reading the file. Please try again!!!')</script>");
            return false;
        }
    }

    protected bool IsDoc(string filePath)
    {
        bool isDoc = false;
        try
        {
            FileStream fs = new FileStream(filePath, FileMode.Open);
            BinaryReader br = new BinaryReader(fs);
            Byte[] bytes = br.ReadBytes(8);
            br.Close();
            fs.Close();
            if (bytes[0] == 0x50 && bytes[1] == 0x4B && bytes[2] == 0x03 && bytes[3] == 0x04 && bytes[4] == 14 && bytes[5] == 0x00 && bytes[6] == 0x06 && bytes[7] == 0x00)
                isDoc = true;

            if (bytes[0] == 0xD0 && bytes[1] == 0xCF && bytes[2] == 0x11 && bytes[3] == 0xE0 && bytes[4] == 0xA1 && bytes[5] == 0xB1 && bytes[6] == 0x1A && bytes[7] == 0xE1)
                isDoc = true;

            return isDoc;
        }
        catch
        {
            Response.Write("<script>alert('Error while reading the file. Please try again!!!')</script>");
            return false;
        }
    }

    protected void ApplicationWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        try
        {
            StudentTableAdapter sta = new StudentTableAdapter();
            newAppID = Convert.ToInt32(sta.NextAppID())+1;
            string ext = Path.GetExtension(Resume.PostedFile.FileName).ToLower();
            resumePath = Server.MapPath("App_Data\\Applications\\" + newAppID.ToString());
            System.IO.Directory.CreateDirectory(resumePath);
            resumePath += "\\" + LastName.Text + "_" + FirstName.Text + ext;
            Resume.SaveAs(resumePath);

            if (Resume.HasFile)
            {
                bool isValid = false;
                
                if (Resume.PostedFile.ContentLength / 1024 < 500)
                {
                    switch (ext)
                    {
                        case ".pdf":
                            isValid = IsPDF(resumePath);
                            break;
                        case ".doc":
                            isValid = IsDoc(resumePath);
                            break;
                        case ".docx":
                            isValid = IsDoc(resumePath);
                            break;
                    }

                    if (isValid)
                    {
                        //resumePath += "\\" + LastName.Text + "_" + FirstName.Text + ext;
                        //Resume.SaveAs(resumePath);
                    }
                    else
                    {
                        Response.Write("<script>alert('The file entered is not in valid format. Please try again!!!')</script>");
                        return;
                    }
                }
                else
                {
                    Response.Write("<script>alert('The file entered is not in valid format. Please try again!!!')</script>");
                    return;
                }
            }
            else
            {
                Response.Write("<script>alert('The file entered is not in valid format. Please try again!!!')</script>");
                return;
            }

            sta.InsertQuery(USCID.Text, FirstName.Text, LastName.Text, Email.Text, resumePath, Major.SelectedValue.ToString());
            string randomString = System.Guid.NewGuid().ToString().Replace("-", string.Empty);
            RecoTableAdapter rta = new RecoTableAdapter();
            rta.InsertQuery(R1Name.Text, R1Email.Text, randomString, false, newAppID);
            SendEmail(R1Email.Text, "Scholarship Application Recommendation Request",
            "Dear Mr. " + R1Name.Text + "," + System.Environment.NewLine +
            "We are contacting you because Mr. "+FirstName.Text+" "+LastName.Text+" has applied for scholarship to our department and you have been indicated as a recommender."+System.Environment.NewLine+
            "You are requested to recommend the applicant using the following link: " + Request.Url.GetLeftPart(UriPartial.Authority) + Page.ResolveUrl("recommend.aspx?id=" + randomString) +
            System.Environment.NewLine +
            "Thank you" + System.Environment.NewLine +
            Major.SelectedItem.Text + " Department");

            randomString = System.Guid.NewGuid().ToString().Replace("-", string.Empty);
            rta.InsertQuery(R2Name.Text, R2Email.Text, randomString, false, newAppID);
            SendEmail(R2Email.Text, "Scholarship Application Recommendation Request",
            "Dear Mr. " + R2Name.Text + "," + System.Environment.NewLine +
            "We are contacting you because Mr. " + FirstName.Text + " " + LastName.Text + " has applied for scholarship to our department and you have been indicated as a recommender." + System.Environment.NewLine +
            "You are requested to recommend the applicant using the following link: " + Request.Url.GetLeftPart(UriPartial.Authority) + Page.ResolveUrl("recommend.aspx?id=" + randomString) +
            System.Environment.NewLine +
            "Thank you" + System.Environment.NewLine +
            Major.SelectedItem.Text + " Department");

            SendEmail(Email.Text, "Scholarship Application Submitted",
                "Dear Mr. " + LastName.Text + "," + System.Environment.NewLine +
                "You have successfully applied for scholarship to " + Major.SelectedItem.Text + " Department" + System.Environment.NewLine +
                "Your application is under review. You will be notified once final decision is made." + System.Environment.NewLine +
                "You can check your status at " + Request.Url.GetLeftPart(UriPartial.Authority) + Page.ResolveUrl("trackStatus.aspx") + ". " +
                 "Your ApplicationID is: " + newAppID + System.Environment.NewLine +
                System.Environment.NewLine +
                "Thank you" + System.Environment.NewLine +
                Major.SelectedItem.Text + " Department");
        }
        catch (Exception exception)
        {
            Response.Write(exception.ToString());
            //Response.Write("<script>alert('Error saving data. Try again.')</script>");
            //Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
    public void SendEmail(String strTo, String Subject, String Body)
    {

        MailMessage msg = new MailMessage();

        msg.To.Add(strTo); //from argument
        msg.Subject = Subject; //from argument

        msg.Body = Body; //from database
        SmtpClient smtp = new SmtpClient();
        smtp.Send(msg); //send email out

        msg.Dispose(); //get rid of the object

    }
}