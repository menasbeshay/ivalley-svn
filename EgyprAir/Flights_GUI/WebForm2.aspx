<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/IFlights.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Flights_GUI.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function findIndex(store, id) {
            for (var i = 0, iLen = store.length ; i < iLen ; i++) {
                if (store[i] && store[i].DT_RowId === id) {
                    return i;
                }
            }
            return -1;
        }

        function pad(str, max) {
            str = str.toString();
            return str.length < max ? pad("0" + str, max) : str;
        }

        


        $(document).ready(function () {
            //SectorTableEditable.init();
            /* var editor;
             
             var airports;
             $.ajax({
                 url: 'common/commonMethods.asmx/GetAirports',
                 async: false,
                 success: function (json) {
                     airports = json;
                 }
             });
            
             if (!localStorage.getItem('datatable_todo')) {
                 localStorage.setItem('datatable_todo', '[]');
             }
             else {
                 // Loop over the array, removing any nulls from previous deletes on init
                 var a = JSON.parse(localStorage.getItem('datatable_todo'));
                 for (var i = a.length - 1 ; i >= 0 ; i--) {
                     if (a[i] === null) {
                         a.splice(i, 1);
                     }
                 }
                 localStorage.setItem('datatable_todo', JSON.stringify(a));
             }
 
             editor = new $.fn.dataTable.Editor({                
                 table: "#sample_editable_1",
                 fields:
                     [
                         { label: "Flight No.", name: "FlightNo" },
                         { label: "Date", name: "Date", type: "date" },
                         { label: "Aircraft registration", name: "AirCraftRegistration", type: "select", options: airports },
                         { label: "From", name: "From", type: "select", options: airports },
                         { label: "To", name: "To", type: "select", options: airports },
                         { label: "STD", name: "STD" },
                         { label: "STA", name: "STA" },
                         { label: "Is Heavy", name: "IsHeavy", type: "checkbox", options: [""] },
                         { label: "Night city", name: "NightCity", type: "select", options: airports },
                         { label: "F/O As PF", name: "FOASPF", type: "checkbox", options: [""] },
                         { label: "Chox off", name: "ChoxOff" },
                         { label: "A/B", name: "AB" },
                         { label: "T/Down", name: "TDown" },
                         { label: "Chox on", name: "ChoxOn" },
                         { label: "Day", name: "Day" },
                         { label: "Night", name: "Night" },
                         { label: "PlanBurnOff", name: "Plan Burn Off" },
                         { label: "Actual Burn Off", name: "ActualBurnOff" },
                         { label: "Dep. Fuel", name: "DepFuel" },
                         { label: "Arr. Fuel", name: "ArrFuel" },
                         { label: "Fuel Uplifted", name: "FuelUplifted" },
                         { label: "Receipt no.", name: "ReceiptNo" },
                         { label: "On Board Fuel", name: "OnBoardFuel" },
                         { label: "ZFW", name: "ZFW" },
                         { label: "TOW", name: "TOW" },
                         { label: "No. of PAX", name: "NoOfPAX" },
                         { label: "A", name: "NoOFPax_A" },
                         { label: "CH", name: "NoOFPax_CH" },
                         { label: "I", name: "NoOFPax_I" },                        
                         
                 ],
                 display: "details",
                 ajax: function (method, url, data, successCallback, errorCallback) {
                     var id = null;
                     var store = JSON.parse(localStorage.getItem('datatable_todo'));
 
                     if (data.action === 'create') {
                         store.push({
                             "DT_RowId": 'row_' + store.length,
                             "item": data.data.item,
                             "status": data.data.status
                         });
                         id = 'row_' + (store.length - 1);
                     }
                     else if (data.action === 'edit') {
                         var index = findIndex(store, data.id);
                         store[index].item = data.data.item;
                         store[index].status = data.data.status;
                         id = data.id;
                     }
                     else if (data.action === 'remove') {
                         for (var i = 0, iLen = data.id.length ; i < iLen ; i++) {
                             var index = findIndex(store, data.id[i]);
                             if (index >= 0) {
                                 store[index] = null; // Don't upset the indexes
                             }
                         }
                     }
 
                     localStorage.setItem('datatable_todo', JSON.stringify(store));
                     successCallback({ "id": id });
                 },
                 
                 
             });
 
 
             
             
             editor
                 .on('open', function (e, type) {
                     /*if (type === 'inline') {
                          // Listen for a tab key event when inline editing
                          $(document).on('keydown.editor', function (e) {
                              if (e.keyCode === 9) {
                                  e.preventDefault();
  
                                  // Find the cell that is currently being edited
                                  var cell = $('div.DTE').parent();
  
                                  if (e.shiftKey && cell.prev().length && cell.prev().index() !== 0) {
                                      // One cell to the left (skipping the first column)
                                      cell.prev().click();
                                  }
                                  else if (e.shiftKey) {
                                      // Up to the previous row
                                      cell.parent().prev().children().last(0).click();
                                  }
                                  else if (cell.next().length) {
                                      // One cell to the right
                                      cell.next().click();
                                  }
                                  else {
                                      // Down to the next row
                                      cell.parent().next().children().eq(1).click();
                                  }
                              }
                          });
                      }
                     $.mask.definitions['h'] = "[0-2]";
                     $.mask.definitions['l'] = "[0-9]";
                     $.mask.definitions['m'] = "[0-5]";
                     $.mask.definitions['n'] = "[0-9]";
                     $('#DTE_Field_STD, #DTE_Field_STA, #DTE_Field_ChoxOff, #DTE_Field_ChoxOn, #DTE_Field_AB, #DTE_Field_TDown, #DTE_Field_Day, #DTE_Field_Night').mask('hl:mn');
 
                 });
                 .on('close', function () {
                     $(document).off('keydown.editor');
                 });
 
             $('#sample_editable_1').on('click', 'tbody td', function (e) {
                 editor.inline(this, {
                     submitOnBlur: true
                 });
             });
 
             var table = $('#sample_editable_1').DataTable({
                 dom: "Tfrtip",
                 ajax: {
                     "url": "common/commonMethods.asmx/GetFlightSectors?FlightID=979",
                     "type": "Get",
                     "dataSrc": ""
                   //  "data": "{FlightID : 979}"
                 },
                 columns: [
                     { data: "FlightNo" },
                     { data: "Date" },
                     { data: "From" },
                     { data: "To" },
                     { data: "STD" },
                     { data: "STA" }                    
                 ],
                 order: [1, 'asc'],
                 tableTools: {
                     sRowSelect: "os",
                     aButtons: [
                         { sExtends : "editor_create", editor: editor, sButtonText: "Add new sector" },
                         { sExtends: "editor_edit", editor: editor },
                         { sExtends: "editor_remove", editor: editor }
                     ]
                 }
             });
         });*/

          /*  $('#sample_editable_1 tbody td input').live('focus', function (e) {
                $(this).select();
            });

            // attach datepicker on focus and format to return yy-mm-dd    
            $('#sample_editable_1 tbody td input.datepicker').live('focus', function (e) {
                $(this).Datepicker({ dateFormat: 'yy-mm-dd' }).Datepicker("show");
            });*/

            /* Init DataTables */
            var oTable = $('#sample_editable_1').dataTable();

            /* Apply the jEditable handlers to the table */
            oTable.$('td').editable(/*'../examples_support/editable_ajax.php', {
                "callback": function (sValue, y) {
                    var aPos = oTable.fnGetPosition(this);
                    oTable.fnUpdate(sValue, aPos[0], aPos[1]);
                },
                "submitdata": function (value, settings) {
                    return {
                        "row_id": this.parentNode.getAttribute('id'),
                        "column": oTable.fnGetPosition(this)[2]
                    };
                },
                "height": "14px",
                "width": "100%"
            }*/);
        });

        
    </script>
    
    <script type="text/javascript" src="scripts/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxgrid.filter.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxgrid.sort.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxgrid.selection.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxgrid.edit.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxgrid.columnsresize.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxradiobutton.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/jqxcheckbox.js"></script>
    <script src="Scripts/jqwidgets/jqxmaskedinput.js"></script>
    <script type="text/javascript" src="scripts/jqwidgets/globalization/globalize.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            var airports;
            $.ajax({
                url: 'common/commonMethods.asmx/GetAirports',
                async: false,
                success: function (json) {
                    airports = json;
                }
            });

        $("#jqxgrid").jqxGrid(
            {
                width: 850,
                filterable: false,
                showeverpresentrow: true,
                enablebrowserselection: true,
                everpresentrowposition: "bottom",
                editable: true,
                selectionmode: 'checkbox',
                columns: [
                  {
                      text: 'Flight No', columntype: 'textbox', datafield: 'FlightNo', width: 130
                  },
                  { text: 'Date', datafield: 'date', width: 200, cellsalign: 'right', cellsformat: 'dd/MM/yyyy', columntype: 'datetimeinput' },
                  {
                      text: 'From', datafield: 'From_AirportID', width: 130, columntype: 'dropdownlist',
                      createeditor: function (row, column, editor) {                          
                          editor.jqxDropDownList({ source: airports, autoOpen: true });
                      }
                  },
                  {
                      text: 'To', datafield: 'To_AirportID', width: 130, columntype: 'dropdownlist',
                      createeditor: function (row, column, editor) {
                          editor.jqxDropDownList({ source: airports, autoOpen: true });
                      }
                  },
                  
                  {
                      text: 'STD', datafield: 'STD', cellsalign: 'right', initeditor: function (row, cellvalue, editor, celltext, pressedChar) {
                          editor.jqxMaskedInput({ mask: '[0-2][0-9]:[0-5][0-9]' });
                      }, width:130
                  },
                  {
                      text: 'STA', datafield: 'STA', cellsalign: 'right', initeditor: function (row, cellvalue, editor, celltext, pressedChar) {
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
                var commit = $("#jqxgrid").jqxGrid('deleterow', id);
            }
        });

        });
    </script>
    <style type="text/css">
        div.DTE_Body div.DTE_Body_Content div.DTE_Field {
            clear:initial;
            clear:none;
            width:45%;
            float:left;
            padding:5px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="row-fluid">
               <button id="sample_editable_1_new" class="btn green">
                                            Add New sector <i class="icon-plus"></i>
                                        </button>
                <div class="clearfix" style="height:5px;"></div>        
                 <table class="table table-striped table-hover table-bordered " id="sample_editable_1">
                                    <thead>
                                    <tr>         
                                        <th>Flight No.</th> 
                                        <th>Date</th>
                                        <th>From</th>
                                        <th>To</th>
                                        <th>STD</th>
                                        <th>STA</th>
                                        <th>Edit</th>
                                        <th>delete</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                       <td>Date</td>
                                        <td>From</td>
                                        <td>To</td>
                                        <td>STD</td>
                                        <td>STA</td>
                                        <td>Edit</td>
                                        <td>delete</td>
                                    </tr>
                                    </tbody>
                                </table>
			</div>--%>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <br />
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <input id="deleterowbutton" type="button" value="Delete Selected Row" />
    <div id="jqxgrid"></div>
</asp:Content>
