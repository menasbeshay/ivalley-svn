<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ENNoBanner.Master" AutoEventWireup="true" CodeBehind="ContactForm.aspx.cs" Inherits="Obtravel.Admin.ContactForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div><h1> View Contact submits </h1>
    <div class="ServicesControls AdminCP">
                            <div class="btn">
                                <a href="AdminCP.aspx">Back to Admin CP</a>
                            </div>                           
                        </div>
    </div>
<div class="clear10px"></div>
<asp:Panel ID="uiPanelContactForms" runat="server">
<div><h2>Current Submits</h2></div>
<div>
    <asp:GridView ID="uiGridViewContactForm" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" 
        onrowcommand="uiGridViewContactForms_RowCommand" AllowPaging="True" 
        onpageindexchanging="uiGridViewContactForm_PageIndexChanging">
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:BoundField  HeaderText="Telephone" DataField="Telephone" />
    <asp:BoundField  HeaderText="Mobile" DataField="Mobile" />
    <asp:BoundField  HeaderText="Email" DataField="Email" />
    <asp:BoundField  HeaderText="Date" DataField="SubmitDate" />
    <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <div class="smallrightHeight AdminCP">
    <div class="btn">
    <asp:LinkButton ID="uiLinkButtonView" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="ViewContact" >View</asp:LinkButton>
    </div>    
    </div>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
    </asp:GridView>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelViewForm" runat="server">
    <div class="smallleft" style="width: 65px;">
                Section </div>
            <div class="smallrightHeight">
                
                <asp:Label ID="uiLabelSection" runat="server"></asp:Label>
                
            </div>
            <div class="clear10px">
            </div>
             <div class="smallleft" style="width: 65px;">
                Title</div>
            <div class="smallrightHeight">
              
                <asp:Label ID="uiLabelTitle" runat="server"></asp:Label>
              
              </div>
            <div class="clear10px">
            </div>
             <div class="smallleft" style="width: 65px;">
                Name </div>
            <div class="smallrightHeight">
           
                <asp:Label ID="uiLabelName" runat="server"></asp:Label>
           
           </div>
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                E-mail</div>
            <div class="smallrightHeight">
                <asp:Label ID="uiLabelEmail" runat="server" ></asp:Label>
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Street</div>
            <div class="smallrightHeight">
           
                <asp:Label ID="uiLabelStreet" runat="server"></asp:Label>
           
           </div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                City</div>
            <div class="smallrightHeight">
           
                <asp:Label ID="uiLabelCity" runat="server"></asp:Label>
           
           </div>
                          
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Postal Code</div>
            <div class="smallrightHeight">
               
                <asp:Label ID="uiLabelPostalCode" runat="server"></asp:Label>
               
            </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px;">
                Country </div>
            <div class="smallrightHeight">
          
          
                <asp:Label ID="uiLabelCountry" runat="server"></asp:Label>
          
          
          </div>
            
            <div class="clear10px">
            </div>
            
    <div class="smallleft" style="width: 65px">
                Telephone</div>
            <div class="smallrightHeight">
                <asp:Label ID="uiLabelTelephone" runat="server" ></asp:Label></div>
           <div class="ServicesControls AdminCP" style="margin-top:-5px;">
                            <div class="btn">
                                <asp:LinkButton ID="uiLinkButtonBack" runat="server" Text="Back" 
                                    onclick="uiLinkButtonBack_Click" ></asp:LinkButton>
                            </div>                           
                        </div>
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px">
                Mobile</div>
            <div class="smallrightHeight">
                <asp:Label ID="uiLabelMobile" runat="server" ></asp:Label></div>
            
            
            <div class="clear10px">
            </div>
            <div class="smallleft" style="width: 65px">
                Message</div>
            <div class="smallrightHeight">
                <asp:TextBox ID="uiTextBoxSubject" runat="server" ValidationGroup="Contact" Columns="30"
                    Rows="6" TextMode="MultiLine" Enabled="false"></asp:TextBox></div>
            
            <div class="clear10px">
            </div>
    </asp:Panel>
</asp:Content>
