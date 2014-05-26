<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Home.Master" AutoEventWireup="true" CodeBehind="lock.aspx.cs" Inherits="Chat2Connect._lock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .HomeInner {
            min-height:650px !important;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-6 center-block animateIcon" style="padding:80px;float:none !important;color:#fff;">
        <%--<div class="col-lg-3 pull-right" style="background-color:#FEC200;height:210px;padding:10px;border-left:5px solid #fff;">
            <img src="../images/defaultavatar.png" style="width:90%;"/>
            <div class="clear"></div>
        </div>--%>
        <%--<div class="col-lg-5 pull-right" style="padding:40px;height:210px;background-color:#595858;border-left:5px solid #fff;">
           <h2 style="color:#fff;">أبو ستيف</h2>
            <p>michlosoft@hotmail.com</p>
            <div class="clear"></div>
        </div>--%>
        <div class="col-lg-6 pull-right" style="background-color:#FEC200;height:210px;text-align:center;padding:20px 10px;color:#595858;border-left:5px solid #fff;font-size:40px;">
            <div class="singleuser">
                <i class="icon-lock" style="font-size:120px;"></i>
                <br />
                سكون
                <div class="clear"></div>
            </div>
        </div>
        <div class="col-lg-6 pull-right" style="background-color:#595858;height:210px;text-align:center;padding:50px 10px;color:#595858;">
            <img src="images/logo.png" style="width:70%;"/>
            <div class="clear"></div>
        </div>
        <div class="clear" style="height:1px;"></div>
        
        <div class="col-lg-12 pull-right" style="background-color:#FEC200;height:210px;color:#595858;padding:95px 10px;border-top:5px solid #fff;text-align:center;">
            <div style="width:60%;margin:0 auto;">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="uiLinkButtonLogin">
            <asp:TextBox ID="uiTextBoxPassword" runat="server" placeholder="كلمة المرور" CssClass="form-control pull-right" style="width:80%;" TextMode="Password"></asp:TextBox>
            <asp:LinkButton ID="uiLinkButtonLogin" runat="server" CssClass="btn btn-default pull-right" style="margin-right:-1px;" OnClick="uiLinkButtonLogin_Click"><i class=" icon-arrow-left"></i></asp:LinkButton>            
                    </asp:Panel>
            <div class="clear"></div>    
            </div>
            <div class="clear"></div>
        </div>
        <%--<div class="col-lg-5 pull-right " style="height:210px;text-align:center;padding:50px 10px;background-color:#595858;border-left:5px solid #fff;">
            <div class="singleuser">
            <i class="icon-user" style="font-size:80px;"></i>
            &nbsp;الدخول بمستخدم أخر
                </div>
            <div class="clear"></div>
        </div>
        <div class="col-lg-4 pull-right" style="background-color:#FEC200;height:210px;text-align:center;padding:50px 10px;color:#595858;">
            <div class="singleuser">
            <i class="icon-key" style="font-size:80px;"></i>
            &nbsp;نسيت كلمة المرور؟
                </div>
            <div class="clear"></div>
        </div>--%>
        <div class="clear" style="height:5px;"></div>
    </div>
</asp:Content>
