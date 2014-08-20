var accountVM;
function account()
{
    var self = this;
    self.accounts = ko.observableArray();
    self.email = ko.observable();
    self.email.subscribe(function (newValue) {
        self.SearchAccounts();
    });
    self.SearchAccounts = function () {
        $('#loadingResetPass').css('display', 'block');
        $('#noAccounts').css('display', 'none');
        $('#error').css('display', 'none');
        $.ajax({
            url: '../Services/Services.asmx/SearchAccountsByMail',
            dataType: 'json',
            type: 'post',
            data: "{'email':'" + self.email()+ "' }",
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                if (data.d != null || data.d != undefined) {
                    self.accounts.removeAll();
                    ko.utils.arrayMap(data.d, function (item) {
                        self.accounts.push(item);
                    })
                }
                else {
                    self.accounts.removeAll();
                    $('#noAccounts').css('display', 'block');
                }
                $('#loadingResetPass').css('display', 'none');
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $('#error').css('display', 'block');
            }
        });
    }

    self.Resetpass = function (mid) {
        $.ajax({
            url: '../Services/Services.asmx/ResetPass',
            type: 'GET',
            data: { mid: mid},
            success: function (result) {
                
            }
        });
    }
}

function initaccount()
{
    accountVM = new account();
    ko.applyBindings(accountVM);
}