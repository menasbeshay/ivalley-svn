<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/createMaster.master" AutoEventWireup="true" CodeBehind="createRoom.aspx.cs" Inherits="Chat2Connect.createRoom" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#createRoom').addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="blockBoxshadow col-lg-12 ">
        <i class="modernicon iconmodern-createroom pull-right icon-2x" ></i>
        <h3 class="col-lg-9 pull-right">
        <asp:Label ID="Label10" runat="server" Text="إنشاء غرفة"></asp:Label></h3>
            <hr style="background:#ffd800;width:100%;margin:5px auto;"/>
            <div class="clearfix"></div>
        <div class="form-horizontal blockBox SScroll" data-height="560px">
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
                                        
                </div>
                <div class="col-sm-3 pull-right">
                    <label>تاريخ إنشائها:</label>
                </div>
                <div class="col-sm-3 pull-right">
                                        
                </div>
            </div>
            <div class="columns">
                <div class="col-lg-7 pull-right">
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>إسم الغرفة</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:TextBox ID="uiTextBoxName" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>القسم </label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:DropDownList ID="uiDropDownListCategory" runat="server" CssClass="form-control"></asp:DropDownList>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>كلمة ترحيب عند الدخول </label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:TextBox ID="uiTextBoxWelcome" TextMode="MultiLine" Rows="5" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 pull-right">
                    <div class="form-group">
                        <div class="col-sm-4 control-label pull-right">
                            <label>صورة الغرفة</label>
                        </div>
                        <div class="col-sm-8 pull-right">
                            <asp:FileUpload ID="uiFileUploadRoomPic" runat="server" />
                        </div>
                    </div>

                </div>
            </div>
            <div class="clearfix"></div>
           <hr style="background:#ffd800;width:100%;margin:5px auto;"/>
            <div class="form-group">
                <div class="col-sm-4 control-label pull-right">
                    <h5>قائمة الأدمنية</h5>
                </div>                
            </div>
            <div class="form-group">
                <div class="col-sm-4 control-label pull-right">
                    <label>إضافة أدمن </label>
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
                                        
                </div>

                <div class="col-sm-2 control-label pull-right">
                    <label>اختر الفئة</label>
                </div>
                <div class="col-sm-3 pull-right">
                    <asp:DropDownList ID="uiDropDownListAdminType" runat="server" CssClass="form-control"></asp:DropDownList>
                                        
                </div>
                <div class="col-sm-2 control-label pull-right">
                    <asp:LinkButton ID="uiLinkButton" CssClass="btn btn-main" runat="server" style="margin-top:-7px;">إعتمد</asp:LinkButton>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="columns">
                <div class="col-lg-6">
                    <asp:GridView ID="uiGridViewAdmins" runat="server" AutoGenerateColumns="false" EmptyDataText="لا توجد بيانات">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate></HeaderTemplate>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>الأسم</HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>الفئة</HeaderTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>حذف</HeaderTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="col-sm-6 control-label pull-right">
                            <label>الرقم السرى للأدمنية </label>
                        </div>
                        <div class="col-sm-6 pull-right">
                            <asp:TextBox ID="uiTextBoxAdminPass" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                        </div>
                    </div>

                </div>
            </div>
            
            <div class="form-group">
                <div class="col-sm-12 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxChangeMyStatus" runat="server" CssClass="checkbox-main pull-right" Text="الرقم السرى لدخول الغرفة إذا كانت مقفلة"/>   
                    &nbsp;<asp:TextBox ID="uiTextBoxChangeMyStatusMin" runat="server" Width="50px"></asp:TextBox>&nbsp;
                    <asp:Label runat="server" Text="إذا وضعت علامة على المربع سوف تكون الغرفة برقم سرى لا يدخلها إلا من يعرف الرقم" style="font-weight:normal;font-size:12px;"></asp:Label>
                </div> 
                <div class="col-sm-12 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxHideRoomPics" runat="server" CssClass="checkbox-main pull-right" Text=" مسموح كاميرات بالغرفة"/>                                        
                </div>                                   
                <div class="col-sm-4 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxHideProfile" runat="server" CssClass="checkbox-main pull-right" Text=" مسموح ميكروفون واحد بالغرفة"/>                                        
                </div>                                   
                <div class="col-sm-4 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxNotifyOnPrivateChat" runat="server" CssClass="checkbox-main pull-right" Text="مسموح 2 ميكروفون"/>                                        
                </div>                                   
                <div class="col-sm-4 control-label pull-right">
                    <asp:CheckBox ID="uiCheckBoxNotifyOnFriendsOnOff" runat="server" CssClass="checkbox-main pull-right" Text="مسموح 3 ميكروفون"/>                                        
                </div> 
            </div>
            <div class="form-group">
                <asp:LinkButton CssClass="btn btn-warning" runat="server" ID="uiLinkButtonSaveRoom" style="text-decoration:none;" >حفظ</asp:LinkButton>
            </div>
                                
        </div>
    </div>
</asp:Content>
