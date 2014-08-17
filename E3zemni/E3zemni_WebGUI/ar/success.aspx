<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Ar.Master" AutoEventWireup="true" CodeBehind="success.aspx.cs" Inherits="E3zemni_WebGUI.ar.success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div class="row clearfix mbs alert alert-success" style="text-align:center;">
					

                        <div style="margin:0 auto;text-align:left;float:none;width:25%">
                            <h1> 
                       تهانينا! </h1>
                       <p style="margin-top:20px;"  >
                           تم البدء فى طلبك.<br />
                              رقم الطلب : <asp:Label ID="uiLabelON" runat="server" ></asp:Label>
                              </p>
                            
                           
                        </div>
                         <div style="margin:40px auto;">
                                نشكرك على زيارة 
                                <h1>
                                    E3zemni                                    
                                    
                                </h1>
                            </div>
                        </div>
</asp:Content>
