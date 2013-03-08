<%@ Page Language="C#" MasterPageFile="~/MasterPages/LoginMaster.master"  AutoEventWireup="true" CodeFile="SecurityViewer.aspx.cs" Inherits="SecurityViewer" UICulture="ar-EG" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
 <%--<%@ Register Src="~/ui/Usercontrols/ConfirmUserControl.ascx" TagName="ConfirmUserControl" TagPrefix="uc1" %>--%>
<asp:Content ID= "content1" ContentPlaceHolderID = "ContentPlaceHolderMain"  Runat = "server" >
 <table dir="rtl"  border="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
             <tr>
                <td style="height: 1px" align="left">
                    <table width="100%" style="text-align:left">
                        <tr>
                            <td align="left">
                                 <input id="btnBack" type="button" style="width:80px" onclick="history.go(-1)" value="ÑÌæÚ" />
                            </td>
                            <td align="right">
                                <input type="button" id="btnPrint" style="width:80px"
                                onclick="document.getElementById('btnBack').style.display='none';this.style.display='none';window.print();document.getElementById('btnBack').style.display='block';this.style.display='block';"
                                    value="ØÈÇÚå" />
                            </td>
                        </tr>
                    </table>
                     
                     
                    
                    </td>
            </tr>
            <tr style="width:100%;height:100%">   
            
                <td dir="rtl"  align="center" valign="top" style="width:100%;height:100%">
                <div id="report"> 
                   <rsweb:ReportViewer Width="100%" Height="1500px"  ID="UmisReportViewer" runat="server" Font-Names="Verdana" Font-Size="8pt"
                     ProcessingMode="Remote"  ShowBackButton="True" ShowToolBar="false"
                    OnInit="UmisReportViewer_Init" OnReportRefresh="UmisReportViewer_Load"
                     OnLoad="UmisReportViewer_Load" PromptAreaCollapsed="true" 
                    ShowCredentialPrompts="False" SizeToReportContent="true" BackColor="LightGray" 
                        ShowRefreshButton="False">
                       
                    </rsweb:ReportViewer>
                    </div>           
                </td>
            </tr>
        </table>
      
</asp:Content>