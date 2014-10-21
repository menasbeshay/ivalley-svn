function OpenPopup(url, title)
{
    $('#GeneralModalPage #GMP_Title').text(title);
    $('#GeneralModalPage #GMP_Content').attr('src', url);    
    $('#GeneralModalPage').modal('show');
    $('#GeneralModalPage').on('hidden.bs.modal', function () {
        $('#GeneralModalPage #GMP_Content').attr('src', 'about:blank');
    })
}


