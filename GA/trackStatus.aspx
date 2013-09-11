<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="trackStatus.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
        <h2>Track your application</h2>
    </hgroup>

    <article>
        <p>        
            <asp:TextBox ID="txtTrack" runat="server" Width="249px"></asp:TextBox>
&nbsp;<asp:Button ID="btnTrack" runat="server" Height="35px" Text="Track" OnClick="btnTrack_Click" />
            <br />
            <asp:RequiredFieldValidator ID="rfvTrackingNumber" runat="server" ControlToValidate="txtTrack" ErrorMessage="*Please enter the tracking number" ForeColor="Red" ToolTip="Enter the tracking number">*Please enter the tracking number</asp:RequiredFieldValidator>
        </p>

        <p>

            <asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

        </p>
    </article>

    </asp:Content>