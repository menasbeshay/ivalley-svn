var accountVM;
function account()
{
    var self = this;
    self.accounts = ko.observableArray();
    self.email = ko.observable();
    self.IsPassReseted = ko.observable();
    /*self.email.subscribe(function (newValue) {
        self.SearchAccounts();
    });*/

    self.getAccount = function (id) {
        var Account = ko.utils.arrayFirst(self.accounts(), function (acc) {
            return acc.MemberID == id ;
        });
        
        return Account;
    }

    self.SearchAccounts = function () {
        $('#loadingResetPass').css('display', 'block');
        $('#noAccounts').css('display', 'none');
        $('#hasAccounts').css('display', 'none');
        $('#error').css('display', 'none');
        $.ajax({
            url: '../Services/Services.asmx/SearchAccountsByMail',
            dataType: 'json',
            type: 'post',
            data: "{'email':'" + self.email()+ "' }",
            contentType: 'application/json; charset=utf-8',
            success: function (data) {
                if (data.d != null || data.d != undefined) {
                    $('#hasAccounts').css('display', 'block');
                   /* self.accounts.removeAll();
                    ko.utils.arrayMap(data.d, function (item) {
                        self.accounts.push(item);
                    })*/
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
        $('#loadingResetPass').css('display', 'block');
        $('#noAccounts').css('display', 'none');
        $('#hasAccounts').css('display', 'none');
        $('#error').css('display', 'none');
        $.ajax({
            url: '../Services/Services.asmx/ResetPass',
            type: 'post',
            data: "{'Email':'" + self.email() + "' }",
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (result) {                
                if (result.d == true) {
                    $('#mailsent').css('display', 'block');
                    /*var acc = self.getAccount(mid);
                    acc.IsPassReseted = ko.observable(true);*/
                    $('#loadingResetPass').css('display', 'none');
                }
                else {
                    $('#loadingResetPass').css('display', 'none');
                    $('#error').css('display', 'block');
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {               
                $('#loadingResetPass').css('display', 'none');
                $('#error').css('display', 'block');

            }
        });
    }
}

function initaccount()
{
    accountVM = new account();
    ko.applyBindings(accountVM);
}