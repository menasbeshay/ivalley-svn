<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="VIPReport.aspx.cs" Inherits="Chat2Connect.Admin.VIPReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-lg-12" style="padding:0px;">
        <div class="col-lg-6">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 id="myModalLabel1">الحسابات المميزة</h3>
                </div>
                <div class="modal-body">
                    <div class="col-lg-2 pull-right">تاريخ الإنشاء من</div>
                    <div class="col-lg-3 pull-right">
                        <div class="input-group">
                            <asp:TextBox ID="uiTextBoxAccCreatedFrom" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                            <span class="input-group-btn">
                                <button class="btn bg-warning clearInput icon icon-remove" data-control="<%= uiTextBoxAccCreatedFrom.ClientID %>" type="button"></button>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1 pull-right">إلى</div>
                    <div class="col-lg-3 pull-right">
                        <div class="input-group">
                            <asp:TextBox ID="uiTextBoxAccCreatedTo" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                            <span class="input-group-btn">
                                <button class="btn bg-warning clearInput icon icon-remove" data-control="<%= uiTextBoxAccCreatedTo.ClientID %>" type="button"></button>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-2 pull-right">
                        <asp:LinkButton ID="uiLinkButtonRunAcc" runat="server" OnClick="uiLinkButtonRunAcc_Click" CssClass="btn btn-main">عرض </asp:LinkButton>
                    </div>
                    <div class="clear" style="height:20px;"></div>

                    <div class="col-lg-12">
                        <asp:GridView ID="uiGridViewAcc" runat="server" AutoGenerateColumns="false" CssClass="table table-hover" AllowPaging="True" OnPageIndexChanging="uiGridViewAcc_PageIndexChanging" HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" EmptyDataText="لا توجد بيانات">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="الإسم" />
                                <asp:BoundField DataField="TypeName" HeaderText="الترقية" />
                                <asp:BoundField DataField="StartDate" HeaderText="تاريخ البداية"  DataFormatString="{0:yyyy/MM/dd}"/>
                                <asp:BoundField DataField="EndDate" HeaderText="تاريخ الإنتهاء" DataFormatString="{0:yyyy/MM/dd}"/>
                                <asp:BoundField DataField="createdby" HeaderText="ترقية بواسطة" />
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="clear"></div>
                </div>

            </div>
        </div>
        <div class="col-lg-6">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 id="myModalLabel2">الغرف المميزة</h3>
                </div>
                <div class="modal-body">
                     <div class="col-lg-2 pull-right">تاريخ الإنشاء من</div>
                    <div class="col-lg-3 pull-right">
                        <div class="input-group">
                            <asp:TextBox ID="uiTextBoxRoomCreatedFrom" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                            <span class="input-group-btn">
                                <button class="btn bg-warning clearInput icon icon-remove" data-control="<%= uiTextBoxRoomCreatedFrom.ClientID %>" type="button"></button>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-1 pull-right">إلى</div>
                    <div class="col-lg-3 pull-right">
                        <div class="input-group">
                            <asp:TextBox ID="uiTextBoxRoomCreatedTo" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
                            <span class="input-group-btn">
                                <button class="btn bg-warning clearInput icon icon-remove" data-control="<%= uiTextBoxRoomCreatedTo.ClientID %>" type="button"></button>
                            </span>
                        </div>
                    </div>
                    <div class="col-lg-2 pull-right">
                        <asp:LinkButton ID="uiLinkButtonRunRoom" runat="server" OnClick="uiLinkButtonRunRoom_Click" CssClass="btn btn-main">عرض</asp:LinkButton>
                    </div>
                    <div class="clear" style="height:20px;"></div>

                    <div class="col-lg-12">
                        <asp:GridView ID="uiGridViewRoom" runat="server" AutoGenerateColumns="false" CssClass="table table-hover" AllowPaging="True" OnPageIndexChanging="uiGridViewRoom_PageIndexChanging" HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center" EmptyDataText="لا توجد بيانات">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="الإسم" />
                                <asp:BoundField DataField="TypeName" HeaderText="الترقية" />
                                <asp:BoundField DataField="StartDate" HeaderText="تاريخ البداية" DataFormatString="{0:yyyy/MM/dd}" />
                                <asp:BoundField DataField="EndDate" HeaderText="تاريخ الإنتهاء" DataFormatString="{0:yyyy/MM/dd}"/>
                                <asp:BoundField DataField="createdby" HeaderText="ترقية بواسطة" />
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div class="clear"></div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
