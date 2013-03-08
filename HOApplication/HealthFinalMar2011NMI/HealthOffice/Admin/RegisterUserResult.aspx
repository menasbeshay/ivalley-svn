<%@ Page Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true"
    CodeFile="RegisterUserResult.aspx.cs" Inherits="RegisterUserResult"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
  
   <div style="direction: rtl; font-size:x-large;color:Red; text-align: center;">
         <br />
        <b>تمت اضافة المستخدم بنجاح</b>
        </div>
        <br />
    <div style="text-align: center">
    
        <table dir="rtl">
            <tr>
                <td>
                 <asp:Button runat="server" ID="Button1"  Width="200" Font-Bold="True" 
                        Text="اضافة مستخدم جديد " onclick="Button1_Click" />
                    
                        <br />
                </td>
                </tr>
                
        </table>
    </div>
     
     
    </div>
</asp:Content>
