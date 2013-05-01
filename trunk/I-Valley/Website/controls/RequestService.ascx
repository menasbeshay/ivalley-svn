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
<div id="innerform">


        <div style="float: left; margin-left:26%;">
            <asp:Label ID="Label1" runat="server" Text="Please , fill all required data." 
                Visible="False" Font-Bold="True" ForeColor="Red" Font-Size="14px"></asp:Label>
        </div>


    <div class="clear">
    </div>
    <div class="pLabel">
        Service
    </div>
    <div class="pContent">
        <div style="float: left;   width: 95%;">
    <asp:DropDownList ID="uiDropDownListService" runat="server">
        <asp:ListItem>Web development</asp:ListItem>
        <asp:ListItem>Search Engine Optimization</asp:ListItem>
        <asp:ListItem>E-Marketing</asp:ListItem>
        <asp:ListItem>Outsourcing</asp:ListItem>
    </asp:DropDownList>
    </div>
    </div>
    <div class="clear"></div>
    
    <div class="pLabel">
        Name</div>
    <div class="pContent">
        <div style="float:left;width:95%;">
            <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="popup"></asp:TextBox>
        </div>
        <div style="float: left;">
            &nbsp;*
        </div>
        
    </div>
    
        
    <div class="clear">
    </div>
    
    <div class="pLabel">
        Email</div>
    <div class="pContent">
        <div style="float: left;   width: 95%;">
            
    <asp:TextBox ID="uiTextBoxMail" runat="server" ValidationGroup="popup" 
        ></asp:TextBox></div>
        <div style="float: left;">
            &nbsp;*
        </div>
    </div>
    
    <div class="clear">
    </div>
    
    <div class="pLabel">
        Land line</div>
    <div class="pContent">
        <div style="float: left;   width: 95%;">
            
    <asp:TextBox ID="uiTextBoxLand" runat="server" ValidationGroup="popup" 
        ></asp:TextBox></div>
        <div style="float: left;">
            &nbsp;*
        </div>
    </div>
   
    <div class="clear">
    </div>
    
    <div class="pLabel">
        Company</div>
    <div class="pContent">
        <div style="float: left;   width: 95%;">
    <asp:TextBox ID="uiTextBoxCompany" runat="server"></asp:TextBox>
    </div>
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
