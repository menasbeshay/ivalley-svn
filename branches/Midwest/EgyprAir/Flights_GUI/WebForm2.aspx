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
            var editor;
            
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
                     }*/
                    $.mask.definitions['h'] = "[0-2]";
                    $.mask.definitions['l'] = "[0-9]";
                    $.mask.definitions['m'] = "[0-5]";
                    $.mask.definitions['n'] = "[0-9]";
                    $('#DTE_Field_STD, #DTE_Field_STA, #DTE_Field_ChoxOff, #DTE_Field_ChoxOn, #DTE_Field_AB, #DTE_Field_TDown, #DTE_Field_Day, #DTE_Field_Night').mask('hl:mn');

                });
                /*.on('close', function () {
                    $(document).off('keydown.editor');
                });

            $('#sample_editable_1').on('click', 'tbody td', function (e) {
                editor.inline(this, {
                    submitOnBlur: true
                });
            });*/

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
        });

       /* $('#sample_editable_1 tbody td input').live('focus', function (e) {
            $(this).select();
        });

        // attach datepicker on focus and format to return yy-mm-dd    
        $('#sample_editable_1 tbody td input.datepicker').live('focus', function (e) {
            $(this).Datepicker({ dateFormat: 'yy-mm-dd' }).Datepicker("show");
        });*/

        
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
                                        
                                    </tr>
                                    </thead>
                                    <tbody>
                                       
                                    </tbody>
                                </table>
			</div>--%>
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    <br />
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
