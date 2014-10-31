<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="VIPRoom.aspx.cs" Inherits="Chat2Connect.Admin.VIPRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
    <script src="../js/jquery.tokeninput.js"></script>
    <link href="../css/token-input-facebook.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#createRoom').addClass('active');
            setupAutoComplete();
        });

        function setupAutoComplete() {
            $("#<%= txtRoomName.ClientID%>").tokenInput("../Services/Services.asmx/SearchRoomsForTypes", {
                theme: "facebook",
                preventDuplicates: true,
                hintText: "",
                noResultsText: "لا يوجد",
                searchingText: "بحث فى الغرف...",
                tokenLimit: 1,
                onAdd: function (item) {
                    $('#<%= hdnRoomID.ClientID%>').val(item.id);
                },
            });
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow col-lg-12 ">
        <i class="modernicon iconmodern-createroom pull-right icon-2x"></i>
        <h3 class="col-lg-4 pull-right">غرفة مميزة</h3>

        <div class="clearfix"></div>
        <hr style="background: #ffd800; width: 100%; margin: 5px auto;" />
        <div class="clearfix"></div>
        <div class="form-horizontal blockBox ">
            <asp:Panel runat="server" ID="uiPanelSuccess" Visible="false">
                <div class="alert alert-success">
                    <asp:Label ID="uiLabelsuccess" runat="server" Text="تم تمييز الغرفة بنجاح"></asp:Label>
                </div>
            </asp:Panel>
            <div class="columns">
                <input type="hidden" id="hdnRoomID" runat="server" />
                <div class="col-lg-12 pull-right">
                    <div class="form-group">
                        <div class="col-sm-3 control-label pull-right">
                            <label>إسم الغرفة المراد تمييزها</label>
                        </div>
                        <div class="col-sm-2 pull-right">
                            <asp:TextBox ID="txtRoomName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="يجب إدخال إسم الغرفة" Display="Dynamic" ForeColor="Red" Font-Bold="true" ControlToValidate="txtRoomName"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 control-label pull-right">
                            <label>الإسم المميز الجديد</label>
                        </div>
                        <div class="col-sm-2 pull-right">
                            <asp:TextBox ID="txtNewName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="يجب إدخال الإسم المميز" Display="Dynamic" ForeColor="Red" Font-Bold="true" ControlToValidate="txtNewName"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 control-label pull-right">
                            <label>نوع الترقية</label>
                        </div>
                        <div class="col-sm-4 pull-right">
                            <asp:RadioButtonList ID="lstTypes" runat="server" RepeatDirection="Horizontal" CssClass="form-control radio-inlineMain" RepeatLayout="Table">
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="يجب إختيار نوع الترقية" Display="Dynamic" ForeColor="Red" Font-Bold="true" ControlToValidate="lstTypes"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 control-label pull-right">
                            <label>مدة الترقية</label>
                        </div>
                        <div class="col-sm-3 pull-right">
                            <asp:DropDownList ID="lstTypeDuration" runat="server" CssClass="form-control"></asp:DropDownList>
                        </div>
                        <div class="col-sm-1 pull-right">
                            شهر
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <hr style="background: #ffd800; width: 100%; margin: 5px auto;" />

            <div class="form-group">

                <div class="col-sm-2 control-label pull-left" style="text-align: left">
                    <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSaveRoom" Style="text-decoration: none;" OnClick="uiLinkButtonSaveRoom_Click">حفظ</asp:LinkButton>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
