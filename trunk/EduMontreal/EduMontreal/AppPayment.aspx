<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/EduMaster.Master" AutoEventWireup="true" CodeBehind="AppPayment.aspx.cs" Inherits="EduMontreal.AppPayment" %>
<%@ MasterType VirtualPath="~/MasterPages/EduMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="js/payfirma.minified.js"></script>    
    <script type="text/javascript">
        function callback(response) {

            var objData = JSON.parse(response);
            if (objData.error == undefined) {
                if (objData.result == 'approved') {
                    /*$('#ResponseSuccess').css('display', 'block');
                    $('#trxid').html(objData.transaction_id);*/
                    window.location.href = "http://application.edumontreal.ca/success?trx=" + objData.transaction_id + "&a=" + objData.amount + " CAD" + "&d=" + new Date().getDate() + "&ct=" + objData.card_type + "&cn=" + "********" + objData.suffix;
                    //window.location.href = "http://localhost:2158/success?trx=" + objData.transaction_id;
                }
                else if (objData.result == 'declined' || objData.result_bool == false) {
                    $('#ResponseFail').css('display', 'block');
                }
            }
            else
                $('#ResponseFail').css('display', 'block');

            $('#loading').css('display', 'none');
        };

        $(document).ready(function () {
            $('#<%= uiLinkButtonProceed.ClientID %>').click(function () {
                if (Page_ClientValidate("signup")) {
                    var card_number = $('#<%= uiTextBoxCCN.ClientID %>').val();
                    var card_expiry_month = $('#<%= uiDropDownListMonth.ClientID %> option:selected').text();
                    var card_expiry_year = $('#<%= uiTextBoxCEY.ClientID %>').val();
                    var cvv2 = $('#<%= uiTextBoxCVV2.ClientID %>').val();

                    var first_name = $('#<%= uiTextBoxFN.ClientID %>').val();
                    var last_name = $('#<%= uiTextBoxLN.ClientID %>').val();

                    // mena
                    //var key = '2d2d2d2d2d424547494e205055424c4943204b45592d2d2d2d2d4d494942496a414e42676b71686b6947397730424151454641414f43415138414d49494243674b434151454176762f2b6870786274687735564d546463504d3276447570574570492f725262454e736978554e57502b336436324c58587a4433595255575a366650534639487377695242734d6168697a58374f6d4931644178393851717970773471474e47796e4d516c41357a664f496f552b7059656c7a5a47504e457a3153557774356d6b446846624e5165793769796f4f575572486f7278495339716f73797747524f7574454252554c373164792f732b48652b6233574f3858464a6f53595233342f475065784f4c4d3147303153644d72546d396267656646746336746e6a6d4a363037505a764532705044577958356d467341426e49584544487472464e51594e2f394c3459484a42667279386c2f6d4374343437366e39365841783163387145384139586b6d6656653834546c32674e54342f797849387250306c30415a50687a2b6962732f6c6233615936753278624564452f56774944415141422d2d2d2d2d454e44205055424c4943204b45592d2d2d2d2d';

                    // hesham
                    var key = '2d2d2d2d2d424547494e205055424c4943204b45592d2d2d2d2d4d494942496a414e42676b71686b6947397730424151454641414f43415138414d49494243674b434151454132596c2f697156666c43586f394966556653646136512b75506d70513330532b535141373743754b37623558504f64456c4a355630797151776c566750797379386f57696c47353837744573577a536e6c6c624d504f574835695861743679636555346866633161696948454f4e314672486d52755a377a585a6331774d6346366479766f6f3165393348383076463030786759692b633049365363585a30414538795658776775567131616d2b374e6c344c694e434e37344a5862384768494867442f74794b2b523541384a4e662f78415266663738315650386d45392b314e3035436d2b502b553355696b3863716b354569727675557045653771706e4e6543683858437244396f767954425469715841586448396b7265712b64354356737a6f6d453852726f79486457624b65386a4770655a7076466b387037384e5730446a344578504551736636453767504b336e4e38514944415141422d2d2d2d2d454e44205055424c4943204b45592d2d2d2d2d';
                    var z = new Payfirma(key, {
                        'card_number': card_number,
                        'card_expiry_month': card_expiry_month,
                        'card_expiry_year': card_expiry_year,
                        'cvv2': cvv2
                    }, {
                        'first_name': first_name,
                        'last_name': last_name,
                    }, 'http://application.edumontreal.ca/sale', callback);
                    $('#loading').css('display', 'block');
                }
                else
                    return false;
            });
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <section class="span12 col-left">
        <%--<asp:LinkButton ID="uiLinkButtonByPass" runat="server" OnClick="uiLinkButtonByPass_Click" CssClass="btn btn-primary">Pass to next status</asp:LinkButton>--%>
        <h4>Please choose one of the following payment methods

        </h4>
        <asp:Panel runat="server" ID="uiPanelAmount" CssClass="span12">
        
            you're going to pay <asp:Label ID="uiLabelAmount" runat="server"></asp:Label> CAD.
        
        </asp:Panel>
        
        <div class="clearfix" style="clear:both;height:10px;"></div>
        <div class="span12">
            <div class="note note-success" id="ResponseSuccess" style="display: none;">
                                Your payment has been approved with transaction id :
                                <div id="trxid" style="display:inline;"></div>
                                <div class="clearfix" style="clear:both;height:10px;"></div>
                                <a href="checkapp" class="btn btn-primary" style="margin:0 auto;">Proceed to next step</a>
                            </div>

                            <div class="note note-danger" id="ResponseFail" style="display: none;">
                                Your payment has been declined for some reason. please try again later.                                               
                            </div>
            <div class="clearfix" style="clear:both;height:10px;"></div>
            <div class="panel-group accordion" id="accordion1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_1">	By Credit Card </a>
                        </h4>
                    </div>
                    <div id="collapse_1" class="panel-collapse in">
                        <div class="panel-body">
                            <section class="form-horizontal" style="position:relative;">

                                <div class="form-body">

                                    <div class="row">

                                        <asp:Panel ID="uiPanelError" runat="server" Visible="false">
                                            <div class="col-md-12 note note-success">
                                                <asp:Label ID="uiLabelMsg" runat="server" Text="Password changed successfully" ForeColor="Green" Font-Bold="true"></asp:Label>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="form-group ">
                                        <label class="col-md-3 control-label">Credit Card Number</label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-credit-card"></i>
                                                </span>
                                                <asp:TextBox ID="uiTextBoxCCN" runat="server" CssClass="form-control" placeholder="Credit Card Number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxCCN" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid Credit Card Number" Display="Dynamic" ControlToValidate="uiTextBoxCCN" ValidationGroup="signup" ForeColor="Red" ValidationExpression="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\d{3})\d{11})$"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-md-3 control-label">Card Expiry Month</label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                                <asp:DropDownList ID="uiDropDownListMonth" runat="server" CssClass="form-control">
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                    <asp:ListItem>5</asp:ListItem>
                                                    <asp:ListItem>6</asp:ListItem>
                                                    <asp:ListItem>7</asp:ListItem>
                                                    <asp:ListItem>8</asp:ListItem>
                                                    <asp:ListItem>9</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>11</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-md-3 control-label">Credit Expiry year</label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </span>
                                                <asp:TextBox ID="uiTextBoxCEY" runat="server" CssClass="form-control" placeholder="Credit Expiry year"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxCEY" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label class="col-md-3 control-label">CVV2</label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-edit"></i>
                                                </span>
                                                <asp:TextBox ID="uiTextBoxCVV2" runat="server" CssClass="form-control" placeholder="CVV2"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxCVV2" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label class="col-md-3 control-label">First Name</label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                                <asp:TextBox ID="uiTextBoxFN" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFN" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="form-group last">
                                        <label class="col-md-3 control-label">Last Name</label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                                <asp:TextBox ID="uiTextBoxLN" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxLN" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="form-actions fluid">
                                        <div class="col-md-offset-3 col-md-9">
                                            <asp:LinkButton ID="uiLinkButtonProceed" runat="server" CssClass="btn btn-primary" ValidationGroup="signup" OnClientClick="return false;">Proceed</asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;<div id="loading" style="display:none;"> We're processing Your request .Please wait... <img src="img/loading.gif" style="max-width:30px;"/></div>
                                        </div>
                                    </div>
                                </div>

                                <img src="Images/CreditCardSecurity_43.jpg" style="position:absolute;right:10%;max-width:200px;top:30px;" />
                            </section>

                            
                        </div>
                    </div>
                </div>
                <%--<div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse_2">2-	By Wire Transfer from your local bank  </a>
                        </h4>
                    </div>
                    <div id="collapse_2" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="col-lg-12">
                                <h4>Check our bank info below :</h4>
                            </div>

                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Account Name: </b></label>
                                Institut Éducatif de Montréal</div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Bank: </b></label>
                                Canadian Imperial Bank of Commerce (CIBC)</div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Address: </b></label>
                                1155 René-Levesque Blvd West, Montréal QC H3B 3Z4 Canada </div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Transit number :</b></label>
                                00001 </div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Institution Number:</b></label>
                                010</div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Account number: </b></label>
                                1307312 </div>
                            <div class="col-lg-12">
                                <label class="col-lg-2"><b>Swift Code:</b></label>
                                CIBCCATT</div>
                            <div class="clearfix" style="height: 10px;"></div>
                            <div class="col-lg-12">
                                <div class="note note-info">
                                    Please write your First and Last Name as well as your ID number in the transfer notes

                                </div>

                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>

    </section>
     
</asp:Content>
