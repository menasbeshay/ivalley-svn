<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Balance.master" AutoEventWireup="true" CodeBehind="MyBalance.aspx.cs" Inherits="Chat2Connect.MyBalance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BHead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mybalance').addClass('active');
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-horizontal blockBoxshadow">
        <div class="form-group">
        <div class="col-lg-2 control-label pull-right">
            الرصيد المالى
        </div>
        <div class="col-lg-6 pull-right">
            <asp:Label ID="uiLabelBalance" runat="server" ></asp:Label>
        </div>
            </div>

         <div class="form-group">
        <div class="col-lg-12 control-label pull-right">
           <h3> تحويل رصيد مالى</h3>
        </div>
        
            </div>

         <div class="form-group">
        <div class="col-lg-2 control-label pull-right">
            تحويل رصيد مالى إلى     </div>
        <div class="col-lg-6 pull-right">
            <asp:DropDownList ID="uiDropDownListFriends" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
            </div>

        <div class="form-group">
        <div class="col-lg-2 control-label pull-right">
            المبلغ</div>
        <div class="col-lg-6 pull-right">
            <asp:TextBox ID="uiTextBoxAmount" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uiTextBoxAmount" ErrorMessage="من فضلك أدخل القيمة." ToolTip="من فضلك أدخل القيمة." ValidationGroup="confirm_start" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            </div>

        <div class="form-group">
        <div class="col-lg-2 control-label pull-right">
            </div>
        <div class="col-lg-6 pull-right">
            <asp:HyperLink ID="uiLinkButtonTransfere" runat="server" class="btn btn-main" data-toggle="modal" ValidationGroup="confirm_start" NavigateUrl="#confirm">تحويل</asp:HyperLink>           
        </div>
            </div>
    </div>

    <div id="confirm" class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-edit" style="float:left;margin-left:10px;"></i>
                        <h3 >
                            تأكيد التحويل</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>السؤال السرى</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">                                        
                                        <asp:DropDownList ID="uiDropDownListQuestion" runat="server" CssClass="form-control" >                     
            	                            <asp:ListItem Value="0">اختر السؤال السرى</asp:ListItem>
            	                            <asp:ListItem> اين ولدت</asp:ListItem>
            	                            <asp:ListItem>اقرب صديق اليك</asp:ListItem>
            	                            <asp:ListItem>اين تسكن</asp:ListItem>
            	                            <asp:ListItem>افضل مدينه زرتها</asp:ListItem>
            	                            <asp:ListItem>سيارة تتمنى اقتنائها</asp:ListItem>			
                                        </asp:DropDownList>                                        
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4 control-label pull-right">
                                        <label>إجابة السوال السرى</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <asp:TextBox ID="uiTextBoxAnswer" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="uiTextBoxAnswer" ErrorMessage="من فضلك أدخل إجابة السؤال السرى." ToolTip="من فضلك أدخل إجابة السؤال السرى." ValidationGroup="confirm" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>                                        
                                    </div>
                                </div>                             
                            </div>
                   </div>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>
                        <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonConfirm" style="text-decoration:none;" OnClick="uiLinkButtonConfirm_Click" ValidationGroup="confirm">تأكيد</asp:LinkButton>
                    </div>
                    </div>
            </div>
    </div>
    
</asp:Content>
