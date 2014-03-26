<%@ Page Title="" Language="C#" MasterPageFile="~/AccountMatster.Master" AutoEventWireup="true"
    CodeBehind="Fees.aspx.cs" Inherits="Taqwa.Website.Fees" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
        <div class="style24" style="color: Green;">
            <asp:Literal ID="uiLiteralTitle" runat="server" Text="المصروفات الدراسية"></asp:Literal>
        </div>
        <div style="clear: both; height: 10px;">
        </div>
        <div class="Content">
            <div class="Right">
                <asp:Label ID="Label9" runat="server" CssClass="Label">السنة الدراسية : </asp:Label>
            </div>
            <div class="Middle">
                &nbsp;<asp:DropDownList ID="uiDropDownListSchoolYear" runat="server">
                </asp:DropDownList>
            </div>
            <div class="Left">
                &nbsp;<asp:Button ID="uiButtonView" runat="server" onclick="uiButtonView_Click" 
                    Text="عرض المصروفات" />
            </div>
            <div class="clear" style="height: 10px;">
            </div>
             <div class="Right">
                <asp:Label ID="Label8" runat="server" CssClass="Label">بيان المصروفات </asp:Label>
            </div>
            <div class="clear" style="height:5px;"></div>
            <div class="Right" 
                style="border: 1px solid black; border-bottom: 0px; width: 173px;padding-right:3px;">
                <asp:Label ID="Label1" runat="server" CssClass="Label">مستحقات عن العام السابق : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
                &nbsp;<asp:Label ID="uiLabelRemaining" runat="server"></asp:Label>
                </div>
            <div class="Left">
                
                &nbsp;</div>
            <div class="clear" style="height: 0px;"></div>

            <div class="Right" 
                style="border: 1px solid black; border-bottom: 0px; width: 173px;padding-right:3px;">
                <asp:Label ID="Label2" runat="server" CssClass="Label">رسوم الكتب الدراسية : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
                &nbsp;<asp:Label ID="uiLabelBooks" runat="server"></asp:Label>
            </div>
            <div class="Left">
                &nbsp;</div>
            <div class="clear" style="height: 0px;"></div>
            <div class="Right" 
                style="border: 1px solid black; border-bottom: 0px; width: 173px;padding-right:3px;">
                <asp:Label ID="Label3" runat="server" CssClass="Label">رسوم إشتراك السيارة : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
                &nbsp;<asp:Label ID="uiLabelBus" runat="server"></asp:Label>
            </div>
            <div class="Left">
                &nbsp;</div>
            <div class="clear" style="height: 0px;"></div>
            <div class="Right" 
                style="border: 1px solid black; border-bottom: 0px; width: 173px;padding-right:3px;">
                <asp:Label ID="Label4" runat="server" CssClass="Label">رسوم الزى المدرسى : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
                &nbsp;<asp:Label ID="uiLabelUniform" runat="server"></asp:Label>
                </div>
            <div class="Left">
                &nbsp;</div>
            <div class="clear" style="height: 0px;"></div>
            <div class="Right" 
                style="border: 1px solid black; border-bottom: 0px; width: 173px;padding-right:3px;">
                <asp:Label ID="Label5" runat="server" CssClass="Label">رسوم الخدمات الإضافية : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
                &nbsp;<asp:Label ID="uiLabelOther" runat="server"></asp:Label>
                </div>
            <div class="Left">
                
                &nbsp;</div>
            <div class="clear" style="height: 0px;"></div>
            <div class="Right" 
                style="border: 1px solid black; border-bottom: 0px; width: 173px;padding-right:3px;">
                <asp:Label ID="Label6" runat="server" CssClass="Label">الرسوم الدراسية والأنشطة : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black;border-right:0px;border-bottom:0px; text-align: center">
                &nbsp;<asp:Label ID="uiLabelAct" runat="server"></asp:Label></div>
            <div class="Left">
                
                &nbsp;</div>
            <div class="clear" style="height: 0px;"></div>
            <div class="Right" 
                style="border: 1px solid black; width: 173px;padding-right:3px;background-color:#cccccc;">
                <asp:Label ID="Label7" runat="server" CssClass="Label">الإجمالى : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black;border-right:0px; text-align: center;background-color:#cccccc;height:20px;">
                &nbsp;<asp:Label ID="uiLabelTotal" runat="server"></asp:Label>
            </div>
            <div class="Left">
                &nbsp;</div>
           


           <div class="clear" style="height: 15px;">
            </div>
             <div class="Right">
                <asp:Label ID="Label10" runat="server" CssClass="Label">ما تم دفعه</asp:Label>
            </div>

            <div class="clear" style="height:10px;"></div>
            <div>
        <asp:GridView ID="uiGridViewInstallments" runat="server" 
            AutoGenerateColumns="False" CellPadding="3" 
            HorizontalAlign="Right" Width="75%" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" EnableModelValidation="True">
            <Columns>
            <asp:BoundField DataField="Date" HeaderText="التاريخ" DataFormatString="{0:dd/MM/yyy}" />
            <asp:BoundField DataField="Quantity" HeaderText="الدفعة" />
            <asp:BoundField DataField="PayOrderNo" HeaderText="رقم الإيصال" />                       
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle HorizontalAlign="Center" ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
            </div>
            <div class="clear" style="height:25px;"></div>
            <div class="Right" 
                style="border: 1px solid black;  width: 173px; padding-right: 3px;">
                <asp:Label ID="Label11" runat="server" CssClass="Label">إجمالى ما تم دفعه : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black; border-right: 0px;border-bottom:0px; text-align: center;height:20px;">
                <asp:Label ID="uiLabelTotalPaid" runat="server"></asp:Label>
            </div>
            <div class="Left">
                &nbsp;</div>
                <div class="clear" style="height:0px;"></div>
            <div class="Right" 
                style="border: 1px solid black; border-top: 0px; width: 173px; padding-right: 3px;background-color:#cccccc;">
                <asp:Label ID="Label12" runat="server" CssClass="Label">مستحقات حالية : </asp:Label>
            </div>
            <div class="Middle" 
                style="width: 100px; border: 1px solid black;border-right:0px; text-align: center;background-color:#cccccc;height:19px;">
                &nbsp;<asp:Label ID="uiLabelInvoiceTotal" runat="server"></asp:Label>
            </div>
            <div class="Left">
                &nbsp;</div>
                <div class="clear" style="height:25px;"></div>
        </div>
    </div>
</asp:Content>
