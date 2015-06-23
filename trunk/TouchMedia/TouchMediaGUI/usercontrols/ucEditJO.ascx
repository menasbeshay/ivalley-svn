<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucEditJO.ascx.cs" Inherits="TouchMediaGUI.usercontrols.ucEditJO" %>

<div class="span12 clearfix">
    <div class="span2">
        كود أمر الشغل
    </div>

    <div class="span4">
        <asp:TextBox ID="uiTextBoxJOCode" runat="server"></asp:TextBox>
    </div>


    <div class="span2">
        الإسم
    </div>

    <div class="span4">
        <asp:TextBox ID="uiTextBoxName" runat="server"></asp:TextBox>
    </div>
</div>
<div class="span12 clearfix">
    <div class="span2">
        الوصف
    </div>

    <div class="span4">
        <asp:TextBox ID="uiTextBoxDesc" runat="server" TextMode="MultiLine" Rows="4" Columns="20"></asp:TextBox>
    </div>

    <div class="span2">
        العميل
    </div>

    <div class="span4">
        <asp:DropDownList ID="uiDropDownListClient" runat="server"></asp:DropDownList>
    </div>
</div>
<div class="span12 clearfix">
    <div class="span2">
        الحالة
    </div>

    <div class="span4">
        <asp:DropDownList ID="uiDropDownListJOStatus" runat="server"></asp:DropDownList>
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
            <div class="span12 clearfix">
                <div class="span2">
                    نوع الطباعة
                </div>
                <div class="span6">
                    <asp:CheckBoxList CssClass="checkSections"  ID="uiCheckBoxListDigitalItem" runat="server" RepeatDirection="Horizontal" RepeatColumns="4"></asp:CheckBoxList>
                </div>
                
            </div>
            <div class="span12 clearfix">
                <div class="span2">
                    R / R&V
                </div>
                <div class="span2">
                    <asp:RadioButtonList CssClass="checkSections"  ID="uiRadioButtonListRRV" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                        <asp:ListItem Text="R" Value="False" />
                        <asp:ListItem Text="R & V" Value="True" />
                    </asp:RadioButtonList>
                </div>
            </div>
             <div class="span12 clearfix">
                <div class="span2">
                    خدمات 
                </div>
                <div class="span5">
                    <asp:CheckBoxList CssClass="checkSections"  ID="uiCheckBoxListServiceType" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"></asp:CheckBoxList>
                </div>
                
            </div>
            <div class="span12 clearfix">
                <div class="span2">
                    R / R&V
                </div>
                <div class="span2">
                    <asp:RadioButtonList CssClass="checkSections"  ID="uiRadioButtonListRRV2" runat="server" RepeatDirection="Horizontal" RepeatColumns="2">
                        <asp:ListItem Text="R" Value="False" />
                        <asp:ListItem Text="R & V" Value="True" />
                    </asp:RadioButtonList>
                </div>
            </div>
             <div class="span12 clearfix">
                <div class="span2">
                    المطبعة 
                </div>
                <div class="span5">
                    <asp:DropDownList ID="uiDropDownListDigitalPrintingSupplier" runat="server"></asp:DropDownList>
                </div>
                <div class="span2">
                    التسليم إلى
                </div>
                <div class="span2">
                    <asp:DropDownList ID="uiDropDownListDPDeliveryTo" runat="server">
                        <asp:ListItem Text="المكتب" />
                        <asp:ListItem Text="العميل" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="span12 clearfix">
                <div class="span2">
                    الملف 
                </div>
                <div class="span5">
                    <asp:FileUpload ID="uiFileUploadDigitalFile" runat="server" />
                </div>
                <div class="span2">
                    الكمية
                </div>
                <div class="span2">
                    <asp:TextBox ID="uiTextBoxDigitalQty" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="tab-pane" id="tab3">
             <div class="span12 clearfix">
                <div class="span2">
                    نوع الورق
                </div>
                <div class="span5">
                    <asp:RadioButtonList CssClass="checkSections"  ID="uiRadioButtonListPaperType" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"></asp:RadioButtonList>
                </div>
                
            </div>
             <div class="span12 clearfix">
                 <div class="span2">
                    GSM
                </div>
                <div class="span6">
                    <asp:RadioButtonList CssClass="checkSections"  ID="uiRadioButtonListGSM" runat="server" RepeatDirection="Horizontal" RepeatColumns="4"></asp:RadioButtonList>
                </div>
             </div>
             <div class="span12 clearfix">
                <div class="span2">
                    المطبعة 
                </div>
                <div class="span5">
                    <asp:DropDownList ID="uiDropDownListOffsetPrintHouse" runat="server"></asp:DropDownList>
                </div>
                
            </div>
            <div class="span12 clearfix">
                <div class="span2">
                    إنهاء بواسطة 
                </div>
                <div class="span5">
                    <asp:DropDownList ID="uiDropDownListOffsetPrintingFinishingBy" runat="server"></asp:DropDownList>
                </div>
                
            </div>
            <div class="span12 clearfix">
                <div class="span2">
                    نوع الخدمة
                </div>
                <div class="span6">
                    <asp:CheckBoxList CssClass="checkSections"  ID="uiCheckBoxListOffsetFinishType" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"></asp:CheckBoxList>
                </div>
            </div>
            <div class="span12 clearfix">
                <div class="span2">
                    الملف 
                </div>
                <div class="span5">
                    <asp:FileUpload ID="uiFileUploadOffsetFile" runat="server" />
                </div>
                <div class="span2">
                    الكمية
                </div>
                <div class="span2">
                    <asp:TextBox ID="uiTextBoxOffsetQty" runat="server"></asp:TextBox>
                </div>
            </div>
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
        </div>       
        
    </div>
    
</div>
</div>
<div class="span12 clearfix">
    <div class="span2">
        </div>
    <div class="span2">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primaty">حفظ</asp:LinkButton>
    </div>
    <div class="span2">
        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-default">إلغاء</asp:LinkButton>
    </div>
</div>