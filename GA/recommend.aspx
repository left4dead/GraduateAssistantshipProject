<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="recommend.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>Recommendation</h1>
    </hgroup>

    <div>
        <asp:TextBox ID="txtRecommendation" runat="server" Height="480px" Width="640px" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="rfvReco" runat="server" ControlToValidate="txtRecommendation" ErrorMessage="*The recommendation can not be left blank" ForeColor="Red">*The recommendation can not be left blank</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblRecoText" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:Button ID="btnSubmitReco" runat="server" Text="Submit" OnClick="btnSubmitReco_Click" />
        <asp:Button ID="btnClearReco" runat="server" CausesValidation="False" OnClick="btnClearReco_Click" Text="Clear" />
    </div>
</asp:Content>