<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RoomInfo.ascx.cs" Inherits="Chat2Connect.Admin.UserControls.Room.RoomInfo" %>
<div class="modal-content" style="margin:10px 20px;width:97%;">
    <div class="modal-header">
        <h3 id="myModalLabel1">معلومات الغرفة</h3>
    </div>
    <div class="modal-body">
        <div class="form-horizontal blockBox validationGroup">
            <div class="form-group">
                <div class="col-sm-2 pull-right">
                    <label>اسم الغرفة:</label>
                </div>
                <div class="col-sm-2 pull-right">
                    <asp:Label ID="uiLabelName" runat="server" ></asp:Label>                    
                </div> 
                <div class="col-sm-2 pull-right">
                    <label>مالك الغرفة:</label>
                </div>
                <div class="col-sm-2 pull-right">
                    <asp:Label ID="uiLabelCreator" runat="server" ></asp:Label>                    
                </div>
                <div class="col-sm-2 pull-right">
                    <label>تاريخ إنشائها:</label>
                </div>
                <div class="col-sm-2 pull-right">
                    <asp:Label ID="uiLabelCreatedDate" runat="server" ></asp:Label>                    
                </div>
            </div>
             <div class="clearfix"></div>
           <hr style="background:#ffd800;width:100%;margin:5px auto;"/>
            <div class="form-group">
                <div class="col-sm-4 control-label pull-right">
                    <h5>قائمة الأدمنية</h5>
                </div>                
            </div>
            <div class="col-lg-10 pull-right">
                    <asp:GridView ID="uiGridViewAdmins" runat="server" AutoGenerateColumns="false" EmptyDataText="لا توجد بيانات" CssClass="adminsTable">
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
                                    <%# Eval("AdminName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>الفئة</HeaderTemplate>
                                <ItemTemplate>
                                    <%# Eval("AdminTypeName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                    </asp:GridView>
                <div class="clearfix"></div>
                </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>