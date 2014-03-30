<%@ Page Title="" Language="C#" MasterPageFile="~/AccountMatster.master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="Taqwa.Website.Results" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainContent">
        <h3>
            نتائج الإمتحانات
        </h3>
        <div class="Right">
            <asp:Label ID="Label14" runat="server" CssClass="Label" Text="السنة الدراسية :"></asp:Label>
        </div>
        <div class="Middle">
            &nbsp;<asp:DropDownList ID="uiDropDownListSchoolYear" runat="server">
            </asp:DropDownList>
        </div>
        <div class="Left">
            &nbsp;
            <asp:Button ID="uiButtonViewResult" runat="server" Text="عرض النتائج" 
                onclick="uiButtonViewResult_Click" /></div>
        <div class="clear">
        </div>
        <asp:Panel ID="uiPanelKids" runat="server" Direction="RightToLeft" Visible="false">
        <table border="0" width="100%" cellspacing="0" cellpadding="0" dir="ltr">
					<tr>
						<td style="text-align:center">
						<span lang="ar-eg" style="font-weight: bold">نتيجة رياض الاطفال</span></td>
					</tr>
					<tr>
						<td>
						<div align="center">
							<table width="700" height="471" border="1" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="211">
					<div align="center">
						<table border="0" width="700" cellspacing="0" cellpadding="0" height="471">
							<tr>
								<td background="images/shahada2.jpg">
								<table border="0" width="100%" cellspacing="0" cellpadding="0">
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>														
                                   
									<tr>
										<td>
										<div align="center">
                                        
											<table border="0" width="420" cellspacing="0" cellpadding="0">
                                            <tr>
                                            <td></td>
                                            <td>
                                            <br /><br /><br />
                                            </td>
                                            </tr>
												<tr>
													<td style="text-align:right">
                                                        <asp:Label ID="uiLabelKidName" runat="server"></asp:Label>
                                                    </td>
													<td width="92" class="tittle_nepete" dir="rtl">
													<strong>أسم الطفل</strong> :</td>
												</tr>
												<tr>
													<td dir="rtl" style="text-align:right">
                                                        <asp:Label ID="uiLabelClass" runat="server"></asp:Label>
                                                    </td>
													<td width="92" dir="rtl" class="tittle_nepete">
													
													<strong>القاعة</strong> :</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td>
										<div align="center">

                                                                            
                                            <asp:DataList ID="uiDataListKidResults" runat="server" HorizontalAlign="Center" 
                                                RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                <HeaderTemplate>
                                                <div style="text-align:center;margin-right:110px;">
                                                <div style="border: 1px solid #AC5155;float:right;">
                                                <div style="border: 1px solid #AC5155;font-weight:bold;width:85px;">
                                                الدرجة
                                                </div>
                                                <div style="border: 1px solid #AC5155;font-weight:bold;height:20px;">
                                                النهاية العظمى
                                                </div>
                                                <div style="border: 1px solid #AC5155;font-weight:bold;height:20px;">
                                                درجات الطفل
                                                </div>
                                                </div>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                 <div style="border: 1px solid #AC5155;float:right;">
                                                <div style="border: 1px solid #AC5155;border-right:0;font-weight:bold;width:85px;">
                                                <%# Eval("ArCourseName") %>
                                                </div>
                                                <div style="border: 1px solid #AC5155;border-right:0;height:20px;">
                                                <%# Eval("MaxGrade") %>
                                                </div>
                                                <div style="border: 1px solid #AC5155;border-right:0;height:20px;">
                                                <%# Eval("Grade") %>
                                                </div>
                                                </div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                </div>
                                                </FooterTemplate>
                                            </asp:DataList>
                                        
										</div>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
										<div align="center">
											<table border="0" width="430" cellspacing="0" cellpadding="0">
												<tr>
													<td class="tittle_nepete" dir="rtl" style="font-weight: bold;text-align:center">
													
													مدير 
													المدرسة</td>
													<td class="tittle_nepete">&nbsp;</td>
													<td width="150" class="tittle_nepete">&nbsp;</td>
													<td class="tittle_nepete" dir="rtl">
													    <strong>رائدة القاعة</strong> :</td>
												</tr>
												<tr>
													<td class="tittle_nepete" dir="rtl" style="font-weight: bold;text-align:center">
													عبد الغنى 
													محمد عبد الغنى</td>
													<td class="tittle_nepete">&nbsp;</td>
													<td class="tittle_nepete">&nbsp;</td>
													<td class="tittle_nepete">&nbsp;</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
					</div>
					</td>
                </tr>
              </table></div>
						</td>
					</tr>
				</table>
        </asp:Panel>
        <asp:Panel ID="uiPanelPrimary" runat="server" Visible="false">
        <table border="0" width="100%" cellspacing="0" cellpadding="0" dir="ltr">
					<tr>
						<td style="text-align:center">
						    <strong>نتيجة المرحلة الابتدائية</strong></td>
					</tr>
					<tr>
						<td>
						<div align="center">
							<table width="700" height="471" border="1" cellpadding="0" cellspacing="0">
                <tr>
                  <td >
					<div align="center">
						<table border="0" width="700" cellspacing="0" cellpadding="0" height="471">
							<tr>
								<td background="images/shahada2.jpg">
								<table border="0" width="100%" cellspacing="0" cellpadding="0">
									<tr>
										<td>
										<div align="center">
											<table border="0" width="400" cellspacing="0" cellpadding="0" height="35">
                                            <tr>
                                            <td>
                                            <br />
                                            <br />
                                            <div style="height:10px;">&nbsp;</div>
                                            </td>
                                            </tr>
												<tr>
													<td style="text-align: right;direction:rtl">
													&nbsp; 
                                                        <asp:Label ID="uiLabelClassPrimary" runat="server" ></asp:Label></td>
													<td width="143">&nbsp;</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>
										<div align="right" style="padding-right:30px;">
											<table border="0" width="100%" cellspacing="0" cellpadding="0">
												<tr>
													<td style="text-align:right;">
                                                        <asp:Label ID="uiLabelStudentName" runat="server"></asp:Label>
                                                    </td>
													<td width="122" class="tittle_petroli" dir="rtl" style="text-align:right;">
													
													<span lang="ar-eg" >أسم 
													الطالب 
													:</span></td>
													<td width="25" class="tittle_petroli">
													
													&nbsp;</td>
												</tr>
												<tr>
													<td dir="rtl">
                                                        <asp:Label ID="uiLabelClassPrim" runat="server"></asp:Label>
                                                    </td>
													<td width="122" class="tittle_petroli" style="text-align:right;">
													<span lang="ar-eg" dir="rtl" >الصف :</span></td>
													<td width="25" dir="rtl" class="tittle_petroli">
													
													&nbsp;</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td>
										<%--<table border="0" width="100%" cellspacing="0" cellpadding="0" dir="rtl">
											<tr>
												
												<td background="images/in2.jpg" >
                                                --%>
                                                <asp:DataList ID="uiDataListCourseInTotalPrimary" runat="server" HorizontalAlign="Center" 
                                                RepeatDirection="Horizontal" RepeatLayout="Flow" style="float:right;direction:rtl;">
                                                <HeaderTemplate>
                                                <div style="text-align:center;margin-right:80px;">
                                                <div style="border: 1px solid #AC5155;float:right;">
                                                <div style="border-bottom: 1px solid #AC5155;font-weight:bold;width:85px;height:130px">
                                                المواد
                                                </div>
                                                <div style="border-bottom: 1px solid #AC5155;font-weight:bold;height:20px;">
                                                النهاية العظمى
                                                </div>
                                                <div style="font-weight:bold;height:20px;">
                                                درجات الطالب
                                                </div>
                                                </div>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                 <div style="border: 1px solid #AC5155;float:right;">
                                                 <div style="position:relative; height:130px;padding-top:10px;vertical-align:middle;">
                                                <div style=" direction:rtl; display:block; font-weight:bold;-ms-writing-mode: bt-rl;width:35px; overflow:visible;white-space:nowrap;
		-webkit-transform: rotate(270deg);	
		-moz-transform: rotate(270deg);
		-ms-transform: rotate(270deg);
		-o-transform: rotate(270deg);
		transform: rotate(270deg);">
                                                <%# Eval("ArCourseName") %>
                                                </div>
                                                </div>
                                                <div style="border-top: 1px solid #AC5155;border-top: 1px solid #AC5155;border-right:0;height:20px;">
                                                <%# Eval("MaxGrade") %>
                                                </div>
                                                <div style="border-top: 1px solid #AC5155;border-right:0;height:20px;">
                                                <%# Eval("Grade") %>
                                                </div>
                                                </div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                </div>
                                                </FooterTemplate>
                                            </asp:DataList>

												
												<%--</td>
												
											</tr>
										</table>--%>
										</td>
									</tr>
									<tr>
										<td>
										<div align="center">
											<table border="0" width="430" cellspacing="0" cellpadding="0">
												<tr>
													<td class="tittle_nepete">
													<p align="center">
													<span lang="ar-eg"><strong>وكيل شئون الطلبة</strong></span></td>
												</tr>
												<tr>
													<td class="tittle_nepete">
													</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
					</div>
					</td>
                </tr>
              </table></div>
						</td>
					</tr>
				</table>
        </asp:Panel>
        <asp:Panel ID="uiPanelPrepratory" runat="server" Visible="false">
        <table border="0" width="100%" cellspacing="0" cellpadding="0" dir="ltr">
					<tr>
						<td>
						<p align="center"><span lang="ar-eg"><strong>نتيجة المرحلة الاعدادية</strong></span></td>
					</tr>
					<tr>
						<td>
						<div align="center">
							<table width="700" height="471" border="1" cellpadding="0" cellspacing="0">
                <tr>
                  <td >
					<div align="center">
						<table border="0" width="700" cellspacing="0" cellpadding="0" height="471">
							<tr>
								<td background="images/shahada2.jpg">
                                 <br />
                                            <br />
                                            <br /> 
                                            <div style="height:12px;">&nbsp;</div>
								<table border="0" width="100%" cellspacing="0" cellpadding="0">
									<tr>
										<td>
										<div align="center">
											<table border="0" width="400" cellspacing="0" cellpadding="0" height="25">
												<tr>
													<td style="text-align: right">
													
													    <asp:Label ID="uiLabelClassPreparatory" runat="server"></asp:Label>
                                                    </td>
													<td width="143">&nbsp;</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td>
										<div align="right"  style="padding-right:30px;">
                                       

											<table border="0" width="100%" cellspacing="0" cellpadding="0" dir="ltr">
												
												<tr>
													<td style="text-align:right">
                                                        <asp:Label ID="uiLabelStudentNamePrep" runat="server"></asp:Label>
                                                    </td>
													<td width="122" class="tittle_petroli" dir="rtl" >
													
													<span lang="ar-eg">أسم 
													الطالب 
													:</span></td>
													<td width="10" class="tittle_petroli">
													
													&nbsp;</td>
												</tr>
												<tr>
													<td dir="rtl">
                                                        <asp:Label ID="uiLabelClassPrep" runat="server"></asp:Label>
                                                    </td>
													<td width="122" dir="rtl" class="tittle_petroli">
													<span lang="ar-eg">الصف :</span></td>
													<td width="10" dir="rtl" class="tittle_petroli">
													
													&nbsp;</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td>
										<table border="0" width="100%" cellspacing="0" cellpadding="0">
											<tr>
												
												<td width="489" height="156" background="images/in3.jpg">
												
                                                <asp:DataList ID="uiDataListPrep" runat="server" HorizontalAlign="Center" 
                                                RepeatDirection="Horizontal" RepeatLayout="Flow" style="float:right;direction:rtl;">
                                                <HeaderTemplate>
                                                <div style="text-align:center;margin-right:80px;">
                                                <div style="border: 1px solid #AC5155;float:right;">
                                                <div style="border-bottom: 1px solid #AC5155;font-weight:bold;width:85px;height:130px">
                                                المواد
                                                </div>
                                                <div style="border-bottom: 1px solid #AC5155;font-weight:bold;height:20px;">
                                                النهاية العظمى
                                                </div>
                                                <div style="font-weight:bold;height:20px;">
                                                درجات الطالب
                                                </div>
                                                </div>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                 <div style="border: 1px solid #AC5155;float:right;">
                                                 <div style="position:relative; height:130px;padding-top:10px;vertical-align:middle;">
                                                <div style=" direction:rtl; display:block; font-weight:bold;-ms-writing-mode: bt-rl;width:35px; overflow:visible;white-space:nowrap;
		-webkit-transform: rotate(270deg);	
		-moz-transform: rotate(270deg);
		-ms-transform: rotate(270deg);
		-o-transform: rotate(270deg);
		transform: rotate(270deg);">
                                                <%# Eval("ArCourseName") %>
                                                </div>
                                                </div>
                                                <div style="border-top: 1px solid #AC5155;border-top: 1px solid #AC5155;border-right:0;height:20px;">
                                                <%# Eval("MaxGrade") %>
                                                </div>
                                                <div style="border-top: 1px solid #AC5155;border-right:0;height:20px;">
                                                <%# Eval("Grade") %>
                                                </div>
                                                </div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                </div>
                                                </FooterTemplate>
                                            </asp:DataList>

												</td>
												
											</tr>
										</table>
										</td>
									</tr>
									<tr>
										<td>
										<div align="center">
											<table border="0" width="430" cellspacing="0" cellpadding="0">
												<tr>
													<td class="tittle_nepete">
													<p align="center">
													<span lang="ar-eg"><strong>وكيل شئون الطلبة</strong></span></td>
												</tr>
												<tr>
													<td class="tittle_nepete">
													<p align="center">&nbsp;</td>
												</tr>
											</table>
										</div>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
					</div>
					</td>
                </tr>
              </table></div>
						</td>
					</tr>
				</table>
        </asp:Panel>
    </div>
</asp:Content>
