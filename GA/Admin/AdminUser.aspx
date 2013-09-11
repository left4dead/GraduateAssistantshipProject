<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminUser.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    <asp:HyperLink ID="refHome" runat="server" NavigateUrl="~/Admin/AdminUser.aspx">Home</asp:HyperLink>
&nbsp;
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:HyperLink ID="refManageUsers" runat="server" Font-Size="Large" NavigateUrl="~/Admin/ManageUsers.aspx" ForeColor="Blue">Manage Users</asp:HyperLink>
&nbsp;<asp:HyperLink ID="refViewApplications" runat="server" Font-Size="Large" NavigateUrl="~/Admin/ViewApplications.aspx" ForeColor="Blue">View Applications</asp:HyperLink>
&nbsp;
</asp:Content>

