function OpenPopup(url, title)
{
    $('#GeneralModalPage #GMP_Title').text(title);
    $('#GeneralModalPage #GMP_Content').attr('src',"../PopupPages/" + url);
    $('#GeneralModalPage').modal('show');
}