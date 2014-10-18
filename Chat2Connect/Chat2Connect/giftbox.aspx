<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/createMaster.master" AutoEventWireup="true" CodeBehind="giftbox.aspx.cs" Inherits="Chat2Connect.giftbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#giftbox').addClass('active');
        });

        function PlayGiftSound(id)
        {
            $('#giftAudio_' + id).trigger("play");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow col-lg-12 ">
         <h3 class="col-lg-9 pull-right">
             <i class="icon-2x icon-gift" ></i>&nbsp;صندوق الهدايا
         </h3>
        
        <div class="clear" style="height:5px"></div>
        <div class="pull-right col-lg-5">
            <a href="giftbox.aspx?t=sent" class="btn btn-main pull-left" id="sentbtn">الهدايا المرسلة</a> &nbsp;&nbsp;
            <a href="giftbox.aspx" class="btn btn-main pull-right" id="recievedbtn">الهدايا المستلمة</a>
        </div>
        <div class="clear" style="height:5px"></div>
        <asp:Panel ID="uiPanelInbox" runat="server" Visible="true">
        <div class="col-lg-12">
            <asp:GridView ID="uiGridViewInbox" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="uiGridViewInbox_PageIndexChanging">
                <Columns>                    
                    <asp:BoundField HeaderText="الراسل" DataField="SenderName" HeaderStyle-CssClass="center"/>
                    <asp:TemplateField HeaderText="نوع الهدية" HeaderStyle-CssClass="center">
                        <ItemTemplate>
                            <a href='#giftModal_<%# Container.DataItemIndex %>' data-toggle="modal" style="text-decoration:none;" onclick="PlayGiftSound(<%# Container.DataItemIndex %>);"><%# Eval("GiftName") %></a>
                            <div id='giftModal_<%# Container.DataItemIndex %>' class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-gift" style="float:left;margin-left:10px;"></i>
                        <h3 >
                           هدية</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                
                                <div class="form-group">
                                    <div class="col-sm-4 pull-right">
                                        <label>الراسل</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                          <%# Eval("SenderName") %>                                      
                                    </div>
                                </div>    
                                 <div class="form-group">
                                    <div class="col-sm-4 pull-right">
                                        <label>الهدية</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <img src='<%# Eval("PicPath") %>' /><br />
                                          <%# Eval("GiftName") %>                                      
                                    </div>
                                </div>                                
                            </div>
                   </div>
                    <audio id='giftAudio_<%# Container.DataItemIndex %>'><source src='files/sounds/invite.wav'></audio>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>                        
                    </div>
                    </div>
            </div>
    </div>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:BoundField HeaderText="التاريخ" DataField="SendDate" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-CssClass="center"/>
                </Columns>
            </asp:GridView>
        </div>
             <script type="text/javascript">
                 $(document).ready(function () {
                     $('#recievedbtn').addClass('active');
                 });
    </script>
            </asp:Panel>

        <asp:Panel ID="uiPanelOutbox" runat="server" Visible="true">
        <div class="col-lg-12">
            <asp:GridView ID="uiGridViewOutbox" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="uiGridViewOutbox_PageIndexChanging">                
                <Columns>                    
                    <asp:BoundField HeaderText="مرسلة إلى" DataField="Name" HeaderStyle-CssClass="center"/>
                    <asp:TemplateField HeaderText="نوع الهدية" HeaderStyle-CssClass="center">
                        <ItemTemplate>
                            <a href='#giftModal_<%# Container.DataItemIndex %>' data-toggle="modal" style="text-decoration:none;"  onclick="PlayGiftSound(<%# Container.DataItemIndex %>);"><%# Eval("GiftName") %></a>
                            <div id='giftModal_<%# Container.DataItemIndex %>' class="modal fade" role="modal" aria-hidden="true">
        <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="close pull-left" data-dismiss="modal" aria-hidden="true" style="text-decoration:none;" >
                            ×</a>
                        <i class="icon-2x icon-gift" style="float:left;margin-left:10px;"></i>
                        <h3 >
                           هدية</h3>
                    </div>
                    <div class="modal-body">
                            <div class="form-horizontal blockBox">
                                
                                <div class="form-group">
                                    <div class="col-sm-4 pull-right">
                                        <label>مرسلة إلى</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                          <%# Eval("Name") %>                                      
                                    </div>
                                </div>    
                                 <div class="form-group">
                                    <div class="col-sm-4 pull-right">
                                        <label>الهدية</label>
                                    </div>
                                    <div class="col-sm-8 pull-right">
                                        <img src='<%# Eval("PicPath") %>' /><br />
                                          <%# Eval("GiftName") %>                                      
                                    </div>
                                </div>                                
                            </div>
                   </div>
                     <audio id='giftAudio_<%# Container.DataItemIndex %>'><source src='files/sounds/invite.wav'></audio>
                    <div class="modal-footer">
                        <a href="#" class="btn btn-default" data-dismiss="modal" style="text-decoration:none;">إغلاق</a>                        
                    </div>
                    </div>
            </div>
    </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="التاريخ" DataField="SendDate" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-CssClass="center"/>
                </Columns>
            </asp:GridView>
        </div>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#sentbtn').addClass('active');
                });
    </script>
            </asp:Panel>
    </div>
</asp:Content>
