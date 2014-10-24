<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="VIPRoom.aspx.cs" Inherits="Chat2Connect.Admin.VIPRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
    <script src="../js/jquery.tokeninput.js"></script>
    <link href="../css/token-input-facebook.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#createRoom').addClass('active');
            setupAutoComplete();
        });

        function viewAdminError() {
            $('#alertError').css('display', 'block');
        }

        function setupAutoComplete() {
            $("#<%= txtCreator.ClientID%>").tokenInput("../Services/Services.asmx/SearchMembersForTypes", {
                theme: "facebook",
                preventDuplicates: true,
                hintText: "",
                noResultsText: "لا يوجد",
                searchingText: "بحث فى الأسماء...",
                tokenLimit: 1,
                onAdd: function (item) {
                    $('#<%= hdnCreatorID.ClientID%>').val(item.id);
                },
            });
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow col-lg-12 ">
        <i class="modernicon iconmodern-createroom pull-right icon-2x"></i>
        <h3 class="col-lg-4 pull-right">
            <asp:Label ID="Label10" runat="server" Text=" إنشاء غرفة مميزة"></asp:Label></h3>

        <div class="clearfix"></div>
        <hr style="background: #ffd800; width: 100%; margin: 5px auto;" />
        <div class="clearfix"></div>
        <div class="form-horizontal blockBox ">
            <asp:Panel runat="server" ID="uiPanelSuccess" Visible="false">
                <div class="alert alert-success">
                    <asp:Label ID="uiLabelsuccess" runat="server" Text="تم إنشاء الغرفة بنجاح"></asp:Label>
                </div>
            </asp:Panel>
            <div class="form-group">
                <div class="col-sm-12 control-label pull-right">
                    <h5>إنشاء غرفة مميزة 
                    </h5>
                </div>
            </div>
            <div class="columns">
                <div class="col-lg-7 pull-right">
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>إسم الغرفة</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:TextBox ID="uiTextBoxADD_Name" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="يجب إدخال إسم الغرفة" Display="Dynamic" ForeColor="Red" Font-Bold="true" ControlToValidate="uiTextBoxADD_Name"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="nameValidator" runat="server" ControlToValidate="uiTextBoxADD_Name" ErrorMessage="يجب أن يكون اسم الغرفة مكون من 5 إلى 17 حرف." ValidationExpression=".{5,17}.*" Display="Dynamic" ForeColor="Red" />
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="إسم الغرفة غير مطابق للشروط" ClientValidationFunction="isValid" ControlToValidate="uiTextBoxADD_Name" Display="Dynamic" ForeColor="Red"></asp:CustomValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>القسم </label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:DropDownList ID="uiDropDownListADD_Category" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="uiDropDownListADD_Category_SelectedIndexChanged"></asp:DropDownList>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>القسم الفرعى </label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:DropDownList ID="uiDropDownListADD_SubCategory" runat="server" CssClass="form-control"></asp:DropDownList>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4 pull-right">
                            <label>مالك الغرفة:</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:TextBox ID="txtCreator" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="يجب إدخال إسم المالك" Display="Dynamic" ForeColor="Red" Font-Bold="true" ControlToValidate="txtCreator"></asp:RequiredFieldValidator>
                            <input type="hidden" id="hdnCreatorID" runat="server" />
                        </div>
                    </div>
                    <div class="form-group" id="dvVIPRoom" runat="server" visible="false">
                        <div class="col-sm-4 control-label pull-right">
                            <label>مدة الإشتراك</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:RadioButtonList ID="lstTypeDuration" runat="server" RepeatDirection="Horizontal" CssClass="form-control radio-inlineMain" RepeatLayout="Table"></asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="req_TypeDuration" runat="server" ControlToValidate="lstTypeDuration" ErrorMessage="من فضلك إختار مدة الإشتراك ." ToolTip="من فضلك إختار مدة الإشتراك ." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 pull-right" style="display: none;">
                    <div class="form-group">
                        <div class="col-sm-5 control-label pull-right">
                            <label>صورة الغرفة</label>
                        </div>
                        <div class="col-sm-7 pull-right">
                            <asp:FileUpload ID="uiFileUploadRoomPic" runat="server" />
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
