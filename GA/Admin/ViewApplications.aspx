<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ViewApplications.aspx.cs" Inherits="Admin_ViewApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    <asp:HyperLink ID="refHome" runat="server" NavigateUrl="~/Admin/AdminUser.aspx">Home</asp:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="appid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="uscid" HeaderText="uscid" SortExpression="uscid" />
            <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
            <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:hyperlinkfield Text="Resume" DataNavigateUrlFields="resume" HeaderText="resume" SortExpression="resume" />
            <asp:hyperlinkfield Text="Reco" DataNavigateUrlFields="reco" HeaderText="reco" SortExpression="reco" />
            <asp:BoundField DataField="major" HeaderText="major" SortExpression="major" />
            <asp:BoundField DataField="appid" HeaderText="appid" InsertVisible="False" ReadOnly="True" SortExpression="appid" />
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
       ConnectionString ="<%$ ConnectionStrings:aspnet-GA-20130209202047ConnectionString %>" SelectCommand="select uscid,first_name,last_name,email,resume,r.reco,major,s.appid,s.status from student s
join reco r on r.appId = s.AppId"></asp:SqlDataSource>
</asp:Content>

