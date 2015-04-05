<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/General.Master" AutoEventWireup="true" CodeBehind="CareerRequestPage.aspx.cs" Inherits="brotherssolidarity.Admin.CareerRequestPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-bar-chart"></i>Career Request Page</h4>
                    <span class="tools">
                        <a href="javascript:;" class="icon-chevron-down"></a>
                        <a class="icon-remove" href="javascript:;"></a>
                    </span>
                   </div>
                <div class="widget-body">
                     
    <asp:GridView ID="GrdCareerRequest" OnRowDataBound="GrdCareerRequest_RowDataBound" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="fc-grid"
        HorizontalAlign="Center" Width="80%" OnRowCommand="GrdCareerRequest_RowCommand" OnSelectedIndexChanged="GrdCareerRequest_SelectedIndexChanged" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
<%--            <asp:TemplateField HeaderText="Career Name">
                <ItemTemplate>
                    <asp:Label ID="CareerName" runat="server" Text='<%# Eval("Position") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="Name" DataField="RequesterName" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Position">
                <ItemTemplate>
                    <asp:Label ID="uiLabelPostion" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderText="Email" DataField="RequesterEmail" />
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="CV">
                <ItemTemplate>
                    <a href='<%# Eval("CVPath") %>' class="btn btn-primary" >Download CV</a>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Actions" ItemStyle-HorizontalAlign="Center" >
    <ItemTemplate>
    
    <asp:LinkButton ID="btnDeleteGrd" OnClientClick="return confirm('Are you sure you want to delete this Request ?')" runat="server" CommandArgument='<%# Eval("CareerRequestsID") %>' CommandName="DeleteGrd" CssClass="btn btn-primary" >Delete</asp:LinkButton>
    
    </ItemTemplate>
                 
        <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
            
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    
                </div>
                </div>
            </div>
         </div>
    
   
</asp:Content>
