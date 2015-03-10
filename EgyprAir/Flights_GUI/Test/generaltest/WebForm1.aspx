<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Flights_GUI.WebForm1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadChart ID="RadChart1" runat="server" Height="700px" Skin="Office2007" Width="1024px"
         DefaultType="Gantt" DataGroupColumn="AirCraft_AirPlaneID" DataSourceID="SqlDataSource1" SeriesOrientation="Vertical"
         >

<Appearance>
<Border Color="134, 134, 134"></Border>
</Appearance>

<Series>
<telerik:ChartSeries Name="1" Type="Gantt" DataXColumn="STD" DataXColumn2="STA" DataYColumn="AirCraft_AirPlaneID" DataYColumn2="AirCraft_AirPlaneID">
<Appearance>
<FillStyle MainColor="69, 115, 167" FillType="Solid"></FillStyle>

<TextAppearance TextProperties-Color="Black"></TextAppearance>

<Border Color="69, 115, 167"></Border>
</Appearance>
</telerik:ChartSeries>
    <telerik:ChartSeries DataXColumn="STD" DataXColumn2="STA" DataYColumn="AirCraft_AirPlaneID" DataYColumn2="AirCraft_AirPlaneID" Name="2" Type="Gantt">
        <Appearance>
            <FillStyle FillType="Solid" MainColor="107, 70, 68">
            </FillStyle>
            <TextAppearance TextProperties-Color="Black">
            </TextAppearance>
            <Border Color="107, 70, 68" />
        </Appearance>
    </telerik:ChartSeries>
</Series>

<Legend>
<Appearance Dimensions-Margins="15%, 2%, 1px, 1px" Dimensions-Paddings="2px, 8px, 6px, 3px">
<ItemTextAppearance TextProperties-Color="Black"></ItemTextAppearance>

<ItemMarkerAppearance Figure="Square"></ItemMarkerAppearance>
</Appearance>
</Legend>

<PlotArea>
<XAxis IsZeroBased="False" AutoScale="False" AutoShrink="False" DataLabelsColumn="SectorDate" MaxValue="3" MinValue="1" Step="5000">
<Appearance Color="134, 134, 134" MajorTick-Color="134, 134, 134" ValueFormat="ShortDate">
<MajorGridLines Width="0" Color="134, 134, 134"></MajorGridLines>

<TextAppearance TextProperties-Color="Black"></TextAppearance>
</Appearance>

<AxisLabel>
<TextBlock>
<Appearance TextProperties-Color="Black"></Appearance>
</TextBlock>
</AxisLabel>
    <Items>
        <telerik:ChartAxisItem Value="1">
            <TextBlock Text="3/17/2015 12:00:00 AM">
            </TextBlock>
        </telerik:ChartAxisItem>
        <telerik:ChartAxisItem Value="2">
            <TextBlock Text="1/29/2015 12:00:00 AM">
            </TextBlock>
        </telerik:ChartAxisItem>
        <telerik:ChartAxisItem Value="3">
            <TextBlock Text="1/16/2015 12:00:00 AM">
            </TextBlock>
        </telerik:ChartAxisItem>
    </Items>
</XAxis>

<YAxis AutoScale="False" MaxValue="2" MinValue="0" Step="10">
<Appearance Color="134, 134, 134" MinorTick-Color="134, 134, 134" MajorTick-Color="134, 134, 134">
<MajorGridLines Color="134, 134, 134"></MajorGridLines>

<MinorGridLines Color="134, 134, 134"></MinorGridLines>

<TextAppearance TextProperties-Color="Black"></TextAppearance>
</Appearance>

<AxisLabel>
<TextBlock>
<Appearance TextProperties-Color="Black"></Appearance>
</TextBlock>
</AxisLabel>
    <Items>
        <telerik:ChartAxisItem>
        </telerik:ChartAxisItem>
        <telerik:ChartAxisItem Value="0">
        </telerik:ChartAxisItem>
        <telerik:ChartAxisItem Value="1">
        </telerik:ChartAxisItem>
        <telerik:ChartAxisItem Value="2">
        </telerik:ChartAxisItem>
    </Items>
</YAxis>

<Appearance>
<FillStyle MainColor="" FillType="Solid"></FillStyle>
</Appearance>
</PlotArea>

<ChartTitle>
<Appearance>
<FillStyle MainColor=""></FillStyle>
</Appearance>

<TextBlock>
<Appearance TextProperties-Font="Arial, 18px" TextProperties-Color="Black"></Appearance>
</TextBlock>
</ChartTitle>

    </telerik:RadChart>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlightReportConnectionString %>" SelectCommand="select FlightID,cast(STD as float) + 2 as STD,cast(STA as float) + 2 as STA, [FlightNo], [AirCraft_AirPlaneID], [SectorDate] FROM [Sector] where SectorDate >= '2015-01-01' ORDER BY [SectorDate] DESC">
    </asp:SqlDataSource>
    </asp:Content>
