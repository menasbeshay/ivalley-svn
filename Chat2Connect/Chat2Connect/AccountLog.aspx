<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="AccountLog.aspx.cs" Inherits="Chat2Connect.AccountLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#userlog').addClass('active');
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-horizontal blockBoxshadow">
        <h2>
            كشف الحساب
        </h2>
        <div class="clearfix" style="height:10px;"></div>
        <div class="col-lg-12" style="float:none;">
             <asp:GridView ID="uiGridViewLog" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" OnPageIndexChanging="uiGridViewLog_PageIndexChanging" OnRowDataBound="uiGridViewLog_RowDataBound" HeaderStyle-CssClass="MsgHeader">
                 <RowStyle HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField DataField="TransDate" DataFormatString="{0:dd / MM / yyyy hh:mm tt}" HeaderText="التاريخ والوقت"/>
                <asp:BoundField DataField="PaymentMethod"  HeaderText="نوع الحركة"/>
                
                <asp:TemplateField HeaderText="مصدر التحويل" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="uiLabelSenderName"></asp:Label>                        
                    </ItemTemplate>                    
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="تحويل إلى" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="uiLabelToName"></asp:Label>                        
                    </ItemTemplate>                    
                </asp:TemplateField>  
                <asp:BoundField DataField="Value"  HeaderText="قيمة التحويل" DataFormatString="{0:0.0#}&nbsp;ريال"/>             
                
            </Columns>
        </asp:GridView>
            <div class="clearfix" style="height:5px;"></div>
        </div>
        <div class="clearfix" style="height:5px;"></div>
    </div>
</asp:Content>
