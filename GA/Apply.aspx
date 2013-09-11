<%@ Page Title="Application Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Apply.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <h1 style="text-align: center">Application Form</h1>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:Wizard ID="ApplicationWizard" runat="server" DisplaySideBar="False" ActiveStepIndex="0" DisplayCancelButton="True" StartNextButtonText="Submit" CancelButtonText="Clear" OnNextButtonClick="ApplicationWizard_NextButtonClick">
        <FinishNavigationTemplate>
            <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" CausesValidation="false" />
        </FinishNavigationTemplate>
        <StartNavigationTemplate>
            <p style="text-align: left">
                <asp:Button ID="StartNextButton" runat="server" CausesValidation="true" CommandName="MoveNext" Text="Submit" ValidationGroup="ApplicationWizard" />
                <asp:Button ID="CancelButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Clear" />
            </p>
        </StartNavigationTemplate>
        <WizardSteps>
            <asp:WizardStep runat="server" StepType="Start" Title="Apply for Scholarship">
                <table>
                    <tr>
                        <td style="text-align: center" colspan="2">
                            <h3>All fields are mandatory</h3>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="FirstNameLabel" runat="server" AssociatedControlID="FirstName">First Name:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="FirstNameRequired" runat="server" ControlToValidate="FirstName" ErrorMessage="First Name is required." ToolTip="First Name is required." ValidationGroup="ApplicationWizard" ForeColor="Red">First Name is required.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="LastNameLabel" runat="server" AssociatedControlID="LastName">Last Name:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="LastName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="LastNameRequired" runat="server" ControlToValidate="LastName" ErrorMessage="Last Name is required." ToolTip="Last Name is required." ValidationGroup="ApplicationWizard" ForeColor="Red">Last Name is required.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="ApplicationWizard" ForeColor="Red">E-mail is required.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="EmailFormat" runat="server" ControlToValidate="Email" ErrorMessage="Incorrect Email format." ToolTip="Email format should be correct" ValidationGroup="ApplicationWizard" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">Incorrect Email format.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="USCIDLabel" runat="server" AssociatedControlID="USCID">USC ID:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="USCID" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="USCIDRequired" runat="server" ControlToValidate="USCID" ErrorMessage="USC ID is required." ToolTip="USC ID is required." ValidationGroup="ApplicationWizard" ForeColor="Red">USC ID is required.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="USCIDFormat" runat="server" ControlToValidate="USCID" ErrorMessage="Incorrect USC ID format" ToolTip="USC ID must be a 10 digit number." ValidationExpression="\d{10}" ValidationGroup="ApplicationWizard" ForeColor="Red">Incorrect USC ID format.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="MajorLabel" runat="server" AssociatedControlID="Major">Major:</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="Major" runat="server">
                                <asp:ListItem Text="Select a major" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Computer Science" Value="CS"></asp:ListItem>
                                <asp:ListItem Text="Electrical Engineering" Value="EE"></asp:ListItem>
                                <asp:ListItem Text="Mechanical Engineering" Value="ME"></asp:ListItem>
                                <asp:ListItem Text="Aerospace Engineering" Value="AE"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="MajorRequired" runat="server" ControlToValidate="Major" ErrorMessage="Major is required." ToolTip="Major is required." ValidationGroup="ApplicationWizard" ForeColor="Red" InitialValue="0">Major is required.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="ResumeLabel" runat="server" AssociatedControlID="Resume">Resume:</asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload ID="Resume" runat="server" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="ResumeRequired" runat="server" ControlToValidate="Resume" ErrorMessage="Please upload resume. Resume is required." ToolTip="Resume is required." ValidationGroup="ApplicationWizard" ForeColor="Red">Please upload resume. Resume is required.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Recommender 1</b></td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="R1NameLabel" runat="server" AssociatedControlID="R1Name">Name:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="R1Name" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="R1NameRequired" runat="server" ControlToValidate="R1Name" ErrorMessage="Recommender 1 Name is required." ToolTip="Recommender 1 Name is required." ValidationGroup="ApplicationWizard" ForeColor="Red">Recommender 1 Name is required.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="R1EmailLabel" runat="server" AssociatedControlID="R1Email">E-mail:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="R1Email" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="R1EmailRequired" runat="server" ControlToValidate="R1Email" ErrorMessage="Recommender 1 E-mail is required." ToolTip="Recommender 1 E-mail is required." ValidationGroup="ApplicationWizard" ForeColor="Red">Recommender 1 E-mail is required.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="R1EmailFormat" runat="server" ControlToValidate="R1Email" ErrorMessage="Incorrect Email format." ToolTip="Email format should be correct" ValidationGroup="ApplicationWizard" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">Incorrect Email format.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Recommender 2</b></td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="R2NameLabel" runat="server" AssociatedControlID="R2Name">Name:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="R2Name" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="R2NameRequired" runat="server" ControlToValidate="R2Name" ErrorMessage="Recommender 2 Name is required." ToolTip="Recommender 2 Name is required." ValidationGroup="ApplicationWizard" ForeColor="Red">Recommender 2 Name is required.</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" class="auto-style1">
                            <asp:Label ID="R2EmailLabel" runat="server" AssociatedControlID="R2Email">E-mail:</asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="R2Email" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="R2EmailRequired" runat="server" ControlToValidate="R2Email" ErrorMessage="Recommender 2 E-mail is required." ToolTip="Recommender 2 E-mail is required." ValidationGroup="ApplicationWizard" ForeColor="Red">Recommender 2 E-mail is required.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="R2EmailFormat" runat="server" ControlToValidate="R2Email" ErrorMessage="Incorrect Email format." ToolTip="Email format should be correct" ValidationGroup="ApplicationWizard" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">Incorrect Email format.</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Complete" Title="Success">
                You have successfully applied for scholarship.<br />
                Please check your email for tracking number to track the application.
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

