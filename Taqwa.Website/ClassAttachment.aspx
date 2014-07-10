<%@ Page Title="" Language="C#" MasterPageFile="~/AccountMatster.master" AutoEventWireup="true" CodeBehind="ClassAttachment.aspx.cs" Inherits="Taqwa.Website.ClassAttachment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mainContent">
<div >
<h2>
    ملفات وفيديو
    </h2>
</div>
<div style="clear:both; height:10px;"></div>
<div class="Content">
    <div class="Right" style="width: 110px">

                <asp:Label ID="Label14" runat="server" CssClass="Label" 
                Text="السنة الدراسية :"></asp:Label>
            </div>
            <div class="Middle">
                &nbsp;<asp:DropDownList ID="uiDropDownListSchoolYear" runat="server" 
                    Width="300px">
                </asp:DropDownList>
            </div>
            <div class="Left">
            &nbsp;</div>
            <div class="clear">
            </div>
    <div class="Right" style="width: 110px">
        <asp:Label ID="Label9" runat="server" CssClass="Label">الصف الدراسى :</asp:Label>
    </div>
    <div class="Middle">
        &nbsp;<asp:DropDownList ID="uiDropDownListClasses" runat="server" AutoPostBack="True"
            OnSelectedIndexChanged="uiDropDownListClasses_SelectedIndexChanged" 
            Width="300px">
        </asp:DropDownList>
    </div>
    <div class="Left">
        &nbsp;</div>
    <div class="clear">
    </div>
    <div class="Right" style="width: 110px">
        <asp:Label ID="Label10" runat="server" CssClass="Label">المادة :</asp:Label>
    </div>
    <div class="Middle">
        &nbsp;<asp:DropDownList ID="uiDropDownListCourses" runat="server" 
                AutoPostBack="True" 
                onselectedindexchanged="uiDropDownListCourses_SelectedIndexChanged"  Width="300px">
                    </asp:DropDownList>
    </div>
    <div class="Left">
        &nbsp;</div>
    <div class="clear" style="height:20px;">
    </div>      
    <div class="Middle" style="width:100%;text-align:center;">
    عرض الملفات و الفيديوهات للصف : "
        <asp:Label ID="uiLabelClass" runat="server" Font-Bold="true"></asp:Label> " و المادة : "
        <asp:Label ID="uiLabelCourse" runat="server" Font-Bold="true"></asp:Label>"
    </div>


    <div class="clear">
    </div>      
    <div class="Middle" style="width:100%">
        <h3>الملفات</h3>
        <asp:GridView ID="uiGridViewAttachment" runat="server" AutoGenerateColumns="False" 
        CellPadding="1" CellSpacing="3"
        AllowPaging="true" 
        onpageindexchanging="uiGridViewAttachment_PageIndexChanging" Width="80%" 
            BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="table table-bordered" >
        <AlternatingRowStyle HorizontalAlign="Center" />
    <Columns>    
    <asp:BoundField  HeaderText="الإسم " DataField="ArTitle" />   
    <asp:BoundField  HeaderText="المدرس" DataField="ArTeacherName" />   
    <asp:TemplateField HeaderText="تحميل الملف" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <a href='<%# Eval("FilePath") %>' target="_blank"><img src='images/d_icon.png' alt='<%# Eval("ArName")%>' title="تحميل" style="width:25px;margin:0 auto;"/>  </a>
        </ItemTemplate>
    </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
    عفواً ، لا توجد بيانات.
    </EmptyDataTemplate>       
    </asp:GridView>
    </div>    
    <div class="clear">
    </div>
    <hr />
    <div class="Middle" style="width:100%">
        <h3>فيديوهات</h3>
         <asp:Repeater ID="uiRepeaterCurrentVedios" runat="server" 
            onitemdatabound="uiRepeaterCurrentVedios_ItemDataBound">
                    <ItemTemplate>
                        <div class="grid_3 pull-right">
                            <a class="title" href='#modal_<%# Container.ItemIndex %>' data-toggle="modal" style="display: block;text-align:center;">
                                <asp:Image ID="uiImageThumb" runat="server" />
                                <div class="clear">
    </div>
                                <%# Eval("ArTitle")%>
                                <br />                                
                                <%# string.Format("{0:dd/MM/yyyy}",Eval("CreatedDate"))%>
                            </a>  
                            <div class="clear">
                            </div>
                            
                            <div id='modal_<%# Container.ItemIndex %>' class='modal fade' role='modal' aria-hidden='true'><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><a class='close pull-left' data-dismiss='modal' aria-hidden='true' style='text-decoration: none;'>×</a><h3 id='myModalLabel1'>فيديو</h3></div><div class='modal-body'><div class='form-horizontal blockBox'><div class='row'><div class='col-sm-12 center'>
                                <asp:Literal ID="uiLiteralIFrame" runat="server"></asp:Literal>
                            </div></div></div></div></div></div></div>
                        </div>                                                                                            
                    </ItemTemplate>
                </asp:Repeater>
                   <div class="clear">
    </div>
                <asp:Panel ID="uiPanelPaging" runat="server" Style="text-align: center; direction: rtl;">
                    <asp:LinkButton ID="uiLinkButtonPrev" runat="server" OnClick="uiLinkButtonPrev_Click"><< السابق</asp:LinkButton>&nbsp;
                    &nbsp;&nbsp;|&nbsp;&nbsp;
                    <asp:LinkButton ID="uiLinkButtonNext" runat="server" OnClick="uiLinkButtonNext_Click">التالى >></asp:LinkButton>
                </asp:Panel>
                   <div class="clear">
    </div>
             
    </div>
</div>
</div>
</asp:Content>
