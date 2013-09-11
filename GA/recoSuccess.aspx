<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="recoSuccess.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>Recommendation</h1>
    </hgroup>
    <br />
    <asp:Label ID="lblRecoSuccess" runat="server"></asp:Label>

    <div>
        <br />
    </div>
</asp:Content>