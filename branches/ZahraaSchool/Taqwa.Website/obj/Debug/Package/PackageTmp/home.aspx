<%@ Page Title="" Language="C#" MasterPageFile="~/NewDesign.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Taqwa.Website.home" %>
<%@ Register src="Controls/JoinTerms.ascx" tagname="JoinTerms" tagprefix="uc1" %>
<%@ Register src="Controls/News.ascx" tagname="News" tagprefix="uc2" %>
<%@ Register src="~/Controls/HomeMain.ascx" tagname="homemain" tagprefix="uc3" %>
<%@ Register src="Controls/Vision.ascx" tagname="Vision" tagprefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
						<tr>
							<td valign="top">&nbsp;</td>
							<td width="10">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td valign="top" bgcolor="#FFFFFF">
							<div align="center">
								<table width="644" height="213" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="211">
                    <uc3:homemain ID="HomeMain1" runat="server" />
                    

                     
					  <br />
                      <uc5:Vision ID="Vision1" runat="server" />

                      <div style="float:right;padding:5px;">
                      <a href="images/home1-big.jpg" rel="prettyphoto[chiledranroom]">
									<img src="images/home1.jpg" alt="1"/></a>
                      </div>
                    
					</td>
                </tr>
                <tr>
                  <td>
					<table border="0" width="100%" cellspacing="0" cellpadding="0" style="text-align:center;">
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
							
							<img border="0" src="images/bus-icon.jpg" width="115" height="69"></td>
							<td>&nbsp;</td>
							<td>
							
							<img border="0" src="images/table-icon.jpg" width="91" height="76"></td>
							<td>&nbsp;</td>
							<td>
							
							<img border="0" src="images/resul-icon.jpg" width="100" height="69"></td>
							<td>&nbsp;</td>
							<td>
							
							<img border="0" src="images/time-icon.jpg" width="97" height="83"></td>
						</tr>
						<tr>
							<td>
							<span lang="ar-eg">
							<a href="SchoolBus.aspx">&#1575;&#1578;&#1608;&#1576;&#1610;&#1587; &#1575;&#1604;&#1605;&#1583;&#1585;&#1587;&#1577;</a></span></td>
							<td>&nbsp;</td>
							<td>
							<span lang="ar-eg">
							<a href="Schedule.aspx">&#1580;&#1583;&#1608;&#1604; &#1575;&#1604;&#1581;&#1589;&#1589;</a></span></td>
							<td>&nbsp;</td>
							<td>
							<span lang="ar-eg">
							<a href="Results.aspx">&#1575;&#1604;&#1606;&#1578;&#1610;&#1580;&#1577;</a></span></td>
							<td>&nbsp;</td>
							<td>
							<span lang="ar-eg">
							<a href="Pages.aspx?PID=11">&#1605;&#1608;&#1575;&#1593;&#1610;&#1583; &#1575;&#1604;&#1605;&#1583;&#1585;&#1587;&#1577;</a></span></td>
						</tr>
						</table>
					</td>
                </tr>
              </table></div>
							</td>
							<td width="10 px" valign="top">
							</td>
							<td width="313" valign="top">
							<table border="0" width="100%" cellspacing="0" cellpadding="0">
								<tr>
									<td bgcolor="#31456E" style="padding:5px;">
                                        
                                    <p dir="rtl" class="tittle_blue">
                                    شروط الإلتحاق بالمدرسة
                                    </p>
                                        <uc1:JoinTerms ID="JoinTerms1" runat="server" />
                                        
                                    
                                    </td>
								</tr>
								<tr>
									<td>
									<table border="0" width="100%" cellspacing="0" cellpadding="0">
										<tr>
											<td height="10px"></td>
										</tr>
										<tr>
											<td>
											<p dir="rtl" class="tittle_black" align="center">
											<span lang="ar-eg">**&#1571;&#1582;&#1585; &#1575;&#1604;&#1575;&#1582;&#1576;&#1575;&#1585;**</span></td>
										</tr>
										<tr>
											<td height="7px"></td>
										</tr>
										<tr>
											<td bgcolor="#FFFFFF">
											<div align="center">
												
                                                
                                                <uc2:News ID="News1" runat="server" />
												
                                                
                                                </div>
											</td>
										</tr>
										</table>
									</td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td valign="top" colspan="3" height="10 px"></td>
						</tr>
					</table>
</asp:Content>
