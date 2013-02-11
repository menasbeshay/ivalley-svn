<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ARNoBanner.Master" AutoEventWireup="true" CodeBehind="ContactForm.aspx.cs" Inherits="Obtravel.Arabic.Admin.ContactForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div><h1> بيانات المتصلين </h1>
    <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">العودة إلى لوحة التحكم</a>
                            </div>                           
                        </div>
    </div>
<div class="clear10px"></div>
<asp:Panel ID="uiPanelContactForms" runat="server" Direction="RightToLeft">
<div><h2>البيانات الحالية</h2></div>
<div>
    <asp:GridView ID="uiGridViewContactForm" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" 
        onrowcommand="uiGridViewContactForms_RowCommand" AllowPaging="True" 
        onpageindexchanging="uiGridViewContactForm_PageIndexChanging">
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="التليفون" DataField="Telephone" />
    <asp:BoundField  HeaderText="الموبايل" DataField="Mobile" />
    <asp:BoundField  HeaderText="البريد الإلكترونى" DataField="Email" />
    <asp:BoundField  HeaderText="التاريخ" DataField="SubmitDate" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <div class="smallrightHeight AdminCP">
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonView" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="ViewContact" >قراءة</asp:LinkButton>
    </div>    
    </div>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelViewForm" runat="server" Direction="RightToLeft">
    <div class="smallleft">
                التليفون</div>
            <div class="smallrightHeight">
                <asp:Label ID="uiLabelTelephone" runat="server" ></asp:Label></div>
           <div class="ServicesControls AdminCP" style="margin-top:-5px;">
                            <div class="btn">
                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" Text="عودة" 
                                    onclick="uiLinkButtonBack_Click" ></asp:LinkButton>
                            </div>                           
                        </div>
            <div class="clear10px">
            </div>
            <div class="smallleft">
                الموبايل</div>
            <div class="smallrightHeight">
                <asp:Label ID="uiLabelMobile" runat="server" ></asp:Label></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft">
                البريد الإلكترونى</div>
            <div class="smallrightHeight">
                <asp:Label ID="uiLabelEmail" runat="server" ></asp:Label></div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft">
                الموضوع</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxSubject" runat="server" ValidationGroup="Contact" Columns="30"
                    Rows="6" TextMode="MultiLine" Enabled="false"></asp:TextBox></div>
            
            <div class="clear10px">
            </div>
    </asp:Panel>
</asp:Content>
