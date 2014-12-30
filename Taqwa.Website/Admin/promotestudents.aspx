<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="promotestudents.aspx.cs" Inherits="Taqwa.Website.Admin.promotestudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>

    <div class="AdminMain" id="Main">
<asp:Panel ID="uiPanelCurrentStudents" runat="server" Visible= "true"  style="direction:rtl;padding-right:20px;">
<div><h3>الطلاب الحاليين</h3></div>

<div>
<div class="AdminLeft">
        <asp:Label ID="Label9" runat="server" CssClass="Label"> الصف الحالى:</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClasses" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListClasses_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft">
        <asp:Label ID="Label10" runat="server" CssClass="Label">الفصل الحالى:</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClassRooms" runat="server">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft">
        <asp:Label ID="Label11" runat="server" CssClass="Label">بحث :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:TextBox ID="uiTextBoxSearchText" runat="server" Width="120px" placeholder="إسم الطالب"></asp:TextBox>
            &nbsp;<asp:TextBox ID="uiTextBoxFatherName" runat="server" Width="120px" placeholder="إسم الأب"></asp:TextBox>                       
        </div>
        <div class="AdminRight">
            &nbsp;<asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
                onclick="uiButtonSearch_Click" />
                &nbsp;               


    </div>
        <div class="clear"></div>
       

        <div class="AdminLeft">&nbsp;</div>
        <div class="AdminMiddle">
            <h3><asp:Label ID="uiLabelError" runat="server" Visible="false" ForeColor="Red" Font-Bold="true"></asp:Label></h3>

        </div>
        <div class="AdminRight">

    
        </div>
        <div class="clear"></div>
<div class="AdminLeft">
        <asp:Label ID="Label2" runat="server" CssClass="Label"> الصف الجديد:</asp:Label>
        </div>

    <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListNextClasses" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListNextClasses_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft">
        <asp:Label ID="Label1" runat="server" CssClass="Label">الفصل الجديد:</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListNextClassRooms" runat="server">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
             &nbsp;<asp:Button ID="uiButtonPromote" runat="server" Text="نقل الطلاب" 
                onclick="uiButtonPromote_Click" />
                &nbsp;      </div>
        <div class="clear"></div>

    <asp:GridView ID="uiGridViewStudents" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" 
        AllowPaging="false" 
        onpageindexchanging="uiGridViewStudents_PageIndexChanging" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
    <asp:TemplateField HeaderText="م" >
    <ItemTemplate>
        <%# Container.DataItemIndex + 1 %>
    </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField  HeaderText="الصف الدراسى " DataField="ClassName" />
    <asp:BoundField  HeaderText="الفصل " DataField="ClassRoomName" />
    
    <asp:BoundField  HeaderText="إسم الطالب " DataField="ArStudentName" />
    
    <asp:BoundField  HeaderText="إسم الأب " DataField="ArFatherName" />
    <asp:CheckBoxField HeaderText="نشط" DataField="IsActive" />    
    </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
    عفواً ، لا توجد بيانات .
    </EmptyDataTemplate>
    </asp:GridView>
    
    <div class="clear"></div>
    </div>
    </asp:Panel>
</div>
</asp:Content>
