<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Careers.aspx.cs" Inherits="website.Careers" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#mi6").addClass("current");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv" style="background-color: #C1B6B3;margin-left:-8px; padding:20px;padding-left:40px;">
        
        <div class="Details675">
            <div class="AdminRight" style="width: 120px">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="An error occurred. please try again ."
                    Visible="False"></asp:Label>
                <asp:Label ID="uiLabelMessage" runat="server" Font-Bold="True" ForeColor="Green"
                    Text="Your request has been sent successfully." Visible="False"></asp:Label>
                <p class="content_black">
                    If you believe you have what it takes to join Mehrez+Krema’s dynamic and creative
                    team,
                    <br>
                    fill in the form below and let us know!</p>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label1" runat="server" Text="Name : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxName" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxName" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label10" runat="server" Text="Surname : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxSurname" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxSurname" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label11" runat="server" Text="Date of birth : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxDOB" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
                <asp:CalendarExtender ID="uiTextBoxDOB_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="uiTextBoxDOB" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
            </div>
            <div class="AdminLeft">
                
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label2" runat="server" Text="E-mail :" CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxEmail" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="uiTextBoxEmail" Display="Dynamic" ValidationGroup="EditPage"></asp:RequiredFieldValidator>
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label12" runat="server" Text="City : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxCity" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
                
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label13" runat="server" Text="Telephone : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxTele" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label14" runat="server" Text="Qualifications : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxQual" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label15" runat="server" Text="Languages : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
                <asp:TextBox ID="uiTextBoxLang" runat="server" ValidationGroup="EditPage" Width="400px"></asp:TextBox>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label3" runat="server" Text="Applying for :" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:DropDownList ID="uiDropDownListDept" runat="server">
                    <asp:ListItem>Sales</asp:ListItem>
                    <asp:ListItem>Style &amp; design</asp:ListItem>
                    <asp:ListItem>Finance</asp:ListItem>
                    <asp:ListItem>Administration</asp:ListItem>
                    <asp:ListItem>IT</asp:ListItem>
                    <asp:ListItem>Human Resource</asp:ListItem>
                    <asp:ListItem>Legal</asp:ListItem>
                    <asp:ListItem>Production</asp:ListItem>
                    <asp:ListItem>Quality</asp:ListItem>
                    <asp:ListItem>Logistics</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
           
            <div class="AdminRight" style="width: 120px">
                <asp:Label ID="Label9" runat="server" Text="Upload your cv:" CssClass="Label"></asp:Label></div>
            <div class="AdminMiddle">
                <asp:FileUpload ID="uiFileUploadCV" runat="server" />
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <div class="AdminRight" style="width: 120px">
                &nbsp;
            </div>
            <div class="AdminMiddle">
                <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="&#1573;&#1590;&#1575;&#1601;&#1577; / &#1578;&#1593;&#1583;&#1610;&#1604;" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                <div class="SearchBtn">
                    <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="submit" ValidationGroup="EditPage"
                        OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                &nbsp; &nbsp; &nbsp;
                <%--<asp:Button ID="uiButtonCancel" runat="server" Text="&#1573;&#1604;&#1594;&#1575;&#1569;" OnClick="uiButtonCancel_Click" />--%>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            <hr />
            <div class="clear10">
            </div>
        </div>
    </div>

</asp:Content>
