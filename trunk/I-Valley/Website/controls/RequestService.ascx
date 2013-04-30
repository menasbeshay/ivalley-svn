<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RequestService.ascx.cs" Inherits="Website.controls.RequestService" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
        <div style="background-color: transparent; z-index: 10000; text-align: center; position: absolute;
            width: 95%; height: 95%; -ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
            filter: alpha(opacity=70); -moz-opacity: 0.7 -khtml-opacity: 0.7; opacity: 0.7;
            background-color: #fff;">
            <div style="-ms-filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=100); filter: alpha(opacity=100);
                -moz-opacity: 1; -khtml-opacity: 1; opacity: 1;margin-top:60px;">
                <img src="../images/ajax-loader.gif" style="vertical-align: middle; " />
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

<asp:Panel ID="uiPanelRequest" runat="server">

    <div class="pLabel">
        Service
    </div>
    <div class="pContent">
    <asp:DropDownList ID="uiDropDownListService" runat="server" Width="70%">
        <asp:ListItem>Web development</asp:ListItem>
        <asp:ListItem>Search Engine Optimization</asp:ListItem>
        <asp:ListItem>E-Marketing</asp:ListItem>
        <asp:ListItem>Outsourcing</asp:ListItem>
    </asp:DropDownList>
    </div>
    <div class="clear"></div>
    
    <div class="pLabel">
        Name</div>
    <div class="pContent">
        <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="popup" Width="70%"></asp:TextBox>
    </div>
    <div class="pLabel">
       
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uiTextBoxName"
            Display="None" ErrorMessage="Required" Font-Bold="True" ForeColor="Red" ValidationGroup="popup"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
        </asp:ValidatorCalloutExtender>
    </div>
    <div class="clear">
    </div>
    
    <div class="pLabel">
        Email</div>
    <div class="pContent">
    <asp:TextBox ID="uiTextBoxMail" runat="server" ValidationGroup="popup" Width="70%" ></asp:TextBox>
       
    </div>
    <div class="pLabel">
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="uiTextBoxMail"
            Display="None" ErrorMessage="Required" Font-Bold="True" ForeColor="Red" ValidationGroup="popup"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
        </asp:ValidatorCalloutExtender>
        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
            ControlToValidate="uiTextBoxMail" Display="None" ErrorMessage="Invalid email address"
            Font-Bold="True" ForeColor="Red" ValidationGroup="popup"></asp:RegularExpressionValidator>
        <asp:ValidatorCalloutExtender ID="RegularExpressionValidator1_ValidatorCalloutExtender"
            runat="server" Enabled="True" PopupPosition="Right" TargetControlID="RegularExpressionValidator1">
        </asp:ValidatorCalloutExtender>
    </div>
    <div class="clear">
    </div>
    
    <div class="pLabel">
        Land line</div>
    <div class="pContent">
    <asp:TextBox ID="uiTextBoxLand" runat="server" ValidationGroup="popup" Width="70%" ></asp:TextBox>
        
    </div>
    <div class="pLabel">
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="uiTextBoxLand"
            Display="None" ErrorMessage="Required" Font-Bold="True" ForeColor="Red" ValidationGroup="popup"></asp:RequiredFieldValidator>
        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
        </asp:ValidatorCalloutExtender>
    </div>
    <div class="clear">
    </div>
    
    <div class="pLabel">
        Company</div>
    <div class="pContent">
    <asp:TextBox ID="uiTextBoxCompany" runat="server" Width="70%"></asp:TextBox>
    </div>
    <div class="pLabel">
        </div>
    <div class="clear">
    </div>
    <div class="pLabel">
        </div>
    <div class="pContent">
       <asp:Button ID="uiButtonSend" runat="server" Text="Submit" 
            OnClick="uiButtonSend_Click" ValidationGroup="popup"
        />
    </div>
    <div class="clear">
    </div>
    
</asp:Panel>

<asp:Panel ID="uiPanelDone" runat="server">
    <div class="citer" style="width: 70%; float: left;">
        <p>
            your request has been sent successfully to <span class="CompanyName">I-Valley </span>...
            <br />
            our Business Development Manager will contact you in maximum 24 hours.
        </p>
    </div>
    <div style="float: left; margin-left: 10px; width: 25%">
        <img src="../images/select.png" style="width:60%;"/>
    </div>
</asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
