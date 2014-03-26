<%@ Page Title="" Language="C#" MasterPageFile="~/AccountMatster.Master" AutoEventWireup="true"
    CodeBehind="MonthlyReport.aspx.cs" Inherits="Taqwa.Website.MonthlyReport" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
        <div class="style24" style="color: Green;">
            التقارير الشهرية
        </div>
        <div style="clear: both; height: 10px;">
        </div>
        <div class="Content">
            <div class="Right">
                <asp:Label ID="uiLabelEnglishTitle" runat="server" CssClass="Label" Text="السنة :"></asp:Label>
            </div>
            <div class="Middle">
                <asp:DropDownList ID="uiDropDownListYear" runat="server" Width="100px">
                    <asp:ListItem>2000</asp:ListItem>
                    <asp:ListItem>2001</asp:ListItem>
                    <asp:ListItem>2002</asp:ListItem>
                    <asp:ListItem>2003</asp:ListItem>
                    <asp:ListItem>2004</asp:ListItem>
                    <asp:ListItem>2005</asp:ListItem>
                    <asp:ListItem>2006</asp:ListItem>
                    <asp:ListItem>2007</asp:ListItem>
                    <asp:ListItem>2008</asp:ListItem>
                    <asp:ListItem>2009</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                    <asp:ListItem>2022</asp:ListItem>
                    <asp:ListItem>2023</asp:ListItem>
                    <asp:ListItem>2024</asp:ListItem>
                    <asp:ListItem>2025</asp:ListItem>
                    <asp:ListItem>2026</asp:ListItem>
                    <asp:ListItem>2027</asp:ListItem>
                    <asp:ListItem>2028</asp:ListItem>
                    <asp:ListItem>2029</asp:ListItem>
                    <asp:ListItem>2030</asp:ListItem>
                    <asp:ListItem>2031</asp:ListItem>
                    <asp:ListItem>2032</asp:ListItem>
                    <asp:ListItem>2033</asp:ListItem>
                    <asp:ListItem>2034</asp:ListItem>
                    <asp:ListItem>2035</asp:ListItem>
                    <asp:ListItem>2036</asp:ListItem>
                    <asp:ListItem>2037</asp:ListItem>
                    <asp:ListItem>2038</asp:ListItem>
                    <asp:ListItem>2039</asp:ListItem>
                    <asp:ListItem>2040</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="Left">
                &nbsp;</div>
            <div class="clear">
            </div>
            <div class="Right">
                <asp:Label ID="uiLabelArabicTitle" runat="server" CssClass="Label" Text="الشهر :"></asp:Label>
            </div>
            <div class="Middle">
                <asp:DropDownList ID="uiDropDownListMonth" runat="server" Width="100px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="Left">
                &nbsp;</div>
            <div class="clear">
            </div>
            <div class="Right">
            </div>
            <div class="Middle">
            </div>
            <div class="Left">
                <asp:Button ID="uiButtonViewReport" runat="server" Text="عرض التقارير" 
                    onclick="uiButtonViewReport_Click" />
                &nbsp;</div>
            <div class="clear">
            </div>
            <div class="Right">
            </div>
            <div class="Middle">
            </div>
            <div class="Left">
            </div>
            <div class="clear">
            </div>
            <asp:Panel ID="uiPanelReport" runat="server" Width="100%">
                <div class="Right">
                <h3>
                التقرير الشهرى 
                </h3>
                </div>
                <div class="Middle">
                </div>
                <div class="Left">
                </div>
                <div class="clear">
                </div>
                <div class="Right">
                </div>
                <div class="Middle">
                
                    <asp:Repeater ID="uiRepeaterMonthlyReport" runat="server">
                    <ItemTemplate>
                        <%# Eval("ArDetails") %>
                        <hr />
                    </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="Left">
                </div>
            </asp:Panel>
            <div class="clear">
            </div>
        </div>
    </div>
</asp:Content>
