<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="SecurityViewer.aspx.cs" Inherits="SecurityViewer" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        @media print
        {
            .noprint
            {
                display: none;
            }
        }
        
        
        ul {
          text-align: right;
          display: inline;
          margin: 0;
          padding: 10px 4px 10px 0;
          list-style: none;
          -webkit-box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
          -moz-box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
          box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
          float:right;
          
        }
        ul li {
          font: bold 12px/18px sans-serif;
          display: inline-block;
          margin-right: -4px;
          position: relative;
          padding: 3px 10px;
          background: #fff;
          cursor: pointer;
          border:1px solid black;
          -webkit-transition: all 0.2s;
          -moz-transition: all 0.2s;
          -ms-transition: all 0.2s;
          -o-transition: all 0.2s;
          transition: all 0.2s;
        }
        ul li a{color:#fff !important;text-decoration:none;}
        ul li:hover {
          background: #555;
          color: #fff;
        }
        ul li ul {
          padding: 0;
          position: absolute;
          top: 20px;
          right: 0;
          width: 100px;
          -webkit-box-shadow: none;
          -moz-box-shadow: none;
          box-shadow: none;
          display: none;
          opacity: 0;
          visibility: hidden;
          -webkit-transiton: opacity 0.2s;
          -moz-transition: opacity 0.2s;
          -ms-transition: opacity 0.2s;
          -o-transition: opacity 0.2s;
          -transition: opacity 0.2s;
        }
        ul li ul li { 
          background: #555; 
          display: block; 
          color: #fff;
          text-shadow: 0 -1px 0 #000;
        }
        ul li ul li:hover { background: #666; }
        ul li:hover ul {
          display: block;
          opacity: 1;
          visibility: visible;
        }
    </style>

    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function printReport(btn) {
            /*if (document.getElementById("ReportFrameUmisReportViewer")) {
             docPrint=window.open("","Print");
            docPrint.document.open();
            docPrint.document.write(frames["ReportFrameUmisReportViewer"].document.documentElement.innerHTML);
            docPrint.document.close();
            docPrint.print();
                
            }
            else {
                $("#UmisReportViewer div:eq(1)").css("display", "none");
                document.getElementById('btnBack').style.display = 'none';
                btn.style.display = 'none';
                window.print();
                $("#UmisReportViewer div:eq(1)").css("display", "inline");
                document.getElementById('btnBack').style.display = 'block';
                btn.style.display = 'block';
          //  }*/
        }
    </script>
</head>
<body>

    <form id="form1" runat="server">
    <div>
    <table dir="rtl"  border="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
             <tr>
                <td style="height: 1px" align="left">
                    <table width="100%" style="text-align:left">
                        <tr>
                            <td align="left" style="width:60%;">
                            <input id="btnBack" type="button" style="width:80px" onclick="history.go(-1)" value="رجوع" />
                            &nbsp;
                                <input type="button" id="btnPrint" style="width:80px"
                                onclick="document.getElementById('btnBack').style.display='none';this.style.display='none';window.print();document.getElementById('btnBack').style.display='block';this.style.display='block';"
                                    value="طباعه" />

                                   
                                    <%--<input type="button" id="btnPrint" style="width:80px"
                                onclick="printReport(this)"
                                    value="طباعه" />--%>     
                            </td>
                            
                            <td style="text-align:right;">
                             <ul>                                    
                                      <li>
                                        حفظ
                                        <ul>
                                          <li>
                                          <asp:LinkButton ID="uiLinkButtonExportPDF" runat="server" 
                                                  onclick="uiLinkButtonExportPDF_Click">PDF</asp:LinkButton>
                                          </li>
                                          <li>
                                          <asp:LinkButton ID="uiLinkButtonExportExcel" runat="server" 
                                                  onclick="uiLinkButtonExportExcel_Click">Excel</asp:LinkButton>
                                          </li>
                                    
                                        </ul>
                                      </li>                                      
                                    </ul>
                            </td>
                        </tr>
                    </table>
                     
                     
                    
                    </td>
            </tr>
            <tr style="width:100%;height:100%">   
            
                <td dir="rtl"  align="center" valign="top" style="height:100%">
                <div id="report"> 
                   <rsweb:ReportViewer Width="800px" Height="1100px"  ID="UmisReportViewer" runat="server" Font-Names="Verdana" Font-Size="8pt"
                     ProcessingMode="Remote"  ShowBackButton="True" ShowToolBar="false"
                    OnInit="UmisReportViewer_Init" OnReportRefresh="UmisReportViewer_Load"
                     OnLoad="UmisReportViewer_Load" PromptAreaCollapsed="true" 
                    ShowCredentialPrompts="False" SizeToReportContent="true" BackColor="LightGray" 
                        ShowRefreshButton="False" >                       
                    </rsweb:ReportViewer>
                    </div>           
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
