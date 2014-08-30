<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="careers.aspx.cs" Inherits="Sherifadel.careers" %>
<%@ MasterType VirtualPath="~/MasterPages/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    $(document).ready(function () {
        $("#mi6").addClass("current");
    });

    function clear() {

        document.getElementById('<%=uiTextBoxName.ClientID%>').value = "";
        document.getElementById('<%=uiTextBoxSurname.ClientID%>').value = "";        
        document.getElementById('<%=uiTextBoxEmail.ClientID%>').value = "";
        document.getElementById('<%=uiTextBoxCity.ClientID%>').value = "";
        document.getElementById('<%=uiTextBoxTele.ClientID%>').value = "";
        document.getElementById('<%=uiTextBoxQual.ClientID%>').value = "";
        document.getElementById('<%=uiTextBoxLang.ClientID%>').value = "";        
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ContentLeftDiv" style="padding:20px;padding-left:40px;">
        
        <div class="Details675" style="text-align:left;">
       
            <div class="AdminRight" style="width: 120px">
            </div>
            <div class="AdminMiddle">
                <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="An error occurred. please try again ."
                    Visible="False"></asp:Label>
                <asp:Label ID="uiLabelMessage" runat="server" Font-Bold="True" ForeColor="#66FF66"
                    Text="Your request has been sent successfully." Visible="False"></asp:Label>
                <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
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
                <div class="formBtn">
                    <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text="Submit" ValidationGroup="EditPage"
                        OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                
                <div class="formBtn" style="margin-left:20px;">
                    <a href="javascript:clear();" >Reset</a></div>
                <%--<asp:Button ID="uiButtonCancel" runat="server" Text="&#1573;&#1604;&#1594;&#1575;&#1569;" OnClick="uiButtonCancel_Click" />--%>
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>
            
        </div>
    </div>
</asp:Content>
