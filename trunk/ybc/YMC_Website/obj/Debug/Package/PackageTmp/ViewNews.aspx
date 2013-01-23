<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewNews.aspx.cs" Inherits="YMC_Website.ViewNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">
        $(document).ready(
            function () {
                $("#mi5").addClass("current");
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ContentLeftDiv" style="direction: rtl;">
        <h1>
            الأخبار
        </h1>
        <div class="Details675">
            <div class="clear" style="height: 5px;">
            </div>
            <asp:Panel ID="uiPanelAllNews" runat="server">
                <asp:Repeater ID="uiRepeaterNews" runat="server">
                <HeaderTemplate>
                    <div style="width:80%;margin :0 auto;">
                        <div style="background-color: #003366; color: #fff; width: 50%; padding: 10px; float: right;
                            text-align: center; font-weight: bold;">عنوان الخبر</div>
                        <div style="width: 1px; background-color: #fff; float: right;height:10px"></div>
                        <div style="background-color: #003366; color: #fff; width: 20%; padding: 10px; float: right;
                            text-align: center; font-weight: bold;">اللجنة</div>
                        <div style="width: 1px; background-color: #fff; float: right; height: 10px">
                        </div>
                        <div style="background-color: #003366; color: #fff; width: 21%; padding: 10px; float: right;
                            text-align: center; font-weight: bold;">تاريخ الخبر</div>
                        <div class="clear"></div>                        
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div style="width: 80%; margin: 0 auto;">
                        <div style=" width: 50%; padding: 10px; float: right;
                            text-align: right; font-weight: bold;">
                            <a href="ViewNews.aspx?nid=<%# Eval("NewsID") %>">
                                <%# Eval("Title")%></a>
                                </div>
                        <div style="width: 1px; background-color: #fff; float: right; height: 10px">
                        </div>
                        <div style=" width: 20%; padding: 10px; float: right;
                            text-align: center; font-weight: bold;">
                            <%# Eval("CommiteeName")%></div>
                        <div style="width: 1px; background-color: #fff; float: right; height: 10px">
                        </div>
                        <div style="width: 21%; padding: 10px; float: right;
                            text-align: center; font-weight: bold;">
                            <%# string.Format("{0:dd/MM/yyyy}", Eval("NewsDate"))%></div>
                        <div class="clear">
                        </div>
                        <div style="border: 1px dotted black; width: 95%; margin: 0 auto; color: #666666;padding:10px">
                            <%# Eval("Brief")%>
                        </div>
                        <div class="clear" style="height:5px;">
                        </div>
                        <div style="width: 100%; margin: auto; background-color: #003366; height: 3px">
                        </div>
                        <div class="clear">
                        </div>
                    </div>
                </ItemTemplate>
                </asp:Repeater>
                <div class="clear" style="height: 5px;">
                </div>
                <div style="width: 15%;margin: auto;">
                    <div style="width: 10%; float: left;">
                        <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">التالى</asp:LinkButton>
                    </div>
                    <div style="width: 10%; float: right;">
                        <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click">السابق</asp:LinkButton>
                    </div>
                </div>
                <div class="clear" style="height: 10px;">
                </div>

                <asp:GridView ID="uiGridViewNews" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
                    GridLines="Vertical" HorizontalAlign="Center" 
                    onpageindexchanging="uiGridViewNews_PageIndexChanging" Width="80%">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                <asp:TemplateField HeaderText="عنوان الخبر">
                <ItemTemplate>
                    <a href="ViewNews.aspx?nid=<%# Eval("NewsID") %>">
                        <%# Eval("Title")%></a>
                </ItemTemplate>
                </asp:TemplateField>                   
                    <asp:BoundField DataField="CommiteeName" HeaderText="اللجنة" />
                    <asp:BoundField DataField="NewsDate" HeaderText="تاريخ الخبر" DataFormatString="{0:dd/MM/yyyy}" />
                </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Center" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="uiPanelViewNews" runat="server">
                <div style="font-weight: bold; color: #0B538E; font-size: 16px;">
                    <asp:Label ID="uiLabelTitle" runat="server"></asp:Label></div>
                <div class="clear10">
                </div>
                
                <div>
                    <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
                </div>
                <div class="clear">
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

