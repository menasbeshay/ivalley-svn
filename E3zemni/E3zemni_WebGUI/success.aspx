<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/All.Master" AutoEventWireup="true" CodeBehind="success.aspx.cs" Inherits="E3zemni_WebGUI.success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="row clearfix mbs alert alert-success" style="text-align:center;">
					

                        <div style="margin:0 auto;text-align:left;float:none;width:25%">
                            <h1> 
                       Congratulations! </h1>
                       <p style="margin-top:20px;"  >
                           Your order has been processed.<br />
                              Order no:<asp:Label ID="uiLabelON" runat="server" ></asp:Label>
                              </p>
                            
                           
                        </div>
                         <div style="margin:40px auto;">
                                Thank you for Visiting
                                <h1>
                                    E3zemni                                    
                                    
                                </h1>
                            </div>
                        </div>
</asp:Content>
