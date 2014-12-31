<%@ Page Title="" Language="C#" MasterPageFile="~/ZahraaAr.Master" AutoEventWireup="true" CodeBehind="videos.aspx.cs" Inherits="Taqwa.Website.videos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
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
         <div class="clear">
    </div>
        </div>
</asp:Content>
