<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ar.Master" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="brotherssolidarity.projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .pp_content_container {
            direction:ltr;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="uiContentPlaceHolderSlider" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="uiContentPlaceHolderContent" runat="server">
    <div class="page-title title-1">
		<div class="container">
			<div class="row">
				<div class="cell-12">
					<h1 class="fx" data-animate="fadeInLeft">مشروعات</h1>
					<div class="breadcrumbs main-bg fx" data-animate="fadeInUp">
						<span class="bold">أنت هنا:</span><a href="default.aspx">الرئيسية</a><span class="line-separate">/</span><span>مشروعات</span><asp:Literal ID="uiLiteralProjectPath" runat="server"></asp:Literal>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="sectionWrapper">
    <div class="container">
        <asp:Panel ID="uiPanelProjects" runat="server">
            <div id="portfolioGallery-filter" class="portfolio-filterable">
		    <div class="row">
                <asp:Repeater ID="uiRepeaterProjects" runat="server">
                    <HeaderTemplate>
                        <div class="portfolio-items">
                    </HeaderTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                    <ItemTemplate>
                        <div class="cell-3" data-filter="app">
										<div class="portfolio-item">
											<div class="img-holder">
												<div class="img-over">
													<a href='projects.aspx?pid=<%# Eval("ReferenceID") %>' class="fx link"><b class="fa fa-link"></b></a>													
												</div>
												<img alt="" src='/admin/<%# Eval("MainImagePath") %>' style="width:263px;height:175px;">
											</div>
											<div class="name-holder">
											<a href='projects.aspx?pid=<%# Eval("ReferenceID") %>' class="project-name"><%#Eval("NameAr") %></a>											
										</div>
										</div>
									</div>
                    </ItemTemplate>
                </asp:Repeater>
                
                    
                
            </div>
        </div>
        </asp:Panel>
        <asp:Panel ID="uiPanelSingle" runat="server">
            <div class="row">
            <div class="cell-12">
                <div class="cell-6" style="padding-right:0;">
                    <asp:Image ID="uiImageMain" runat="server" />
                </div>
                <div class="cell-6">
                    <asp:Literal ID="uiLiteralProjectDesc" runat="server"></asp:Literal>
                </div>
                
            </div>
            <div class="cell-12" >
                <h3>
                    صور المشروع
                </h3>
                <asp:Repeater ID="uiRepeaterImages" runat="server">
                    <ItemTemplate>
                    <a href='/admin/<%# Eval("ImagePath") %>' class="zoom" data-gal="prettyPhoto[pp_gal]" style="width:150px;height:170px;">
                        <img src='/admin/<%# Eval("ImagePath") %>' style="width:150px;height:170px;"/>
                    </a>
                        </ItemTemplate>
                </asp:Repeater>
            </div>
                </div>
        </asp:Panel>
        
    </div>
        </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="uiContentPlaceHolderScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mi_projects').addClass("selected");
        });
    </script>
</asp:Content>
