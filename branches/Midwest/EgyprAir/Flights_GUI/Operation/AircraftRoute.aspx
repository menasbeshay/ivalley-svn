<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="AircraftRoute.aspx.cs" Inherits="Flights_GUI.Operation.AircraftRoute" %>

<%@ MasterType VirtualPath="~/MasterPages/IFlights.Master" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <script type="text/javascript" src="../scripts/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxgrid.filter.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxgrid.sort.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxgrid.selection.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxgrid.edit.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxgrid.columnsresize.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxradiobutton.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/jqxcheckbox.js"></script>
    <script src="../scripts/jqwidgets/jqxmaskedinput.js"></script>
    <script type="text/javascript" src="../scripts/jqwidgets/globalization/globalize.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            var airports;
            $.ajax({
                url: 'http://localhost:4871/common/commonMethods.asmx/GetAirports',
                async: false,
                success: function (json) {
                    airports = json;
                }
            });

            var source =
            {
                datatype: "json",
                datafields: [
                    { name: 'SectorID', type: 'number' },
                    { name: 'FlightNo', type: 'string' },
                    { name: 'SectorDate', type: 'date' },
                    { name: 'FromID', type: 'string' },
                    { name: 'ToID', type: 'string' },
                    { name: 'STD', type: 'date' },
                    { name: 'STA', type: 'date' },
                    { name: 'AircraftRouteID', type: 'number' }
                ],
                url: "http://localhost:4871/common/commonMethods.asmx/GetSectorsByAircraftRouteID?ID=<%= uiHiddenFieldCurrentACRoute.Value %>"
            };

            var dataAdapter = new $.jqx.dataAdapter(source);

            $("#jqxgrid").jqxGrid(
                {
                    width: 880,
                    source: dataAdapter,
                    filterable: false,
                    showeverpresentrow: true,
                    enablebrowserselection: true,
                    everpresentrowposition: "top",
                    editable: true,
                    autoheight: true,
                    selectionmode: 'checkbox',
                    columns: [
                        {
                            text: 'SectorID', columntype: 'textbox', datafield: 'SectorID', hidden : true
                        },
                        {
                            text: 'AircraftRouteID', columntype: 'textbox', datafield: 'AircraftRouteID', hidden: true
                        },
                      {
                          text: 'Flight No', columntype: 'textbox', datafield: 'FlightNo', width: 130, cellsalign: 'center'
                      },
                      { text: 'Date', datafield: 'SectorDate', width: 200, cellsalign: 'center', cellsformat: 'dd/MM/yyyy',formatString: 'dd/MM/yyyy', columntype: 'datetimeinput' },
                      {
                          text: 'From', datafield: 'FromID', width: 130, columntype: 'dropdownlist', cellsalign: 'center', 
                          createeditor: function (row, column, editor) {
                              editor.jqxDropDownList({ source: airports, autoOpen: true });
                          }
                      },
                      {
                          text: 'To', datafield: 'ToID', width: 130, columntype: 'dropdownlist', cellsalign: 'center',
                          createeditor: function (row, column, editor) {
                              editor.jqxDropDownList({ source: airports, autoOpen: true });
                          }
                      },

                      {
                          text: 'STD', datafield: 'STD', cellsalign: 'center', cellsformat: 'HH:mm', initeditor: function (row, cellvalue, editor, celltext, pressedChar) {
                              editor.jqxMaskedInput({ mask: '[0-2][0-9]:[0-5][0-9]' });
                          },
                          cellsrenderer: function (row, columnfield, value, defaulthtml, columnproperties) {
                              /*var date = new Date(value);
                              var converted = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds()));
                              alert(value + "<br />" + date + "<br />" + converted);

                              return ''+ new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds())) + '';*/
                              //return ''+ value + '';
                              //alert(value);
                          }
                          ,
                             width: 130,
                      },
                      {
                          text: 'STA', datafield: 'STA', cellsalign: 'center', cellsformat: 'HH:mm', initeditor: function (row, cellvalue, editor, celltext, pressedChar) {
                              editor.jqxMaskedInput({ mask: '[0-2][0-9]:[0-5][0-9]' });
                          }, width: 130
                      }
                    ]
                });


            $("#deleterowbutton").on('click', function () {
                var selectedrowindex = $("#jqxgrid").jqxGrid('getselectedrowindex');
                var rowscount = $("#jqxgrid").jqxGrid('getdatainformation').rowscount;
                if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
                    var id = $("#jqxgrid").jqxGrid('getrowid', selectedrowindex);
                    // handle delete sector 
                    var commit = $("#jqxgrid").jqxGrid('deleterow', id);
                }
            });

           

        });

        function SaveSectors()
        {
            var rows = $('#jqxgrid').jqxGrid('getrows');
           
            for (var i = 0; i < rows.length; i++) {
                rows[i].AircraftRouteID = <%= uiHiddenFieldCurrentACRoute.Value %>;
                rows[i].AircraftID= <%= uiDropDownListAircraft.SelectedValue %>;
                if(rows[i].SectorID == null)
                    rows[i].SectorID = 0;
            }
            var str = {Allsectors : rows};
            var readyData = JSON.stringify(str);
            //alert(readyData);
            $.ajax({
                url: 'http://localhost:4871/common/commonMethods.asmx/SaveSectorsToAircraftRoute',
                cache: false,
                type: 'POST',
                data: readyData,
                contentType: 'application/json; charset=utf-8',
                success:
                   function (data) {
                       if (data.bool_result != false) {

                           $('#jqxgrid').jqxGrid('refreshdata');
                       }
                       else {
                          
                       }


                   }

            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="uiHiddenFieldCurrentACRoute" runat="server" Value="0" />
     <asp:Panel ID="uiPanelViewAll" runat="server">
    <div class="span3 clearfix pull-right">
        <asp:LinkButton ID="uiLinkButtonAdd" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonAdd_Click">Add new aircraft route</asp:LinkButton>
        <div class="clearfix">&nbsp;  </div>
    </div>
    <div class="span12 clearfix">
        <telerik:RadGrid ID="uiRadGridAircraftRoute" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" CellSpacing="0" 
                        HorizontalAlign="Center" Skin="Office2007" Width="90%"                         
                        onpageindexchanged="uiRadGridAircraftRoute_PageIndexChanged"                          
                        onitemcommand="uiRadGridAircraftRoute_ItemCommand">
                        <AlternatingItemStyle HorizontalAlign="Center" />
                        <MasterTableView>
                            
                        <Columns>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Name"></telerik:GridBoundColumn>                            
                        <telerik:GridBoundColumn DataField="AircraftRouteDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}"></telerik:GridBoundColumn>                        
                        <telerik:GridTemplateColumn HeaderText="Actions">
                                <ItemTemplate>                                
                                    <asp:LinkButton ID="uiLinkButtonEdit" runat="server" CommandArgument='<%# Eval("AircraftRouteID") %>'
                                        CommandName="EditRoute"><img src="../images/edit.png" alt="Edit" title="Edit" style="border:0;float:none;" /></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="uiLinkButtonDelete" runat="server" CommandArgument='<%# Eval("AircraftRouteID") %>'
                                        CommandName="DeleteRoute" OnClientClick="return confirm('Are you want to delete this record? ');"><img src="../images/delete.png" alt="Delete" title="Delete" style="border:0;float:none;" /></asp:LinkButton>

                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>                            
                        </MasterTableView>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                       
                    </telerik:RadGrid>
    </div>
        </asp:Panel>
     <asp:Panel ID="uiPanelEdit" runat="server">
         <div class="span12 clearfix">
             <div class="span2">Name</div>
             <div class="span4">
                 <asp:TextBox ID="uiTextBoxName" runat="server"></asp:TextBox></div>
         </div>
         <div class="span12 clearfix" style="margin-left:0">
             <div class="span2">Date</div>
             <div class="span4">
                 <telerik:RadDatePicker ID="uiRadDatePickerDate" runat="server"></telerik:RadDatePicker>
             </div>
         </div>       
         <div class="span12 clearfix" style="margin-left:0">
             <div class="span2">Aircraft</div>
             <div class="span4">
                 <asp:DropDownList ID="uiDropDownListAircraft" runat="server"></asp:DropDownList>
             </div>
         </div>                  
         <div class="span12 clearfix" style="margin-left:0">
             <div class="span2">
                 <asp:LinkButton ID="uiLinkButtonSave" runat="server" CssClass="btn btn-primary" OnClick="uiButtonSave_Click">Save</asp:LinkButton></div>
             <div class="span4">
                 <asp:LinkButton ID="uiLinkButtonCancel" runat="server" CssClass="btn btn-primary" OnClick="uiLinkButtonCancel_Click">Cancel & back</asp:LinkButton></div>
             </div>
         <div class="clearfix">&nbsp;  </div>
         <h4>Sectors / Legs</h4>
         <div class="row-fluid">
              
                
                 <input id="deleterowbutton" type="button" value="Delete Selected Row" class="btn" /> &nbsp; <input id="SaveAllSectors" type="button" value="Update Sectors data" class="btn" onclick="SaveSectors();" />
        <div class="clearfix" style="height:5px;"></div>        
    <div id="jqxgrid"></div>
			</div>

         
     </asp:Panel>
    
</asp:Content>
