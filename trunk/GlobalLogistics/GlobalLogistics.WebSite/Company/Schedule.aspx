<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Company.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="GlobalLogistics.WebSite.Company.Schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="AdminMain"  style="direction: rtl;">
 <div class="ContentLeftDiv">
                <h1>
                       الجدول الملاحى
                </h1>
                <div class="Details675">

                
               <div class="AdminRight">
                   <asp:Label ID="Label1" runat="server" Text="إختر ملف : " CssClass="Label"></asp:Label>
            </div>
            <div class="AdminMiddle">
             <asp:FileUpload ID="uiFileUpload" runat="server" />
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear10">
            </div>            
            <div class="clear10">
            </div>  
                 <div class="AdminRight">
             <div class="AdminMore">
                <asp:LinkButton ID="uiLinkButtonAdd" runat="server" OnClick="uiLinkButtonAdd_Click">إضافة جدول ملاحى</asp:LinkButton>
                </div>
            </div>
            <div class="AdminMiddle">
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear5">
            </div>            
            <div class="AdminRight">
            </div>
            <div class="AdminMiddle">
             
                   <asp:Label ID="uiLabelmsg" runat="server" Text="تم رفع الملف بنجاح" 
                    Font-Bold="True" ForeColor="#009900" Visible="False" ></asp:Label>
             
            </div>
            <div class="AdminLeft">
            </div>
            <div class="clear10">
            </div>            

</div>
</div>
</div>
</asp:Content>
