<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditAbout.aspx.cs" Inherits="Website.Admin.EditAbout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMain" style="direction: rtl;">
        <asp:Panel ID="uiPanelEdit" runat="server">
            <div class="ContentLeftDiv">
                <h6>
                    تعديل عن الأنبا إرميا</h6>
                <div class="AdminDetails728">
                    <div class="AdminRight">
                        &nbsp;</div>
                    <div class="AdminMiddle">
                        <asp:Label ID="uiLabelError" runat="server" Font-Bold="True" ForeColor="Red" Text="حدث خطأ . من فضلك حاول مرة أخرى ."
                            Visible="False"></asp:Label>
                        <br />
                        <asp:Label ID="uiLabelSucc" runat="server" Font-Bold="True" Font-Size="Medium" 
                            ForeColor="#00CC00" Text="تم تعديل البيانات بنجاح" Visible="False"></asp:Label>
                    </div>
                    <div class="AdminLeft">
                        &nbsp;</div>
                    <div class="clear">
                    </div>
                    
                    <div class="AdminRight" style="width: 135px">
                        <asp:Label ID="Label7" runat="server" Text="المحتوى :" CssClass="Label"></asp:Label>
                    </div>
                    <div class="AdminMiddle">
                        <asp:TextBox ID="uiTextBoxBrief" runat="server" TextMode="MultiLine" Rows="6" Width="400px"></asp:TextBox>
                    </div>
                    <div class="AdminLeft">                       
                    </div>
                    <div class="clear">
                    </div>
                    
                    <div class="AdminRight" style="width: 135px">
                    </div>
                    <div class="AdminMiddle" style="text-align: center">
                        <%--<asp:Button ID="uiButtonUpdate" runat="server" Text="إضافة / تعديل" ValidationGroup="EditPage"
                            OnClick="uiButtonUpdate_Click" />--%>
                        <div class="SearchBtn">
                            <asp:LinkButton ID="uiLinkButtonUpdate" runat="server" Text=" تعديل" ValidationGroup="EditPage"
                                OnClick="uiButtonUpdate_Click"></asp:LinkButton></div>
                        &nbsp; &nbsp; &nbsp;
                        <%--<asp:Button ID="uiButtonCancel" runat="server" Text="إلغاء" OnClick="uiButtonCancel_Click" />--%>
                    </div>
                    <div class="AdminLeft">
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
