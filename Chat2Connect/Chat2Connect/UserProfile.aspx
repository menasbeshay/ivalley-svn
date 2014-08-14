<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Chat2Connect.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="blockBoxshadow pull-right margin20" style="width:66.5%;padding:13px;"> 
            <div style="width:16%;float:right;position:relative;">
                <div class="profileImageEdit">
                <asp:Image ID="uiImageMain" runat="server" ImageUrl="~/images/defaultavatar.png" style="width:130px;" CssClass="img-thumbnail"/>               
                </div>
                <div class="clearfix" style="height:15px;"></div>
                <div style="width:80%;" class="center-block">
                    <i class="icon icon-thumbs-up" style="border:1px solid #808080;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;-ms-border-radius:5px;padding:5px;"></i>
                    &nbsp;<span style="color:#ffd800">112</span>&nbsp;
                    أعجبنى
                </div>
                <div class="clearfix"  style="height:15px;"></div>
                <div style="width:80%;" class="center-block Profilesocials">
                    <asp:HyperLink ID="uiHyperLinkFb" runat="server" Target="_blank"><img src="images/facebook.png" /></asp:HyperLink>
                    &nbsp;&nbsp;
                    <asp:HyperLink ID="uiHyperLinktwitter" runat="server" Target="_blank"><img src="images/twitter.png" /></asp:HyperLink>
                        &nbsp;&nbsp;
                    <asp:HyperLink ID="uiHyperLinkyt" runat="server" Target="_blank"><img src="images/youtube.png" /></asp:HyperLink>
                </div>
            </div>
            <div style="width:81%;float:right;">
                <div>
                    <div class="col-lg-4 pull-right" >
                        <asp:Label ID="Label1" runat="server" Text="الإسم :"></asp:Label>
                        <asp:Label ID="uiLabelName" runat="server"></asp:Label>
                    </div>
                    <div class="col-lg-4 pull-right" >
                        <asp:Label ID="Label2" runat="server" Text="تاريخ الميلاد :"></asp:Label>
                        <asp:Label ID="uiLabelDOP" runat="server" ></asp:Label>
                    </div>
                    <div class="col-lg-3 pull-right" >
                        <asp:Label ID="Label3" runat="server" Text="الديانة :"></asp:Label>
                        <asp:Label ID="uiLabelReligion" runat="server" ></asp:Label>
                    </div>
                    
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 " style="margin:5px 0px;">
                        <asp:Label ID="Label4" runat="server" Text="المهنة :"></asp:Label>
                        <asp:Label ID="uiLabelJob" runat="server" ></asp:Label>
                    </div>
                <div class="clearfix"></div>
                <div  class="col-lg-12" style="margin:5px 0px;">
                    <asp:Label ID="Label5" runat="server" Text="البلد :"></asp:Label>
                        <asp:Label ID="uiLabelCountry" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12" style="margin:5px 0px;">
                    <asp:Label ID="Label6" runat="server" Text="أفضل فريق :"></asp:Label>
                        <asp:Label ID="uiLabelBestTeam" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12" style="margin:5px 0px;">
                    <asp:Label ID="Label7" runat="server" Text="أفضل أكلة :"></asp:Label>
                        <asp:Label ID="uiLabelBestFood" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12" style="margin:5px 0px;">
                    <asp:Label ID="Label8" runat="server" Text="السيارة المفضلة :"></asp:Label>
                        <asp:Label ID="uiLabelBestCar" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-10 pull-right" style="margin:5px 0px;">
                    <asp:Label ID="Label9" runat="server" Text="البلد المفضلة للسياحة :"></asp:Label>
                        <asp:Label ID="uiLabelBestCountry" runat="server" ></asp:Label>
                </div>
               
                
                
            </div>            
        </div>
            
        <div class="blockBoxshadow pull-left margin20" style="width:30%;height:235px;max-height:235px;">
             <asp:Label ID="Label10" runat="server" Text="معلومات عن الحساب"></asp:Label>
            <hr style="background:#ffd800;width:100%;margin:5px auto;"/>
            <div class="clearfix"></div>
           
            <div class="clearfix"></div>
            <div class="col-lg-12" style="margin:8px 0px;padding-right:0px;">
                    <asp:Label ID="Label13" runat="server" Text="لون الصبغة :"></asp:Label>
                        <asp:Label ID="uiLabelAccountType" runat="server" ></asp:Label>
            </div>
            <div class="clearfix"></div>            
            
            
        </div>
        
        <div class="clearfix"></div>
        <div class="blockBoxshadow pull-right col-lg-3 margin20 " style="height:210px;max-height:210px;">
            <div style="padding:5px 0px;">
                <div class="pull-right">الغرف</div>
                <div class="pull-left"></div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
            <div>
                <asp:Repeater ID="uiRepeaterMyRooms" runat="server">
                    <ItemTemplate>
                        <div class="Altodd">
                            <%# Eval("Name") %>
                        </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <div class="Alteven">
                            <%# Eval("Name") %>
                        </div>
                    </AlternatingItemTemplate>
                </asp:Repeater>
            </div>
            <div class="clearfix"></div>

        </div>
        <div class="blockBoxshadow pull-right col-lg-4 margin20" style="width:40%;height:210px;max-height:210px;" id="uiPanelPics" runat="server">
            <div>
                <div class="pull-right">صورى</div>
                
                <div class="clearfix"></div>
                <div class="col-lg-12">
                     <div id="links">
                         <a href="images/defaultavatar.png" data-gallery title="صورة رقم 1" data-description="صورة رقم 1"><img src="images/defaultavatar.png" class="img-thumbnail" style="width:100px;"/>                             
                         </a>                         
                         <a href="images/defaultavatar.png" data-gallery title="صورة رقم 2" data-description="صورة رقم 2"><img src="images/defaultavatar.png" class="img-thumbnail" style="width:100px;"/>                             
                         </a>                         
                     </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12">


            </div>
        </div>
        <div class="blockBoxshadow pull-left col-lg-4 margin20" style="width:30%;height:210px;max-height:210px;">
            <div>
                <div class="pull-right">حائط البروفايل</div>
               
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12" style="margin:15px 0px;">
                <asp:Label ID="uiLabelInterests" runat="server" ></asp:Label>
            </div>
        </div>        
        <div class="clearfix"></div>
</asp:Content>
