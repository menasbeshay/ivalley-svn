<%@ Page Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true"
    CodeFile="BornResult.aspx.cs" Inherits="_Default"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
  
    <div style="text-align: center">
        <table dir="rtl">
            <tr>
                <td>
                 <asp:Button runat="server" ID="Button1"  Width="200" Font-Bold="True" 
                        Text="طباعة "  />
                    
                        <br />
                </td>
                </tr><tr>
                <td>
                   <asp:Button runat="server" ID="btnAddNewBirth" Width="200" Text="اضافة حالة ميلاد جديدة"
                        OnClick="btnAddNewBirth_Click" Font-Bold="True" />
                    <br />
                </td></tr>
                <tr>
                <td>
                    <asp:Button runat="server" ID="btnback" Width="200" Font-Bold="True" Text="رجوع للصفحة الرئيسية" OnClick="btnback_Click" />
                    <br />
                </td>
            </tr>
        </table>
    </div>
      <div style="direction: rtl; font-size:x-large;color:Red; text-align: center;">
         <br />
        <b>تم تسجيل العملية بنجاح</b>
     
    </div>
</asp:Content>
