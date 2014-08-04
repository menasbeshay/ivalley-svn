<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucsearch.ascx.cs" Inherits="E3zemni_WebGUI.ar.controls.ucsearch" %>

<script type="text/javascript">
		/* <![CDATA[ */
			$(document).ready(function(){
                 var pfrom = $.url().param('pfrom');
                 var pto = $.url().param('pto');
                 if(pfrom == undefined)
                    pfrom = 10;
                if(pto == undefined)
                    pto = 60;
				$(function() {
					$( "#price-range" ).slider({
						range: true,
						min: 1,
						max: 100,
						values: [ pfrom, pto],
						slide: function( event, ui ) {
							$( "#amount" ).val( ui.values[ 0 ] + "جنيه - " + ui.values[ 1 ]  + " جنيه");
						}
					});
					$( "#amount" ).val($( "#price-range" ).slider( "values", 0 ) + "جنيه - " + $( "#price-range" ).slider( "values", 1 ) + " جنيه" );


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
                    if($("<%= uiTextBoxSearch.ClientID %>").val() != "بحث ..." && $("<%= uiTextBoxSearch.ClientID %>").val() != undefined)
                        q = $("<%= uiTextBoxSearch.ClientID %>").val();
                    document.location.href = "browse.aspx?q="+ q +"&pfrom=" + $( "#price-range" ).slider( "values", 0 ) + "&pto=" + $( "#price-range" ).slider( "values", 1 ) + "&c=" + colors + "&s=" + sizes;
                    
                });
			});
		/* ]]> */
		</script>
	<div class="widget">
		<div id="searchwidget" >
            <asp:TextBox ID="uiTextBoxSearch" runat="server"  placeholder="بحث ..."></asp:TextBox>								                                                                
		</div><!-- end form -->
	</div><!-- widget search -->

	<div class="widget clearfix">
		<div class="shop_filter">
			<div class="f_head">السعر</div>
			<div class="f_content">
				<div id="price-range" class="mb mt"></div>                                    
				<p>
                    <asp:TextBox id="amount" disabled="disabled" ClientIDMode="Static" runat="server"></asp:TextBox></p>
			</div>

			<div class="f_head">اللون</div>
			<div class="f_content">                                   
                <asp:Repeater ID="uiRepeaterColors" runat="server" 
                    onitemdatabound="uiRepeaterColors_ItemDataBound">
                <ItemTemplate>
                    <input type='checkbox' name='color' value='<%# Eval("ColorID") %>' id='color_<%# Eval("ColorID") %>' />
                    <asp:Literal ID="uiLiteralLabel" runat="server"></asp:Literal>                                        
                </ItemTemplate>
                </asp:Repeater>
			</div>

			<div class="f_head">المقاس</div>
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

			<a id="filter_button">بحث</a>
		</div>
	</div><!-- widget -->			