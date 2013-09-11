<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>Submitted Applications</h1>
    </hgroup>
    <br />

    <div>
        <asp:GridView ID="grvDeptUser" runat="server" AutoGenerateColumns="False" DataKeyNames="USCID" DataSourceID="dsDeptUser" Height="100px" Width="505px">
            <Columns>
                <asp:BoundField DataField="USCID" HeaderText="USCID" ReadOnly="True" SortExpression="USCID" />
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Resume" HeaderText="Resume" SortExpression="Resume" />
                <asp:BoundField DataField="Major" HeaderText="Major" SortExpression="Major" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnExportToExcelDeptUser" runat="server" CausesValidation="False" OnClick="btnExportToExcelDeptUser_Click" Text="Export To Excel" />
        <asp:SqlDataSource ID="dsDeptUser" runat="server" 
           ConnectionString ="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
        <asp:GridView ID="grvAdmin" runat="server" AutoGenerateColumns="False" DataKeyNames="USCID" DataSourceID="dsAdmin" Height="100px" Width="505px">
            <Columns>
                <asp:BoundField DataField="USCID" HeaderText="USCID" ReadOnly="True" SortExpression="USCID" />
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Resume" HeaderText="Resume" SortExpression="Resume" />
                <asp:BoundField DataField="Major" HeaderText="Major" SortExpression="Major" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnExportToExcelAdmin" runat="server" CausesValidation="False" Text="Export To Excel" />
        <asp:SqlDataSource ID="dsAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
        <br />
    </div>
</asp:Content>