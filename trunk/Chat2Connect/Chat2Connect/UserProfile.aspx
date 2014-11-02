<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Popup.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Chat2Connect.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel runat="server" ID="uipanelProfile">
         <div class="blockBoxshadow pull-right " style="width:66%;padding:13px;"> 
            <div style="width:24%;float:right;position:relative;">
                <div class="profileImageEdit">
                <asp:Image ID="uiImageMain" runat="server" ImageUrl="~/images/defaultavatar.png" style="width:130px;" CssClass="img-thumbnail"/>               
                </div>
                <div class="clearfix" style="height:15px;"></div>
                <div style="width:80%;" class="center-block">
                    <asp:LinkButton ID="uiLinkButtonLike" runat="server" CssClass="btn" ClientIDMode="Static">
                    <i class="icon icon-thumbs-up-alt" style="border:1px solid #808080;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;-ms-border-radius:5px;padding:5px;"></i>
                        </asp:LinkButton>

                    <asp:LinkButton ID="uiLinkButtonUnLike" runat="server" CssClass="btn"  ClientIDMode="Static">
                    <i class="icon icon-thumbs-up" style="border:1px solid #808080;border-radius:5px;-moz-border-radius:5px;-webkit-border-radius:5px;-ms-border-radius:5px;padding:5px;"></i>
                        </asp:LinkButton>

                    &nbsp;<span style="color:#ffd800">
                         <asp:Label ID="uiLabelLikeCount" runat="server" ClientIDMode="Static"/>
                          </span>&nbsp;
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
            <div style="width:72%;float:right;">
                <div>
                    <div class="col-sm-4 pull-right" >
                        <asp:Label ID="Label1" runat="server" Text="الإسم :"></asp:Label>
                        <asp:Label ID="uiLabelName" runat="server"></asp:Label>
                    </div>
                    <div class="col-sm-4 pull-right" >
                        <asp:Label ID="Label2" runat="server" Text="تاريخ الميلاد :"></asp:Label>
                        <asp:Label ID="uiLabelDOP" runat="server" ></asp:Label>
                    </div>
                    <div class="col-sm-3 pull-right" >
                        <asp:Label ID="Label3" runat="server" Text="الديانة :"></asp:Label>
                        <asp:Label ID="uiLabelReligion" runat="server" ></asp:Label>
                    </div>
                    
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-12 " style="margin:5px 0px;">
                        <asp:Label ID="Label4" runat="server" Text="المهنة :"></asp:Label>
                        <asp:Label ID="uiLabelJob" runat="server" ></asp:Label>
                    </div>
                <div class="clearfix"></div>
                <div  class="col-sm-12" style="margin:5px 0px;">
                    <asp:Label ID="Label5" runat="server" Text="البلد :"></asp:Label>
                        <asp:Label ID="uiLabelCountry" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-12" style="margin:5px 0px;">
                    <asp:Label ID="Label6" runat="server" Text="أفضل فريق :"></asp:Label>
                        <asp:Label ID="uiLabelBestTeam" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-12" style="margin:5px 0px;">
                    <asp:Label ID="Label7" runat="server" Text="أفضل أكلة :"></asp:Label>
                        <asp:Label ID="uiLabelBestFood" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-12" style="margin:5px 0px;">
                    <asp:Label ID="Label8" runat="server" Text="السيارة المفضلة :"></asp:Label>
                        <asp:Label ID="uiLabelBestCar" runat="server" ></asp:Label>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-10 pull-right" style="margin:5px 0px;">
                    <asp:Label ID="Label9" runat="server" Text="البلد المفضلة للسياحة :"></asp:Label>
                        <asp:Label ID="uiLabelBestCountry" runat="server" ></asp:Label>
                </div>
               
                
                
            </div>            
        </div>
            
        <div class="blockBoxshadow pull-left " style="width:32%;height:206px;">
             <asp:Label ID="Label10" runat="server" Text="معلومات عن الحساب"></asp:Label>
            <hr style="background:#ffd800;width:100%;margin:5px auto;"/>
           
           <div class="col-sm-12" style="margin:8px 0px;padding-right:0px;">
                    <asp:Label ID="Label11" runat="server" Text="تاريخ الإنشاء :" Font-Bold="true"></asp:Label>
                        <asp:Label ID="uiLabelCreatedDate" runat="server" ></asp:Label>
            </div>
          
            <div class="col-sm-12" style="margin:8px 0px;padding-right:0px;">
                    <asp:Label ID="Label13" runat="server" Text="لون الترقية :" Font-Bold="true" CssClass="col-sm-5 pull-right" style="padding-right:0px;padding-left:0px;"></asp:Label>
                        <asp:Label ID="uiLabelAccountType" runat="server" CssClass="col-sm-4 pull-right"></asp:Label>
            </div>
           
            <div class="col-sm-12" style="margin:8px 0px;padding-right:0px;">
                    <asp:Label ID="Label15" runat="server" Text="تاريخ إنتهاء الترقية :" Font-Bold="true"></asp:Label>
                        <asp:Label ID="uiLabelTypeExpiry" runat="server" ></asp:Label>                 
            </div>
            <div class="clearfix"></div>            
            
            
        </div>
        
        <div class="clearfix"></div>
        <div class="blockBoxshadow pull-right col-sm-3 margin20 " style="height:210px;max-height:210px;margin-right:0px;">
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
        <div class="blockBoxshadow pull-right col-sm-4 margin20" style="width:40%;height:210px;max-height:210px;margin-right:0px;" id="uiPanelPics" runat="server">
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
        <div class="blockBoxshadow pull-left margin20" style="width:32%;height:210px;max-height:210px;margin-left:0px;margin-right:0px;">
            <div>
                <div class="pull-right">حائط البروفايل</div>
               
            </div>
            <div class="clearfix"></div>
            <div class="col-lg-12" style="margin:15px 0px;word-break:break-all;">
                <asp:Label ID="uiLabelInterests" runat="server" ></asp:Label>
            </div>
        </div>        
        <div class="clearfix"></div>
    </asp:Panel>


    <asp:Panel runat="server" ID="uiPanelHideProfile">
        <div class="blockBoxshadow col-sm-12">
             <h3>
                الحساب غير متاح
             </h3>
              <div class="alert alert-warning" style="text-align:center !important;">
                  
       <h5>     
           هذا الحساب غير متاح بناء على رغبة صاحب الحساب.
           </h5>
        </div>
         </div>

    </asp:Panel>

    
</asp:Content>
