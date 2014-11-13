function OpenPopup(url, title)
{
    $('#GeneralModalPage #GMP_Title').text(title);
    if (window.parent.location.href.toLowerCase().indexOf("admin") > -1)
        url = "../" + url;
    $('#GeneralModalPage #GMP_Content').attr('src', url);    
    $('#GeneralModalPage').modal('show');
    $('#GeneralModalPage').on('hidden.bs.modal', function () {
        $('#GeneralModalPage #GMP_Content').attr('src', 'about:blank');
    })
}


