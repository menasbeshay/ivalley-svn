<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/createMaster.master" AutoEventWireup="true" CodeBehind="createRoom.aspx.cs" Inherits="Chat2Connect.createRoom" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#createRoom').addClass('active');
            setupAutoComplete();
        });

        function viewAdminError()
        {
            $('#alertError').css('display', 'block');
        }

        function setupAutoComplete() {
            $("#<%= uiTextBoxAdminName.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "../services/Services.asmx/SearchMembers",
                        dataType: "json",
                        type: "post",
                        data: "{'query':'" + request.term.toString() + "'}",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response(jQuery.map(data.d, function (item) {
                                return {
                                    val: item.split('##')[0],
                                    label: item.split('##')[1]
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest);
                        }
                    });

                },
                select: function (e, i) {
                    $("#<%=uiHiddenFieldAdminID.ClientID %>").val(i.item.val);
                    $("#<%=uiTextBoxAdminName.ClientID %>").val(i.item.label);
                },
                minLength: 1
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow col-lg-12 ">
        <i class="modernicon iconmodern-createroom pull-right icon-2x" ></i>
        <h3 class="col-lg-4 pull-right">
        <asp:Label ID="Label10" runat="server" Text="إنشاء غرفة"></asp:Label></h3>
        <div class="col-lg-7 pull-right">
            <div class="col-lg-6 pull-right">
            <h5>أو إختر غرفة لتعديل الإعدادات :</h5>
                </div>
            <div class="col-lg-5 pull-right">
            <asp:DropDownList ID="uiDropDownListMyRooms" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="uiDropDownListMyRooms_SelectedIndexChanged"></asp:DropDownList>
                </div>
        </div>
        <div class="clearfix"></div>
            <hr style="background:#ffd800;width:100%;margin:5px auto;"/>
            <div class="clearfix"></div>
        <div class="form-horizontal blockBox " >
            <asp:Panel runat="server" ID="uiPanelSuccess" Visible="false">
                <div class="alert alert-success">
                    <asp:Label ID="uiLabelsuccess" runat="server"></asp:Label>
                </div>
            </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelCreateRoom">
                 <div class="form-group">
                <div class="col-sm-12 control-label pull-right">
                    <h5>إنشاء غرفة مجانية</h5>
                </div>
                
            </div>
            <div class="form-group">
                <div class="col-sm-2 pull-right">
                    <label>مدير الغرفة:</label>
                </div>
                <div class="col-sm-3 pull-right">
                    <asp:Label ID="uiLabelCreator" runat="server" ></asp:Label>                    
                </div>
                <div class="col-sm-3 pull-right">
                    <label>تاريخ إنشائها:</label>
                </div>
                <div class="col-sm-3 pull-right">
                    <asp:Label ID="uiLabelCreatedDate" runat="server" ></asp:Label>                    
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
                            <asp:RegularExpressionValidator ID="valPassword" runat="server" ControlToValidate="uiTextBoxADD_Name" ErrorMessage="يجب أن يكون اسم الغرفة مكون من 5 إلى 17 حرف." ValidationExpression=".{5,17}.*" Display="Dynamic" ForeColor="Red" />
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
                </div>
                <div class="col-lg-5 pull-right" style="display:none;">
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
            </asp:Panel>
            <asp:Panel runat="server" ID="uiPanelEditRoom" CssClass="col-lg-10 pull-right">
                <div class="form-group">
                <div class="col-sm-2 pull-right">
                    <label>اسم الغرفة:</label>
                </div>
                <div class="col-sm-2 pull-right">
                    <asp:Label ID="uiLabelRoomName" runat="server" ></asp:Label>                    
                </div>
                <div class="col-sm-2 pull-right">
                    <label>مدير الغرفة:</label>
                </div>
                <div class="col-sm-2 pull-right">
                    <asp:Label ID="uiLabelOwnerName" runat="server" ></asp:Label>                    
                </div>
                    <div class="col-sm-2 pull-right">
                    <label>تاريخ إنشائها:</label>
                </div>
                <div class="col-sm-2 pull-right">
                    <asp:Label ID="uiLabelCreatedDate_Edit" runat="server" ></asp:Label>                    
                </div>
            </div>
                 <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>القسم </label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:DropDownList ID="uiDropDownListEdit_Category" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="uiDropDownListEdit_Category_SelectedIndexChanged"></asp:DropDownList>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>القسم الفرعى </label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:DropDownList ID="uiDropDownListEditSubCat" runat="server" CssClass="form-control"></asp:DropDownList>

                        </div>
                    </div>
                  <div class="form-group">
                <div class="col-sm-4 control-label pull-right">
                    <h5>قائمة الإدارة</h5>
                </div>                
            </div>
                <div class="col-sm-12 form-group">
                <div class="col-sm-12 pull-right">
                    <asp:GridView ID="uiGridViewAdmins" runat="server" AutoGenerateColumns="false" EmptyDataText="لا توجد بيانات" CssClass="adminsTable table" OnRowCommand="uiGridViewAdmins_RowCommand">
                        <AlternatingRowStyle CssClass="Alteven" />
                        <RowStyle CssClass="Altodd" />
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>م</HeaderTemplate>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>الأسم</HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("MemberName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>الفئة</HeaderTemplate>
                                <ItemTemplate>
                                   <%# Helper.StringEnum.GetStringValue(Helper.EnumUtil.ParseEnum<Helper.Enums.RoomMemberLevel>(Convert.ToInt32(Eval("RoomMemberLevelID")))) %> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>حذف</HeaderTemplate>
                                <ItemTemplate>
                                    
                                    <asp:LinkButton ID="uiLinkButtonDelAdmin" runat="server" CommandName="DeleteAdmin" CommandArgument='<%# Eval("MemberID") %>' OnClientClick="return confirm('هل أنت متأكد أنك تريد حذف هذا السجل ؟');"><i class=" icon-trash"></i></asp:LinkButton>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                 </div>
            <div class="form-group">
                <div class="col-sm-4 control-label pull-right">
                    <label>إضافة فى الإدارة </label>
                </div>
                <div class="col-sm-8 pull-right">
                                        
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-1 control-label pull-right">
                    <label>الأسم</label>
                </div>
                <div class="col-sm-3 pull-right">
                    <asp:TextBox ID="uiTextBoxAdminName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:HiddenField ID="uiHiddenFieldAdminID" runat="server" />                    
                </div>

                <div class="col-sm-2 control-label pull-right">
                    <label>اختر الفئة</label>
                </div>
                <div class="col-sm-3 pull-right">
                    <asp:DropDownList ID="uiDropDownListAdminType" runat="server" CssClass="form-control"></asp:DropDownList>
                                        
                </div>
                <div class="col-sm-2 control-label pull-right">
                    <asp:LinkButton ID="uiLinkButton" CssClass="btn btn-main" runat="server" style="margin-top:-7px;" OnClick="uiLinkButton_Click">حفظ</asp:LinkButton>
                </div>
            </div>
            <div class="alert-danger col-lg-6 pull-right" id="alertError" style="display:none;height:30px;padding-top:8px;">
                الأدمن موجود من قبل
            </div>
            <div class="clearfix"></div>
             
                 <div class="form-group">
                <div class="col-lg-6 pull-right">
                    <div class="form-group">
                        <div class="col-sm-8 control-label pull-right">
                            <label>الرقم السرى لفتح الغرفة </label>
                        </div>
                        <div class="col-sm-3 pull-right">
                            <asp:TextBox ID="uiTextBoxAdminPass" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                        </div>
                    </div>

                </div>
            </div>

                <div class="form-group">
                        <div class="col-sm-3 control-label pull-right">
                            <label>غلق الغرفة نهائياً </label>
                        </div>
                        <div class="col-sm-1 pull-right">
                            <asp:CheckBox ID="uiCheckBoxCloseRoom" runat="server" />
                                        
                        </div>
                    </div>
            
            <div class="form-group" style="display:none;">
                <div class="col-sm-12 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxPasswordEnable" runat="server" CssClass="checkbox-main pull-right" Text="الرقم السرى لدخول الغرفة إذا كانت مقفلة"/>   
                    &nbsp;<asp:TextBox ID="uiTextBoxPassword" runat="server" Width="50px" style="margin-bottom:0 !important;"></asp:TextBox>&nbsp;
                    <asp:Label runat="server" Text="إذا وضعت علامة على المربع سوف تكون الغرفة برقم سرى لا يدخلها إلا من يعرف الرقم" style="font-weight:normal;font-size:12px;"></asp:Label>
                </div> 
                <div class="col-sm-12 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxEnableCam" runat="server" CssClass="checkbox-main pull-right" Text=" مسموح كاميرات بالغرفة"/>                                        
                </div>                                   
                <div class="col-sm-4 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxEnableOneMic" runat="server" CssClass="checkbox-main pull-right" Text=" مسموح ميكروفون واحد بالغرفة"/>                                        
                </div>                                   
                <div class="col-sm-4 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxEnableTwoMic" runat="server" CssClass="checkbox-main pull-right" Text="مسموح 2 ميكروفون"/>                                        
                </div>                                   
                <div class="col-sm-4 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxEnableThreeMic" runat="server" CssClass="checkbox-main pull-right" Text="مسموح 3 ميكروفون"/>                                        
                </div> 
            </div>
            </asp:Panel>
           
           <hr style="background:#ffd800;width:100%;margin:5px auto;"/>
          
            <div class="form-group">
                
                <div class="col-sm-2 control-label pull-left" style="text-align:left">
                <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSaveRoom" style="text-decoration:none;" OnClick="uiLinkButtonSaveRoom_Click" >حفظ</asp:LinkButton>
                    </div>
            </div>
                                
        </div>
    </div>
</asp:Content>
