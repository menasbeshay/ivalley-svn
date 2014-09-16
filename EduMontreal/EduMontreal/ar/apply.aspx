<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AREduMaster.Master" AutoEventWireup="true" CodeBehind="apply.aspx.cs" Inherits="EduMontreal.ar.apply" %>
<%@ MasterType VirtualPath="~/MasterPages/AREduMaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="../js/prettify.js"></script>    
    <script type="text/javascript" src="../assets/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
    <link href="../js/prettify.css" rel="stylesheet" />
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>



    <script type="text/javascript">
        $(document).ready(function () {
            $('#rootwizard').bootstrapWizard({
                 onTabClick: function (tab, navigation, index) {                   
                     return false;
                 }
             , 

                onTabShow: function (tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index + 1;
                    var $percent = ($current / $total) * 100;
                    $('#rootwizard').find('.progress-bar').css({ width: $percent + '%' });

                    if ($current >= $total) {
                        $('#rootwizard').find('.pager .next').hide();
                        $('#rootwizard').find('.pager .finish').show();
                        $('#rootwizard').find('.pager .finish').removeClass('disabled');
                    } else {
                        $('#rootwizard').find('.pager .next').show();
                        $('#rootwizard').find('.pager .finish').hide();
                    }
                },
                onNext: function (tab, navigation, index) {
                    return validateStep(index);
                }
            });

            $('.datetimepicker').datetimepicker({
                format: 'dd/MM/yyyy',
                pick12HourFormat: false,
                pickSeconds: false,
                language: 'ar'
            });

            $.uniform.restore(".noUniform");

            $(".rating-input.EnglishSpoken").click(function () {
                $('#<%= uiHiddenFieldEnglishSpoken.ClientID %>').val($(this).val());
            });

            $(".rating-input.EnglishWritten").click(function () {
                $('#<%= uiHiddenFieldEnglishWritten.ClientID %>').val($(this).val());
            });

            $(".rating-input.FrenchSpoken").click(function () {
                $('#<%= uiHiddenFieldFrenchSpoken.ClientID %>').val($(this).val());
            });

            $(".rating-input.FrenchWritten").click(function () {
                $('#<%= uiHiddenFieldFrenchWritten.ClientID %>').val($(this).val());
            });

            
        });
        function CheckBoxRequired_ClientValidate(sender, e) {
            e.IsValid = $(".ApproveCheck input:checkbox").is(':checked');
        }

        function validateStep(index) {
            var isvalid = true;

            var tabid = 'tab' + index;
            $('#' + tabid + " .field input[type=text]").each(function () {
                if (!$(this).val()) {
                    isvalid = false;
                    $(this).closest('.field').removeClass('has-success').addClass('has-error');
                }
                else {
                    $(this).closest('.field').removeClass('has-error').addClass('has-success');
                }

            });

            $('#' + tabid + " .field select").each(function () {
                if ($(this).val() == 0) {
                    isvalid = false;
                    $(this).closest('.field').removeClass('has-success').addClass('has-error');
                }
                else {
                    $(this).closest('.field').removeClass('has-error').addClass('has-success');
                }

            });

            $('#' + tabid + " .field input[type=file]").each(function () {
                if (!$(this).val() && $('#<%# uiHiddenFieldRecentPhoto.ClientID %>').val() == "") {
                    isvalid = false;
                    $(this).closest('.field').removeClass('has-success').addClass('has-error');
                }
                else {
                    $(this).closest('.field').removeClass('has-error').addClass('has-success');
                }

            });

            if (index == 6) {
                if ($('#<%= uiDropDownListLanguage.ClientID %>').val() == 0) {
                     isvalid = false;
                     $('#<%= uiDropDownListLanguage.ClientID %>').closest('.field').removeClass('has-success').addClass('has-error');
                }
            }

            if (index == 6 && $(".ApproveCheck input:checkbox").is(':checked') && isvalid) {
                $('#progressModal').modal('show');
            }

            return isvalid;
        }
    </script>


    <style type="text/css">
         .radio {
            float:right;
        }
        .radio input{
            margin-left:5px ;
            margin-right:0px !important;
            float:right;
        }
        .radio label{                       
            margin-top:5px !important;
            float:right;
            display:inline-block;
            margin-left:15px;
        }
        .nav-pills li {
            width:auto !important;
        }
        .form-wizard .step .number {
            width:30px !important;
            height:30px !important;
            padding:4px 10px !important;
            float:right;
        }
        .form-wizard .step .desc {
            float:right;
            margin-right:10px;
        }

        
.rating {    
    display: inline-block;
    /*font-size: 45px;*/
    position: relative;
}

.rating-input 
{
    font-family:FontAwesome !important;
    float: right;   
    padding: 0;
    margin: -3px 0 0 -20px !important;
    opacity: 0;
    width:20px;
    height:20px;
}
.rating:hover .rating-star:hover,
.rating:hover .rating-star:hover ~ .rating-star,
.rating-input:checked ~ .rating-star {
    color:#f70;
    /*background-position: 0 0;*/
}
.rating-star 
{
    font-family:FontAwesome;    
    float: right;
    display: block;
    width:20px;    
    Color: #aaaaaa;
    font-size:20px;
    /*background: url('http://kubyshkin.ru/samples/star-rating/star.png') 0 -16px;*/
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
           
            <section class="col-md-12 col-left" style="padding-left:0px;">                                    

                        <div class="row">
                            <div class="col-md-10">
                                <asp:Label ID="uiLabelError" runat="server" ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>
                            </div>
                        </div>

                        <div id="rootwizard" class="form-wizard">
                            <div class="form-body">
                              
                                <ul class="nav nav-pills nav-justified steps">
                                    <li><a href="#tab1" data-toggle="tab" class="step">
                                        <span class="number">1
                                        </span>
                                        <span class="desc">
                                            <i class="fa fa-check"></i>معلومات أساسية
                                        </span>
                                    </a></li>
                                    <li><a href="#tab2" data-toggle="tab" class="step">
                                        <span class="number">2
                                        </span>
                                        <span class="desc">
                                            <i class="fa fa-check"></i>معلومات العائلة
                                        </span></a></li>
                                    <li><a href="#tab3" data-toggle="tab" class="step">
                                        <span class="number">3
                                        </span>
                                        <span class="desc">
                                            <i class="fa fa-check"></i>العنوان البريدى
                                        </span></a></li>
                                    <li><a href="#tab4" data-toggle="tab" class="step"><span class="number">4
                                    </span>
                                        <span class="desc">
                                            <i class="fa fa-check"></i>عنوان السكن
                                        </span></a></li>
                                    <li><a href="#tab5" data-toggle="tab" class="step"><span class="number">5
                                    </span>
                                        <span class="desc">
                                            <i class="fa fa-check"></i>الدرجات العلمية
                                        </span></a></li>
                                    <li><a href="#tab6" data-toggle="tab" class="step"><span class="number">6
                                    </span>
                                        <span class="desc">
                                            <i class="fa fa-check"></i>إنهاء
                                        </span></a></li>
                                </ul>

                                <div id="bar" class="progress progress-striped" role="progressbar">
											<div class="progress-bar progress-bar-success">
											</div>
										</div>
                            <div class="tab-content">
                                <div class="tab-pane" id="tab1">
                                    
                                        <div class="form-group">
                                            <div class="col-md-4 field">
                                                <label class="control-label ">اللقب <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxFamilyName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFamilyName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">الإسم الأول <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFirstName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">الإسم الأخير <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxMiddleName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxMiddleName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                        <div class="form-group " style="padding-left:0 !important;width:100%;clear:both;">
                                            <div class="col-md-4 field">
                                                <div class="input-append datetimepicker">
                                                    <label class="control-label ">تاريخ الميلاد  <span class="required">* </span></label>
                                                    <div class="input-group">
                                                    <asp:TextBox ID="uiTextBoxDOB" runat="server" CssClass="form-control dateinput" ></asp:TextBox>
                                                    <span class="input-group-addon add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="fa fa-calendar"></i></span>
                                                        </div>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxDOB" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                </div>
                                                </div>
                                            <div class="col-md-4 field">
                                            
                                                <label class="control-label ">مكان الميلاد<span class="required">* </span></label>
                                                <asp:DropDownList ID="uiDropDownListPOB" runat="server" CssClass="form-control" Style="width: 256px;"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">&nbsp;</div>
                                        </div>
                                        <div class="form-group" style="padding-left:0 !important;width:100%;clear:both;">
                                            <div class="col-md-4">
                                                <label class="control-label ">الطول<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxHeight" runat="server" CssClass="form-control"></asp:TextBox>
                                                
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label ">الوزن<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxWeight" runat="server" CssClass="form-control"></asp:TextBox>
                                                
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">النوع <span class="required">* </span></label>
                                                <div class="separator"></div>
                                                <asp:RadioButtonList ID="uiRadioButtonListGender" runat="server" CssClass="radio" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                </asp:RadioButtonList>
                                            </div>
                                        </div>
                                         <div class="form-group " style="padding-left:0 !important;width:100%;clear:both;">
                                            <div class="col-md-4">
                                                <label class="control-label ">لون الشعر<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxHairColor" runat="server" CssClass="form-control"></asp:TextBox>
                                                
                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label ">لون العين<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxEyeColor" runat="server" CssClass="form-control"></asp:TextBox>
                                                
                                            </div>                                            
                                        </div>
                                        <div class="form-group" style="padding-left:0 !important;width:100%;clear:both;">
                                            <div class="col-md-3 field">
                                                <label class="control-label ">الجنسية <span class="required">* </span></label>
                                                <asp:DropDownList ID="uiDropDownListCountry" runat="server" CssClass="form-control" Style="width: 256px;"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-3 field">
                                                <label class="control-label ">رقم الباسبور <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxPassNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassNo" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                               
                                            </div>
                                            <div class="col-md-3 field">
                                                <div class="input-append datetimepicker">
                                                    <label class="control-label ">تاريخ إنتهاء الباسبور  <span class="required">* </span></label>
                                                    <div class="input-group">
                                                    <asp:TextBox ID="uiTextBoxPassExp" runat="server" CssClass="form-control dateinput"></asp:TextBox>
                                                    <span class="input-group-addon add-on"><i data-time-icon="fa fa-time" data-date-icon="fa fa-calendar" class="fa fa-calendar"></i></span>
                                                        </div>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxPassExp" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                </div>

                                            </div>
                                            <div class="col-md-3 field">
                                                <label class="control-label ">البلد<span class="required">* </span></label>
                                                <asp:DropDownList ID="uiDropDownListCOI" runat="server" CssClass="form-control" Style="width: 256px;"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 field">
                                                <label class="control-label ">صورة شخصية 4×6 بجودة عالية<span class="required">* </span></label>
                                                <asp:FileUpload ID="uiFileUploadRecentPhoto" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiFileUploadRecentPhoto" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:HiddenField ID="uiHiddenFieldRecentPhoto" runat="server" />
                                            </div>

                                        </div>


                                  
                                </div>
                                <div class="tab-pane" id="tab2">
                                  
                                        <div class="form-group">
                                            <div class="col-md-4 field">
                                                <label class="control-label ">لقب الأب<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxFaFamilyName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFaFamilyName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">إسم الأب الأول<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxFaFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFaFirstName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">مهنة الأب  <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxFaOccupation" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFaOccupation" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-4 field">
                                                <label class="control-label "> تليفون منزل الأب<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxFaHomePhone" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFaHomePhone" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">تليفون العمل للأب<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxFaBusPhone" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFaBusPhone" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">موبايل الأب<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxFaMobile" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxFaMobile" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-4 field">
                                                <label class="control-label ">لقب الأم<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxMoFamilyName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxMoFamilyName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">الإسم الأول للأم<span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxMoFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxMoFirstName" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-4 field">
                                                <label class="control-label ">مهنة الأم <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxMoOccupation" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxMoOccupation" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>

                                    
                                </div>
                                <div class="tab-pane" id="tab3">
                                   
                                        <div class="form-group">
                                            <h4> العنوان البريدي الحالي. وسوف تذهب جميع المراسلات إلى هذا العنوان</h4>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="col-md-3 field">
                                                <label class="control-label ">الشارع <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxStreetAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxStreetAddress" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-3 field">
                                                <label class="control-label ">البلد <span class="required">* </span></label>
                                                <asp:DropDownList ID="uiDropDownListAddressCountry" runat="server" CssClass="form-control" Style="width: 256px;"></asp:DropDownList>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiDropDownListAddressCountry" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-3 field">
                                                <label class="control-label ">المدينة <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxCity" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxCity" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="col-md-3 field">
                                                <label class="control-label ">رقم التليفون <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxAddTele" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxAddTele" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label ">رقم الفاكس </label>
                                                <asp:TextBox ID="uiTextBoxAddFax" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <div class="col-md-3 field">
                                                <label class="control-label ">البريد الإلكترونى <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxEmail" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" Text="البريد الإلكترونى غير صحيح" ErrorMessage="البريد الإلكترونى غير صحيح" ValidationGroup="signup" ForeColor="Red" ControlToValidate="uiTextBoxEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="col-md-3 field">
                                                <label class="control-label ">الموبايل <span class="required">* </span></label>
                                                <asp:TextBox ID="uiTextBoxCellphone" runat="server" CssClass="form-control"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" Display="Dynamic" ErrorMessage="*" ControlToValidate="uiTextBoxCellphone" ValidationGroup="signup" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                   
                                </div>
                                <div class="tab-pane" id="tab4">
                                   
                                        <div class="form-group col-md-12">
                                            <div class="col-md-12">
                                                <h4>إذا كان مختلفا عن العنوان البريدي.</h4>
                                            </div>
                                        </div>
                                     <div class="form-group col-md-12">
                                        <div class="col-md-6">
                                            <label>عنوان السكن </label>
                                            <asp:TextBox ID="uiTextBoxResAddress" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                         </div>
                                   
                                </div>
                                <div class="tab-pane" id="tab5">
                                   
                                        <div class="form-group">
                                            <div class="col-md-4">
                                                <label class="control-label ">تخصص درجة الماجستير</label>
                                                <asp:TextBox ID="uiTextBoxMDS" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label ">الجامعة  </label>
                                                <asp:TextBox ID="uiTextBoxMDUniversity" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-append datetimepicker">
                                                    <label class="control-label ">تاريخ الشهادة (تاريخ متوقع)  </label>
                                                    <asp:TextBox ID="uiTextBoxMDDate" runat="server" CssClass="form-control dateinput" Style="width: 225px;"></asp:TextBox>
                                                    <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar" class="icon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-4">
                                                <label class="control-label ">تخصص درجة البكالوريوس </label>
                                                <asp:TextBox ID="uiTextBoxBach" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label ">الجامعة  </label>
                                                <asp:TextBox ID="uiTextBoxBachUni" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-append datetimepicker">
                                                    <label class="control-label ">تاريخ الشهادة (تاريخ متوقع)   </label>
                                                    <asp:TextBox ID="uiTextBoxBachDate" runat="server" CssClass="form-control dateinput" Style="width: 225px;"></asp:TextBox>
                                                    <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar" class="icon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-4">
                                                <label class="control-label ">تخصص المدرسة الثانوية </label>
                                                <asp:TextBox ID="uiTextBoxHighSchool" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-4">
                                                <label class="control-label ">الكلية/ المدرسة   </label>
                                                <asp:TextBox ID="uiTextBoxHighCollege" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-4">
                                                <div class="input-append datetimepicker">
                                                    <label class="control-label ">تاريخ الشهادة (تاريخ متوقع)  </label>
                                                    <asp:TextBox ID="uiTextBoxHighDate" runat="server" CssClass="form-control dateinput" Style="width: 225px;"></asp:TextBox>
                                                    <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar" class="icon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-3">
                                                <label class="control-label ">درجة الشهادة </label>
                                                <asp:TextBox ID="uiTextBoxDS" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label ">نوع الشهادة  </label>
                                                <asp:TextBox ID="uiTextBoxKOD" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-3">
                                                <label class="control-label ">الكلية / المدرسة   </label>
                                                <asp:TextBox ID="uiTextBoxCS" runat="server" CssClass="form-control"></asp:TextBox>

                                            </div>
                                            <div class="col-md-3">
                                                <div class="input-append datetimepicker">
                                                    <label class="control-label ">تاريخ الشهادة (تاريخ متوقع)   </label>
                                                    <asp:TextBox ID="uiTextBoxDDOG" runat="server" CssClass="form-control dateinput" Style="width: 225px;"></asp:TextBox>
                                                    <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar" class="icon-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                   
                                </div>
                                <div class="tab-pane" id="tab6">
                                    

                                        <div class="form-group col-md-12">
                                            <div class="col-md-5">
                                                <label class="control-label ">مستوى تحدث الإنجليزية  (1 ضعيف - 5 ممتاز)</label>
                                                <br />
                                                <span class="rating">
                                                    <input type="radio" class="rating-input noUniform  EnglishSpoken" id="EnglishSpoken-5" name="EnglishSpoken" value="5" />
                                                    <label for="rating-input-1-5" class="rating-star fa fa-star "></label>
                                                    <input type="radio" class="rating-input noUniform  EnglishSpoken" id="EnglishSpoken-4" name="EnglishSpoken" value="4" />
                                                    <label for="rating-input-1-4" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  EnglishSpoken" id="EnglishSpoken-3" name="EnglishSpoken" value="3" />
                                                    <label for="rating-input-1-3" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  EnglishSpoken" id="EnglishSpoken-2" name="EnglishSpoken" value="2" />
                                                    <label for="rating-input-1-2" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  EnglishSpoken" id="EnglishSpoken-1" name="EnglishSpoken" value="1" />
                                                    <label for="rating-input-1-1" class="rating-star fa fa-star"></label>
                                                </span>

                                                <asp:HiddenField runat="server" ID="uiHiddenFieldEnglishSpoken" Value="0" />
                                            </div>
                                            <div class="col-md-5">
                                                <label class="control-label ">مستوى كتابة الإنجليزية  (1 ضعيف - 5 ممتاز)</label>
                                                <br />
                                                <span class="rating">
                                                    <input type="radio" class="rating-input noUniform  EnglishWritten" id="EnglishWritten-5" name="EnglishWritten" value="5" />
                                                    <label for="rating-input-1-5" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  EnglishWritten" id="EnglishWritten-4" name="EnglishWritten" value="4" />
                                                    <label for="rating-input-1-4" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  EnglishWritten" id="EnglishWritten-3" name="EnglishWritten" value="3" />
                                                    <label for="rating-input-1-3" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  EnglishWritten" id="EnglishWritten-2" name="EnglishWritten" value="2" />
                                                    <label for="rating-input-1-2" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  EnglishWritten" id="EnglishWritten-1" name="EnglishWritten" value="1" />
                                                    <label for="rating-input-1-1" class="rating-star fa fa-star"></label>
                                                </span>

                                                <asp:HiddenField runat="server" ID="uiHiddenFieldEnglishWritten" Value="0" />
                                            </div>
                                        </div>

                                        <div class="form-group col-md-12">
                                            <div class="col-md-5">
                                                <label class="control-label ">مستوى تحدث الفرنسية  (1 ضعيف - 5 ممتاز)</label>
                                                <br />
                                                <span class="rating">
                                                    <input type="radio" class="rating-input noUniform  FrenchSpoken" id="FrenchSpoken-5" name="FrenchSpoken" value="5" />
                                                    <label for="rating-input-1-5" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  FrenchSpoken" id="FrenchSpoken-4" name="FrenchSpoken" value="4" />
                                                    <label for="rating-input-1-4" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  FrenchSpoken" id="FrenchSpoken-3" name="FrenchSpoken" value="3" />
                                                    <label for="rating-input-1-3" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  FrenchSpoken" id="FrenchSpoken-2" name="FrenchSpoken" value="2" />
                                                    <label for="rating-input-1-2" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  FrenchSpoken" id="FrenchSpoken-1" name="FrenchSpoken" value="1" />
                                                    <label for="rating-input-1-1" class="rating-star fa fa-star"></label>
                                                </span>

                                                <asp:HiddenField runat="server" ID="uiHiddenFieldFrenchSpoken" Value="0" />
                                            </div>
                                            <div class="col-md-5">
                                                <label class="control-label ">مستوى كتابة الفرنسية  (1 ضعيف - 5 ممتاز)</label>
                                                <br />
                                                <span class="rating">
                                                    <input type="radio" class="rating-input noUniform  FrenchWritten" id="FrenchWritten-5" name="FrenchWritten" value="5" />
                                                    <label for="rating-input-1-5" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  FrenchWritten" id="FrenchWritten-4" name="FrenchWritten" value="4" />
                                                    <label for="rating-input-1-4" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  FrenchWritten" id="FrenchWritten-3" name="FrenchWritten" value="3" />
                                                    <label for="rating-input-1-3" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  FrenchWritten" id="FrenchWritten-2" name="FrenchWritten" value="2" />
                                                    <label for="rating-input-1-2" class="rating-star fa fa-star"></label>
                                                    <input type="radio" class="rating-input noUniform  FrenchWritten" id="FrenchWritten-1" name="FrenchWritten" value="1" />
                                                    <label for="rating-input-1-1" class="rating-star fa fa-star"></label>
                                                </span>

                                                <asp:HiddenField runat="server" ID="uiHiddenFieldFrenchWritten" Value="0" />
                                            </div>
                                        </div>

                                        <hr />
                                        <div class="form-group">
                                            <div class="col-md-11" style="background-color:#72ddfa;padding-bottom:10px;">
                                                <h4>أرغب فى الإشتراك :</h4>
                                                <asp:UpdatePanel ID="uiUpdatePanelCourses" runat="server">
                                                    <ContentTemplate>
                                                        <div class="col-md-5">
                                                            <label class="control-label ">اللغة</label>
                                                            <asp:DropDownList ID="uiDropDownListLanguage" runat="server" CssClass="form-control" Style="width: 256px;" OnSelectedIndexChanged="uiDropDownListLanguage_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                                                        </div>
                                                        
                                                        <div class="col-md-5">
                                                            <label class="control-label ">الكورس</label>
                                                            <asp:DropDownList ID="uiDropDownListCourses" runat="server" CssClass="form-control" Style="width: 300px;"></asp:DropDownList>

                                                        </div>
                                                        <div class="col-md-1" style="margin-left:-50px;padding-top:20px;">
                                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="uiUpdatePanelCourses">
                                                                <ProgressTemplate>
                                                                   <img src="img/loading.gif" style="max-width:30px;" />

                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    <div class="separator" style="height:10px;"></div>
                                        <div class="form-group">
                                            <div class="col-md-11">
                                                <p class="field">
                                              <%-- أقر بأنني قد أجبت على جميع الأسئلة المطلوبة في هذا الطلب بشكل كامل والحقيقة بالكامل.<br />--%>
                                                    <a href="../files/Refund_Policy_Agreement.pdf">سياسة إسترجاع المال</a>
                                        <br />

                                                <asp:CheckBox ID="uiCheckBoxIApproved" CssClass="ApproveCheck" runat="server" />&nbsp;أوافق على سياسة رد. من خلال توقيع هذا الطلب، و موافق على سياسة رد المحددة للطلاب الدوليين.                          
                                                    <br />
                                                <asp:CustomValidator runat="server" ID="CheckBoxRequired" EnableClientScript="true"
                                                    ValidationGroup="signup" ForeColor="Red" Display="Dynamic" Font-Bold="true" Enabled="false"
                                                    ClientValidationFunction="CheckBoxRequired_ClientValidate">يجب أن توافق</asp:CustomValidator>
                                                </p>
                                                <span class="label big">مرفقات مطلوبة: </span>
                                                <ul class="list_1">
                                                    <li>Signed refund and cancellation policy for International studies ( 2 documents) 
                                                    </li>
                                                    <li>Photocopies of Certificate/Diploma/Degree of the highest level of education achieved (documents should be in English/French or translated to English)
                                                    </li>
                                                    <li>Photocopy of the proof of English proficiency (valid IELTS or School certificate proving English is the main language (or 75%) as a language of instructions) (not required in case of taking language classes)</li>
                                                    <li>Photocopy of the transcripts (documents should be in English/French or translated to English)</li>
                                                    <li>Documents supporting work experience, if any</li>
                                                    <li>Photocopy of the passport's bio-data page (passport should be valid)</li>

                                                </ul>



                                                <br />
                                                <div style="color:red;font-weight:bold;padding-bottom:10px;">
                                               الرجاء ملاحظة أن التطبيق لم يكتمل إلا إذا تم تأكيد دفع الرسوم  .
                                                    </div>

                                            </div>
                                        </div>
                                        <div class="separator" style="height:10px;"></div>
                                         <div class="form-group col-md-12" style="direction:rtl;">
                                            
                                                    
                                                        <iframe src="../Arupload.html" style="border:0;width:100%;"></iframe>
                                                   
                                            
                                             </div>
                                   

                                </div>
                                
                                <ul class="pager wizard">
                                    <div class="separator" style="height:10px;"></div>
                                    <li class="previous first" style="display: none;"><a href="#">First</a></li>
                                    <li class="previous pull-right"><a href="#rootwizard">السابق</a></li>
                                    <li class="next pull-left"><a href="#rootwizard">التالى</a></li>
                                    <li class="next finish  pull-left" style="display: none;">
                                        <asp:LinkButton ID="uiLinkButtonFinish" runat="server" OnClick="uiLinkButtonFinish_Click" ValidationGroup="signup">إنهاء</asp:LinkButton></li>
                                </ul>

                                <asp:LinkButton ID="uiLinkButtonSave" runat="server" OnClick="uiLinkButtonSave_Click" CssClass="btn btn-primary">حفظ الطلب</asp:LinkButton>
                        <asp:Label ID="uiLabelSaved" runat="server" Text="تم حفظ طلبك بنجاح. يمكنك إكمال الطلب الأن أو فى وقت لاحق" ForeColor="Green" Font-Bold="true" Visible="false"> </asp:Label>
                            </div>
                                </div>
                        </div>                    
                
            </section>

        <div class="modal fade" id="progressModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">                    
                    <h3>رجاء الإنتظار... </h3>
                </div>
                <div class="modal-body">
                    جارى العمل على طلبك . برجاء الإنتظار...
                    <img src="../assets/img/loading.gif" />
                    </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
        </div>
</asp:Content>
