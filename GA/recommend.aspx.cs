using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using GADataSetTableAdapters;

public partial class About : Page
{
    RecoTableAdapter rta;
    bool status = false;
    string appID;
    string recoID;
    string name;
    string recoPath = null;
    String stFirstName, stLastName;
    string link;

    protected void Page_Load(object sender, EventArgs e)
    {
            string[] queryString = Request.QueryString.GetValues("id");
            link = queryString[0];

            if (queryString == null)
                Response.Redirect("PageNotFound.aspx");

            rta = new RecoTableAdapter();

            status = bool.Parse(rta.GetRecoStatusByLink(queryString[0]).ToString());
            appID = rta.GetAppIDByLink(queryString[0]).ToString();
            name = rta.GetRecoNameByLink(queryString[0]).ToString();
            recoID = rta.GetRecoIDByLink(queryString[0]).ToString();

            //It means recommendation has been received and link is Invalid now
            if (status == true)
                Response.Redirect("PageNotFound.aspx");

            recoPath = Server.MapPath("App_Data\\Applications\\" + appID);

            if (!Directory.Exists(recoPath))
                Directory.CreateDirectory("App_Data\\Applications\\" + appID);

            recoPath = Server.MapPath("App_Data\\Applications\\" + appID + "\\" + recoID + "_" + name + ".txt");
    }

    protected void btnClearReco_Click(object sender, EventArgs e)
    {
        txtRecommendation.Text = string.Empty;
    }

    protected void btnSubmitReco_Click(object sender, EventArgs e)
    {
        try
        {
            string[] words = txtRecommendation.Text.Split(',', ' ', '.');

            if (words.Length > 750)
                lblRecoText.Text = "*You can enter only 750 words";

            else
            {
                if (status == false)
                    status = true;

                rta.UpdateStatus(status, recoPath, int.Parse(recoID), int.Parse(appID));

                using (StreamWriter writer = new StreamWriter(recoPath, true)) //// true to append data to the file
                {
                    writer.WriteLine(txtRecommendation.Text);
                }

                StudentTableAdapter sta = new StudentTableAdapter();
                stFirstName = sta.GetFirstName(int.Parse(appID));
                stLastName = sta.GetLastName(int.Parse(appID));
                string url = string.Format("recoSuccess.aspx?name={0}", Server.UrlEncode(stFirstName + " " + stLastName));
                Response.Redirect(url, false);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("Exception.aspx");
        }
    }
}