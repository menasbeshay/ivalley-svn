<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSearch.ascx.cs" Inherits="E3zemni_WebGUI.controls.ucSearch" %>

<script type="text/javascript">
		/* <![CDATA[ */
			$(document).ready(function(){
                 var pfrom = $.url().param('pfrom');
                 var pto = $.url().param('pto');
                 if(pfrom == undefined)
                    pfrom = 100;
                if(pto == undefined)
                    pto = 500;
				$(function() {
					$( "#price-range" ).slider({
						range: true,
						min: 0,
						max: 3000,
						values: [ pfrom, pto],
						slide: function( event, ui ) {
							$( "#amount" ).val( "EGP " + ui.values[ 0 ] + " - EGP " + ui.values[ 1 ] );
						}
					});
					$( "#amount" ).val( "EGP " + $( "#price-range" ).slider( "values", 0 ) +" - EGP " + $( "#price-range" ).slider( "values", 1 ) );


				});

                $("#filter_button").click(function(){                    
                    var sizes = $('input[name=size]:checked').map(function()
                    {
                        return $(this).val();
                    }).get();

                    var colors = $('input[name=color]:checked').map(function()
                    {
                        return $(this).val();
                    }).get();

                    q = "";
                    if($("<%= uiTextBoxSearch.ClientID %>").val() != "Search..." && $("<%= uiTextBoxSearch.ClientID %>").val() != undefined)
                        q = $("<%= uiTextBoxSearch.ClientID %>").val();
                    document.location.href = "browse.aspx?q="+ q +"&pfrom=" + $( "#price-range" ).slider( "values", 0 ) + "&pto=" + $( "#price-range" ).slider( "values", 1 ) + "&c=" + colors + "&s=" + sizes;
                    
                });
			});
		/* ]]> */
		</script>
	<div class="widget">
		<div id="searchwidget" >
            <asp:TextBox ID="uiTextBoxSearch" runat="server"  placeholder="Search..."></asp:TextBox>								                                                                
		</div><!-- end form -->
	</div><!-- widget search -->

	<div class="widget clearfix">
		<div class="shop_filter">
			<div class="f_head">Filter by Price</div>
			<div class="f_content">
				<div id="price-range" class="mb mt"></div>                                    
				<p>
                    <asp:TextBox id="amount" disabled="disabled" ClientIDMode="Static" runat="server"></asp:TextBox></p>
			</div>

			<div class="f_head">Filter by Color</div>
			<div class="f_content">                                   
                <asp:Repeater ID="uiRepeaterColors" runat="server" 
                    onitemdatabound="uiRepeaterColors_ItemDataBound">
                <ItemTemplate>
                    <input type='checkbox' name='color' value='<%# Eval("ColorID") %>' id='color_<%# Eval("ColorID") %>' />
                    <asp:Literal ID="uiLiteralLabel" runat="server"></asp:Literal>                                        
                </ItemTemplate>
                </asp:Repeater>
			</div>

			<div class="f_head">Filter by Dimension</div>
			<div class="f_content">
				<div class="checkbox_sizes">
                    <asp:Repeater ID="uiRepeaterSizes" runat="server" 
                    onitemdatabound="uiRepeaterSizes_ItemDataBound">
                <ItemTemplate>
                    <input type='checkbox' name='size' value='<%# Eval("DimensionID") %>' id='size_<%# Eval("DimensionID") %>' />
                    <asp:Literal ID="uiLiteralLabel" runat="server"></asp:Literal>                                        
                </ItemTemplate>
                </asp:Repeater>										
				</div>
			</div>

			<a id="filter_button">Filter</a>
		</div>
	</div><!-- widget -->																		