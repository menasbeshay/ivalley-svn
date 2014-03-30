<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditSchedule.aspx.cs" Inherits="Taqwa.Website.Admin.EditSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="BackDiv">
<asp:LinkButton runat="server" ID="lnkBackToAdminCP" PostBackUrl="AdminCP.aspx" 
        Font-Underline="true" Text="عودة إلى لوحة التحكم &gt;&gt;"></asp:LinkButton>
</div>
<div class="clear"></div>
<div class="AdminMain">
<asp:Panel ID="uiPanelCurrentSchedule" runat="server" Visible= "true" style="direction:rtl;padding-right:20px;">
<div><h3>جدول الحصص الحالى</h3></div>


<div>
<div class="AdminLeft">
        <asp:Label ID="Label9" runat="server" CssClass="Label">الصف :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClasses" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListClasses_SelectedIndexChanged" 
                Width="200px">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
        <div class="AdminLeft">
        <asp:Label ID="Label10" runat="server" CssClass="Label">الفصل :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListClassRooms" runat="server" 
                Width="200px" AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListClassRooms_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;
            <asp:Button ID="uiButtonSearch" runat="server" Text="بحث" 
                onclick="uiButtonSearch_Click" />
            </div>
        <div class="clear"></div>
        <div style="display:none">
        <div class="AdminLeft">
        <asp:Label ID="Label11" runat="server" CssClass="Label">اليوم :</asp:Label>
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:DropDownList ID="uiDropDownListDay" runat="server" Width="200px">
                <asp:ListItem Value="0">الأحد</asp:ListItem>
                <asp:ListItem Value="1">الأثنين</asp:ListItem>
                <asp:ListItem Value="2">الثلاثاء</asp:ListItem>
                <asp:ListItem Value="3">الأربعاء</asp:ListItem>
                <asp:ListItem Value="4">الخميس</asp:ListItem>
                <asp:ListItem Value="5">الجمعة</asp:ListItem>
                <asp:ListItem Value="6">السبت</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="AdminRight">
            &nbsp;
    </div>
        <div class="clear"></div>
       
        <div class="AdminLeft">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            &nbsp;<asp:LinkButton ID="uiLinkButtonAdd" runat="server" 
        onclick="uiLinkButtonAdd_Click" Style="font-size:15px">إضافة إلى جدول الحصص</asp:LinkButton>
        </div>
        <div class="AdminRight">
            &nbsp;</div>
        <div class="clear"></div>
    

    <asp:GridView ID="uiGridViewSchedule" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3" 
        onrowcommand="uiGridViewSchedule_RowCommand" AllowPaging="True" 
        onpageindexchanging="uiGridViewSchedule_PageIndexChanging" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>
        <asp:BoundField  HeaderText="إسم الفصل " DataField="ARClassRoomName" />
        <asp:BoundField  HeaderText="إسم الحصة" DataField="ARSectionName" />
        <asp:BoundField  HeaderText="التوقيت" DataField="Duration" />    
        <asp:BoundField  HeaderText="المادة" DataField="ARDetails" />
    <asp:TemplateField HeaderText="إجراءات" ItemStyle-HorizontalAlign="Center">
    <ItemTemplate>
    
    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("ScheduleID") %>' CommandName="EditSchedule" >تعديل</asp:LinkButton>
    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("ScheduleID") %>' CommandName="DeleteSchedule"  OnClientClick="return confirm('Are you want to delete this record?');">حذف</asp:LinkButton>

    </ItemTemplate>
    </asp:TemplateField>
    </Columns>
        <RowStyle HorizontalAlign="Center" />
        <EmptyDataTemplate>
    عفواً ، لا توجد بيانات.
    </EmptyDataTemplate>
    </asp:GridView>
    <div class="clear"></div> </div>
    </div>
    </asp:Panel>

    <asp:Panel ID="uiPanelCurrent" runat="server" style="direction:rtl;padding-right:20px;">
    <div><h3>تعديل جدول الحصص</h3></div>
        <div class="AdminLeft">
        </div>
        <div class="AdminMiddle">
            <asp:Label ID="uiLabelMessage" runat="server"></asp:Label>
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>

        <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" 
                Text="الحصة :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:DropDownList ID="uiDropDownListSection" runat="server">
            </asp:DropDownList>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="uiDropDownListSection" ErrorMessage="*" 
                ValidationGroup="UpdatePage"></asp:RequiredFieldValidator>
        </div>
        <div class="clear"></div>
        
         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label4" runat="server" CssClass="Label" 
                Text="المادة بالإنجليزية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxEnDetails" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" Height="60px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>
        
         <div class="AdminLeft" style="width: 195px">
            <asp:Label ID="Label7" runat="server" CssClass="Label" 
                Text="المادة بالعربية :"></asp:Label>
        </div>
        <div class="AdminMiddle">
            <asp:TextBox ID="uiTextBoxArDetails" runat="server" ValidationGroup="UpdatePage" 
                Width="400px" Height="60px" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="AdminRight" style="width: 30%">
            &nbsp;</div>
        <div class="clear"></div>         

        <div class="AdminLeft" style="width: 190px">
        &nbsp;
        </div>
        <div class="AdminMiddle">
            <asp:Button ID="uiButtonUpdate" runat="server" onclick="uiButtonUpdate_Click" 
                Text="إضافة / تعديل" ValidationGroup="UpdatePage" />
            &nbsp;<asp:Button ID="uiButtonCancel" runat="server" onclick="uiButtonCancel_Click" 
                Text="إلغاء" />
        </div>
        <div class="AdminRight">
        </div>
        <div class="clear"></div>
        </asp:Panel>

        <div style="direction:rtl;margin-right:20px;">
    <asp:Repeater ID="uiRepeaterDays" runat="server" 
        onitemdatabound="uiRepeaterDays_ItemDataBound">
    <HeaderTemplate>
    <table border="1" style="border-collapse:collapse;direction:rtl;width:80%;text-align:center;white-space:nowrap;">
    <tr>
    <td>
    اليوم / الحصة
    </td>
        <asp:Repeater ID="uiRepeaterSectionNames" runat="server">
        <ItemTemplate>
            <td>
            <%# Eval("ArName") %>
            </td>
        </ItemTemplate>
        </asp:Repeater>

    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td>
    <%# Container.DataItem.ToString().Substring(0,Container.DataItem.ToString().LastIndexOf("#")) %>
        <asp:HiddenField ID="uiHiddenFieldDayCode" runat="server" Value='<%# Container.DataItem.ToString().Substring(Container.DataItem.ToString().LastIndexOf("#")+1) %>' />
    </td>
    
        <asp:Repeater ID="uiRepeaterSections2" runat="server" onitemdatabound="uiRepeaterSections2_ItemDataBound">
        <ItemTemplate>
        <td>
            <asp:HiddenField ID="uiHiddenFieldSectionID" runat="server" />
            <asp:HiddenField ID="uiHiddenFieldDayCode" runat="server" />
            <asp:HiddenField ID="uiHiddenFieldScheduleID" runat="server" Value="0"/>
            <asp:TextBox ID="uiTextBoxCourse" runat="server" Width="80" style="text-align:center;"></asp:TextBox>            
        </td>
        </ItemTemplate>
        </asp:Repeater>

    
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
   
        <asp:Button ID="uiButtonUpdateFinal" runat="server" Text="تعديل / إضافة" 
            onclick="uiButtonUpdateFinal_Click" />
    </div>
    </div>
</asp:Content>
