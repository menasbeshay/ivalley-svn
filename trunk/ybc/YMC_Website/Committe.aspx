<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Committe.aspx.cs" Inherits="YMC_Website.Committe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#mi7").addClass("current");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="direction: rtl;">
        <h1>
            أعضاء اللجنة</h1>
        <div class="clear" style="height: 10px;">
        </div>
            <asp:DataList ID="uiDataListPersons" runat="server" HorizontalAlign="Center" RepeatColumns="2"
                Width="90%" onitemdatabound="uiDataListPersons_ItemDataBound">
                
                <ItemTemplate>
                    <div class="services">
                        <div class="img">
                            <asp:Image ID="uiImageService" runat="server" />
                        </div>
                        <div class="serv_data">
                            <div class="title">
                                <%# Eval("Name") %>                                
                            </div>
                            <div>
                            <%# Eval("Details") %>
                            </div>
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </ItemTemplate>                
            </asp:DataList>
            <div style="width: 15%;padding-right:50px;">
                
                <div style="width: 10%; float: left;">
                    <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">التالى</asp:LinkButton>
                </div>
                <div style="width: 10%; float: right;">
                    <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click">السابق</asp:LinkButton>
                </div>
            </div>
            <div class="clear" style="height: 10px;">
        </div>
        </div>
</asp:Content>
