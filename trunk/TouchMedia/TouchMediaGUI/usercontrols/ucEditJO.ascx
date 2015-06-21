<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucEditJO.ascx.cs" Inherits="TouchMediaGUI.usercontrols.ucEditJO" %>

<div class="span12 clearfix">
    <div class="span2">
        كود أمر الشغل
    </div>

    <div class="span6">
        <asp:TextBox ID="uiTextBoxJOCode" runat="server"></asp:TextBox>
    </div>
</div>
<div class="span12 clearfix">
    <div class="span2">
        الإسم
    </div>

    <div class="span6">
        <asp:TextBox ID="uiTextBoxName" runat="server"></asp:TextBox>
    </div>
</div>
<div class="span12 clearfix">
    <div class="span2">
        الوصف
    </div>

    <div class="span6">
        <asp:TextBox ID="uiTextBoxDesc" runat="server"></asp:TextBox>
    </div>
</div>
<div class="span12 clearfix">
    <div class="span2">
        العميل
    </div>

    <div class="span6">
        <asp:DropDownList ID="uiDropDownListClient" runat="server"></asp:DropDownList>
    </div>
</div>
<div class="span12 clearfix">
    <div class="span2">
        إختر بيان أو أكثر
    </div>

    <div class="span6" id="DivSections">
        <asp:CheckBoxList ID="uiCheckBoxListSections" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CssClass="checkSections">
            <asp:ListItem Value="1">تصميم</asp:ListItem>
            <asp:ListItem Value="2">طباعة ديجيتال</asp:ListItem>
            <asp:ListItem Value="3">طباعة أوفست</asp:ListItem>
            <asp:ListItem Value="4">طباعة ( خارجى / داخلى )</asp:ListItem>
            <asp:ListItem Value="5">إنتاج</asp:ListItem>
            <asp:ListItem Value="6">هدايا</asp:ListItem>

        </asp:CheckBoxList>
    </div>
</div>
<div class="span12 clearfix">


<div  class="tabbable tabbable-custom tabs-right">
    <ul class="nav nav-tabs tabs-right">
        <li class="active"><a href="#tab1" data-toggle="tab"><span class="current"></span> تصميم</a></li>
        <li><a href="#tab2" data-toggle="tab"><span class="current"></span>طباعة ديجيتال</a></li>
        <li><a href="#tab3" data-toggle="tab"><span class="current"></span>طباعة أوفست</a></li>
        <li><a href="#tab4" data-toggle="tab"><span class="current"></span>طباعة (داخلى / خارجى)</a></li>
        <li><a href="#tab5" data-toggle="tab"><span class="current"></span>إنتاج</a></li>        
        <li><a href="#tab6" data-toggle="tab"><span class="current"></span>هدايا</a></li>        
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab1">
            <div id="DesignGrid"></div>            
        </div>
        <div class="tab-pane" id="tab2">
            2
        </div>
        <div class="tab-pane" id="tab3">
            <div id="OffsetGrid"></div>
            3
        </div>
        <div class="tab-pane" id="tab4">
            <div id="InOutDoorGrid"></div>
            4
        </div>
        <div class="tab-pane" id="tab5">
            5
        </div>
        <div class="tab-pane" id="tab6">
            <div id="GiveawaysGrid"></div>
            6
        </div>       
        
    </div>
    
</div>
</div>
