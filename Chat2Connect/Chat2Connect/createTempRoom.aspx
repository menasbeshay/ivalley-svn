<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/createMaster.master" AutoEventWireup="true" CodeBehind="createTempRoom.aspx.cs" Inherits="Chat2Connect.createTempRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $('#createTempRoom').addClass('active');
         });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow">
        <h3>
            إنشاء غرفة مؤقتة لمجموعة من الأصدقاء
        </h3>
        <div class="form-horizontal">
            <div class="clearfix" style="height:10px;"></div>
            <div class="col-sm-12 pull-right">
                <div class="form-group">
                    <h5>
                        إختر الأصدقاء 
                    </h5>
                    <div class="form-control SScroll" data-height="150px">
                    <asp:CheckBoxList ID="uiCheckBoxListFriends" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="5" Width="100%" CssClass="checkbox-main" >
                    </asp:CheckBoxList>
                        <asp:Panel runat="server" ID="uiPanelNoFriendsFound" Visible="false">
                            <div class="alert alert-danger">
                                عفواً . لا يوجد أصدقاء متواجدين حالياً. من فضلك حاول فى وقت لاحق.
                            </div>
                        </asp:Panel>
                        
                        </div>
                    <div class="clearfix" style="height:10px;"></div>
                </div>
                <div class="form-group">
                    <asp:LinkButton ID="uiLinkButtonCreateTempRoom" runat="server" CssClass="btn btn-main" OnClick="uiLinkButtonCreateTempRoom_Click">إنشاء</asp:LinkButton>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
