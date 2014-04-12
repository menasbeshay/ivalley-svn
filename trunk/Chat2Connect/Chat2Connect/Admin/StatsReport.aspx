<%@ Page Title="إحصائيات" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="StatsReport.aspx.cs" Inherits="Chat2Connect.Admin.StatsReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderhead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-group">
        <div class="col-lg-12 control-label pull-right">
            <h3>إحصائيات الموقع</h3>
        </div>

    </div>
    <div class="form-horizontal blockBox">

        <div class="form-group">
            <div class="col-md-2 control-label pull-right">
                <label>فى الفترة من </label>
            </div>
            <div class="col-md-2 pull-right">
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control datecontrol"></asp:TextBox>

            </div>
            <div class="col-md-1 control-label pull-right">
                <label>إلى </label>
            </div>
            <div class="col-md-2 pull-right">
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control datecontrol"></asp:TextBox>
            </div>
            <div class="col-md-1 pull-right">
                <asp:LinkButton ID="lnkBtnLoadReport" runat="server" class="btn btn-main" OnClick="lnkBtnLoadReport_Click">عرض</asp:LinkButton>
            </div>
        </div>

    </div>
    <div class="col-md-8 pull-right">
        <asp:GridView ID="grdResult" runat="server" AutoGenerateColumns="false" ShowHeader="false" EmptyDataText="لا توجد بيانات" CssClass="table table-condensed">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <%# GetLocalResourceObject(Convert.ToString(Eval("Title"))) %>
                                </ItemTemplate>
                                <ItemStyle Wrap="false" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <%# Eval("Value") %>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
    </div>

</asp:Content>
