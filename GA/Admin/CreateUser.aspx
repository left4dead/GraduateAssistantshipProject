<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="Admin_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    <asp:HyperLink ID="refHome" runat="server" NavigateUrl="~/Admin/AdminUser.aspx">Home</asp:HyperLink>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:CreateUserWizard ID="CreateUser" runat="server" OnCreatedUser="CreateUser_CreatedUser" DisableCreatedUser="True" OnCreatingUser="CreateUser_CreatingUser" Height="383px" Width="634px">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" />
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
    <br />
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <br />
    <asp:HyperLink ID="refAddMoreUser" runat="server">Add more users</asp:HyperLink>
</asp:Content>

