<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ar.Master" AutoEventWireup="true" CodeBehind="Investors.aspx.cs" Inherits="brotherssolidarity.Investors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="uiContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="uiContentPlaceHolderContent" runat="server">
    <div class="page-title title-1">
		<div class="container">
			<div class="row">
				<div class="cell-12">
					<h1 class="fx" data-animate="fadeInLeft">المستثمرين</h1>
					<div class="breadcrumbs main-bg fx" data-animate="fadeInUp">
						<span class="bold">أنت هنا:</span><a href="default.aspx">الرئيسية</a><span class="line-separate">/</span><a href="#">المستثمرين</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="sectionWrapper">
    <div class="container">
		<div class="row">
                <div id="tabs" class="tabs">
											<ul>
												<li class="skew-25 active"><a href="#" class="skew25">محـاضر مجلـس الإدارة</a></li>
												<li class="skew-25"><a href="#" class="skew25">القوائـــم المـــالية</a></li>
												<li class="skew-25"><a href="#" class="skew25">القوائـــم المـــالية</a></li>
												<li class="skew-25"><a href="#" class="skew25">نمـــاذج الإفصـــاح</a></li>
											</ul>
											<div class="tabs-pane">
												<div class="tab-panel active">
                                                    <asp:GridView ID="uiGridViewFilesCat1" runat="server" CssClass="table-style2">
                                                        <Columns>
                                                            <asp:BoundField DataField="Name" HeaderText="الإسم" />
                                                            <asp:TemplateField HeaderText="تحميل ملف وورد">
                                                                <ItemTemplate>
                                                                <a href='/admin/<%# Eval("WordFilePath") %>' class="btn btn-tiny main-bg skew-25">تحميل</a>
                                                                    </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="تحميل ملف PDF">
                                                                <ItemTemplate>
                                                                <a href='/admin/<%# Eval("FilePath") %>' class="btn btn-tiny main-bg skew-25">تحميل</a>
                                                                    </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
												</div>
												<div class="tab-panel">
													<asp:GridView ID="uiGridViewFilesCat2" runat="server" CssClass="table-style2">
                                                        <Columns>
                                                            <asp:BoundField DataField="Name" HeaderText="الإسم" />
                                                            <asp:TemplateField HeaderText="تحميل ملف وورد">
                                                                <ItemTemplate>
                                                                <a href='/admin/<%# Eval("WordFilePath") %>' class="btn btn-tiny main-bg skew-25">تحميل</a>
                                                                    </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="تحميل ملف PDF">
                                                                <ItemTemplate>
                                                                <a href='/admin/<%# Eval("FilePath") %>' class="btn btn-tiny main-bg skew-25">تحميل</a>
                                                                    </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
												</div>
												<div class="tab-panel">
													 <asp:GridView ID="uiGridViewFilesCat3" runat="server" CssClass="table-style2">
                                                        <Columns>
                                                            <asp:BoundField DataField="Name" HeaderText="الإسم" />
                                                            <asp:TemplateField HeaderText="تحميل ملف وورد">
                                                                <ItemTemplate>
                                                                <a href='/admin/<%# Eval("WordFilePath") %>' class="btn btn-tiny main-bg skew-25">تحميل</a>
                                                                    </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="تحميل ملف PDF">
                                                                <ItemTemplate>
                                                                <a href='/admin/<%# Eval("FilePath") %>' class="btn btn-tiny main-bg skew-25">تحميل</a>
                                                                    </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
												</div>
												<div class="tab-panel">
													 <asp:GridView ID="uiGridViewFilesCat4" runat="server" CssClass="table-style2">
                                                        <Columns>
                                                            <asp:BoundField DataField="Name" HeaderText="الإسم" />
                                                            <asp:TemplateField HeaderText="تحميل ملف وورد">
                                                                <ItemTemplate>
                                                                <a href='/admin/<%# Eval("WordFilePath") %>' class="btn btn-tiny main-bg skew-25">تحميل</a>
                                                                    </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="تحميل ملف PDF">
                                                                <ItemTemplate>
                                                                <a href='/admin/<%# Eval("FilePath") %>' class="btn btn-tiny main-bg skew-25">تحميل</a>
                                                                    </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
												</div>
											</div>
										</div>
            </div>
        
        </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="uiContentPlaceHolderScript" runat="server">
</asp:Content>
