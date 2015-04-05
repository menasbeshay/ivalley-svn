<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MasterPages/ar.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="brotherssolidarity.Contact" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="uiContentPlaceHolderSlider" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="uiContentPlaceHolderContent" runat="server">
    
	<div class="page-title title-1">
		<div class="container">
			<div class="row">
				<div class="cell-12">
					<h1 class="fx" data-animate="fadeInLeft">أتصل بنا</h1>
					<div class="breadcrumbs main-bg fx" data-animate="fadeInUp">
						<span class="bold">أنت هنا:</span><a href="default.aspx">الرئيسية</a><span class="line-separate">/</span><span>أتصل بنا</span>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="sectionWrapper">
    <div class="container">
		<div class="row">
            <asp:Literal ID="uiLiteralContent" runat="server"></asp:Literal>
        </div>
    </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="uiContentPlaceHolderScript" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#mi_contact').addClass("selected");
        });
    </script>
</asp:Content>