function myFunction() {
    $('.ui-widget-overlay').remove();

    $(".dialog-modal").dialog({
        modal: true,
        width: 650,
        open: function (type, data) { $(this).parent().appendTo("#<%= uiUpdatePanelPopups.ClientID %>"); },
        close: function (event, ui) {
            //this.html('');
            $(this).dialog('destroy');
            $('.ui-widget-overlay').remove();
        }
    });
}