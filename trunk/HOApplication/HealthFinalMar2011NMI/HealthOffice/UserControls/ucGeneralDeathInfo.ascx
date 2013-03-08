<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Control Language="C#"  AutoEventWireup="true" CodeFile="ucGeneralDeathInfo.ascx.cs"
    Inherits="UserControls_ucGeneralDeathInfo" %>
<style type="text/css">
    .style1
    {
        width: 145px;
    }
</style>

  <script language="javascript" type="text/javascript">
      function positionInfo(object) {

          var p_elm = object;

          this.getElementLeft = getElementLeft;
          function getElementLeft() {
              var x = 0;
              var elm;
              if (typeof (p_elm) == "object") {
                  elm = p_elm;
              } else {
                  elm = document.getElementById(p_elm);
              }
              while (elm != null) {
                  x += elm.offsetLeft;
                  elm = elm.offsetParent;
              }
              return parseInt(x);
          }

          this.getElementWidth = getElementWidth;
          function getElementWidth() {
              var elm;
              if (typeof (p_elm) == "object") {
                  elm = p_elm;
              } else {
                  elm = document.getElementById(p_elm);
              }
              return parseInt(elm.offsetWidth);
          }

          this.getElementRight = getElementRight;
          function getElementRight() {
              return getElementLeft(p_elm) + getElementWidth(p_elm);
          }

          this.getElementTop = getElementTop;
          function getElementTop() {
              var y = 0;
              var elm;
              if (typeof (p_elm) == "object") {
                  elm = p_elm;
              } else {
                  elm = document.getElementById(p_elm);
              }
              while (elm != null) {
                  y += elm.offsetTop;
                  elm = elm.offsetParent;
              }
              return parseInt(y);
          }

          this.getElementHeight = getElementHeight;
          function getElementHeight() {
              var elm;
              if (typeof (p_elm) == "object") {
                  elm = p_elm;
              } else {
                  elm = document.getElementById(p_elm);
              }
              return parseInt(elm.offsetHeight);
          }

          this.getElementBottom = getElementBottom;
          function getElementBottom() {
              return getElementTop(p_elm) + getElementHeight(p_elm);
          }
      }

      function CalendarControl() {

          var calendarId = 'CalendarControl';
          var currentYear = 0;
          var currentMonth = 0;
          var currentDay = 0;

          var selectedYear = 0;
          var selectedMonth = 0;
          var selectedDay = 0;

          var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
          var dateField = null;

          function getProperty(p_property) {
              var p_elm = calendarId;
              var elm = null;

              if (typeof (p_elm) == "object") {
                  elm = p_elm;
              } else {
                  elm = document.getElementById(p_elm);
              }
              if (elm != null) {
                  if (elm.style) {
                      elm = elm.style;
                      if (elm[p_property]) {
                          return elm[p_property];
                      } else {
                          return null;
                      }
                  } else {
                      return null;
                  }
              }
          }

          function setElementProperty(p_property, p_value, p_elmId) {
              var p_elm = p_elmId;
              var elm = null;

              if (typeof (p_elm) == "object") {
                  elm = p_elm;
              } else {
                  elm = document.getElementById(p_elm);
              }
              if ((elm != null) && (elm.style != null)) {
                  elm = elm.style;
                  elm[p_property] = p_value;
              }
          }

          function setProperty(p_property, p_value) {
              setElementProperty(p_property, p_value, calendarId);
          }

          function getDaysInMonth(year, month) {
              return [31, ((!(year % 4) && ((year % 100) || !(year % 400))) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month - 1];
          }

          function getDayOfWeek(year, month, day) {
              var date = new Date(year, month - 1, day)
              return date.getDay();
          }

          this.setDate = setDate;
          function setDate(year, month, day) {
              if (dateField) {
                  if (month < 10) { month = "0" + month; }
                  if (day < 10) { day = "0" + day; }
                  var dateString = year + "/" + month + "/" + day;
                  //var dateString = month+"-"+day+"-"+year;
                  dateField.value = dateString;
                  hide();
              }
              return;
          }

          this.changeMonth = changeMonth;
          function changeMonth(change) {
              currentMonth += change;
              currentDay = 0;
              if (currentMonth > 12) {
                  currentMonth = 1;
                  currentYear++;
              } else if (currentMonth < 1) {
                  currentMonth = 12;
                  currentYear--;
              }

              calendar = document.getElementById(calendarId);
              calendar.innerHTML = calendarDrawTable();
          }

          this.changeYear = changeYear;
          function changeYear(change) {
              currentYear += change;
              currentDay = 0;
              calendar = document.getElementById(calendarId);
              calendar.innerHTML = calendarDrawTable();
          }

          function getCurrentYear() {
              var year = new Date().getYear();
              if (year < 1900) year += 1900;
              return year;
          }

          function getCurrentMonth() {
              return new Date().getMonth() + 1;
          }

          function getCurrentDay() {
              return new Date().getDate();
          }

          function calendarDrawTable() {

              var dayOfMonth = 1;
              var validDay = 0;
              var startDayOfWeek = getDayOfWeek(currentYear, currentMonth, dayOfMonth);
              var daysInMonth = getDaysInMonth(currentYear, currentMonth);
              var css_class = null; //CSS class for each day

              var table = "<table cellspacing='0' cellpadding='0' border='0'>";
              table = table + "<tr class='header'>";
              table = table + "  <td colspan='2' class='previous'><a href='javascript:changeCalendarControlMonth(-1);'>&lt;</a> <a href='javascript:changeCalendarControlYear(-1);'>&laquo;</a></td>";
              table = table + "  <td colspan='3' class='title'>" + months[currentMonth - 1] + "<br>" + currentYear + "</td>";
              table = table + "  <td colspan='2' class='next'><a href='javascript:changeCalendarControlYear(1);'>&raquo;</a> <a href='javascript:changeCalendarControlMonth(1);'>&gt;</a></td>";
              table = table + "</tr>";
              table = table + "<tr><th>S</th><th>M</th><th>T</th><th>W</th><th>T</th><th>F</th><th>S</th></tr>";

              for (var week = 0; week < 6; week++) {
                  table = table + "<tr>";
                  for (var dayOfWeek = 0; dayOfWeek < 7; dayOfWeek++) {
                      if (week == 0 && startDayOfWeek == dayOfWeek) {
                          validDay = 1;
                      } else if (validDay == 1 && dayOfMonth > daysInMonth) {
                          validDay = 0;
                      }

                      if (validDay) {
                          if (dayOfMonth == selectedDay && currentYear == selectedYear && currentMonth == selectedMonth) {
                              css_class = 'current';
                          } else if (dayOfWeek == 0 || dayOfWeek == 6) {
                              css_class = 'weekend';
                          } else {
                              css_class = 'weekday';
                          }

                          table = table + "<td><a class='" + css_class + "' href=\"javascript:setCalendarControlDate(" + currentYear + "," + currentMonth + "," + dayOfMonth + ")\">" + dayOfMonth + "</a></td>";
                          dayOfMonth++;
                      } else {
                          table = table + "<td class='empty'>&nbsp;</td>";
                      }
                  }
                  table = table + "</tr>";
              }

              table = table + "<tr class='header'><th colspan='7' style='padding: 3px;'><a href='javascript:hideCalendarControl();'>الغاء</a></td></tr>";
              table = table + "</table>";

              return table;
          }

          this.show = show;
          function show(field) {

              // If the calendar is visible and associated with
              // this field do not do anything.
              if (dateField == field) {
                  return;
              } else {
                  dateField = field;
              }

              if (dateField) {
                  try {
                      var dateString = new String(dateField.value);
                      var dateParts = dateString.split("/");

                      selectedMonth = parseInt(dateParts[1], 10);
                      selectedDay = parseInt(dateParts[2], 10);
                      selectedYear = parseInt(dateParts[0], 10);
                  } catch (e) { }
              }

              if (!(selectedYear && selectedMonth && selectedDay)) {
                  selectedMonth = getCurrentMonth();
                  selectedDay = getCurrentDay();
                  selectedYear = getCurrentYear();
              }

              currentMonth = selectedMonth;
              currentDay = selectedDay;
              currentYear = selectedYear;

              if (document.getElementById) {

                  calendar = document.getElementById(calendarId);
                  calendar.innerHTML = calendarDrawTable(currentYear, currentMonth);

                  setElementProperty('display', 'inline', 'CalendarControlIFrame');
                  setProperty('display', 'inline');

                  var fieldPos = new positionInfo(dateField);
                  var calendarPos = new positionInfo(calendarId);

                  var x = fieldPos.getElementRight() - 500;
                  var y = fieldPos.getElementBottom();
                  x = x + 155;
                  y = y - 22;
                  setProperty('left', x + "px");
                  setProperty('top', y + "px");
                  setElementProperty('left', x + "px", 'CalendarControlIFrame');
                  setElementProperty('top', y + "px", 'CalendarControlIFrame');
                  setElementProperty('width', calendarPos.getElementWidth() + "px", 'CalendarControlIFrame');
                  setElementProperty('height', calendarPos.getElementHeight() + "px", 'CalendarControlIFrame');
                  //document.getElementById('CalendarControlIFrame').scrollTop = 1000;
              }
          }

          this.hide = hide;
          function hide() {
              if (dateField) {
                  setProperty('display', 'none');
                  setElementProperty('display', 'none', 'CalendarControlIFrame');
                  dateField = null;
              }
          }
      }

      var calendarControl = new CalendarControl();

      function showCalendarControl(textField) {
          //debugger
          //  var txt = document.getElementById(textField);
          calendarControl.show(textField);
      }

      function hideCalendarControl() {
          calendarControl.hide();
      }

      function setCalendarControlDate(year, month, day) {
          calendarControl.setDate(year, month, day);
      }

      function changeCalendarControlYear(change) {
          calendarControl.changeYear(change);
      }

      function changeCalendarControlMonth(change) {
          calendarControl.changeMonth(change);
      }

      function showAlert() {
          alert('helloooooooo');
      }

      document.write("<iframe id='CalendarControlIFrame' src='javascript:false;' frameBorder='0' scrolling='no'></iframe>");
      document.write("<div id='CalendarControl'></div>");

  
  </script>
  <asp:UpdatePanel runat="server" ID="updateGeneralDeathInfo" UpdateMode="Conditional">
<ContentTemplate>
<table dir="rtl" width="100%">
    <tr>
        
        <td align="right">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblDeathDate" runat="server" meta:resourcekey="lblDeathDateResource1"></asp:Label>
                    </td>
                    <td align="right">
                        <asp:TextBox ID="txtDeathDate" MaxLength="20" Width="150px" runat="server"></asp:TextBox>
                           <%--<a onclick="showCalendarControl(document.getElementById('ctl00_ContentPlaceHolderMain_UcGeneralDeathInfo1_txtDeathDate'))" href="#">
            <img src="Images/calendar.gif" style="width: 20px; height: 20px" border="0" id="img1" > </img> </a>--%>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true"
                            ValidationGroup="GenralValidate" ID="RequiredFieldValidator1" ControlToValidate="txtDeathDate"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            
                            <asp:ImageButton runat="server" ID="ImageButton1" ImageUrl="~/Images/calendar.gif" Height="20px" Width="20px"
        OnClientClick="showCalendarControl(document.getElementById('ctl00_ContentPlaceHolderMain_UcGeneralDeathInfo1_txtDeathDate'));return false;" />
                    </td>
                </tr>
            </table>
            <table align="right">
                <tr width="100%" align="right">
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="وقت الوفاة"></asp:Label>
                    </td>
                    <td align="right">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" Text="دقيقة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDeathMin" Width="30px" MaxLength="2" Text="00" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left" width="92px">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblHour" Text="ساعة" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDeathHour" Width="30px" MaxLength="2" Text="12" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true"
                            ValidationGroup="GenralValidate" ID="RequiredFieldValidator3" ControlToValidate="txtDeathHour"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" Display="Dynamic"
                            ValidationGroup="GenralValidate" ID="RequiredFieldValidator4" ControlToValidate="txtDeathMin"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="lbl" SetFocusOnError="true" ValidationExpression="^([0]?[0-9]|[1][0-9]|[2][0-3])$"
                            ControlToValidate="txtDeathHour" runat="server" ErrorMessage="الساعة غير صحيحه"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" SetFocusOnError="true"
                            ValidationExpression="^([0]?[0-9]|[1-5][0-9])$" ControlToValidate="txtDeathMin"
                            runat="server" ErrorMessage="الدقيقة غير صحيحه"></asp:RegularExpressionValidator>
                       
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<table dir="rtl" width="100%">
    <tr>
        <td width="75px">
            <asp:Label ID="lblLocationOfDeath" runat="server" meta:resourcekey="lblLocationOfDeathResource1"></asp:Label>
        </td>
        <td width="25%">
            <asp:RadioButtonList ID="rdioDeathLocation" runat="server" RepeatDirection="Horizontal"
                meta:resourcekey="rdioDeathLocationResource1">
                <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True" Value="1"></asp:ListItem>
                <asp:ListItem meta:resourcekey="ListItemResource2" Value="2"></asp:ListItem>
                <asp:ListItem meta:resourcekey="ListItemResource3" Value="3"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td width="8%">
            <asp:Label ID="lblDescriptionOfLocation" Width="20px" runat="server" meta:resourcekey="lblDescriptionOfLocationResource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtDescriptionOfLocation" MaxLength="100" Width="150px" runat="server"
                meta:resourcekey="txtDescriptionOfLocationResource1"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true"
                ValidationGroup="GenralValidate" ID="RequiredFieldValidator2" ControlToValidate="txtDescriptionOfLocation"
                ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td colspan="3">
            <table dir="rtl">
                <tr>
                    <td>
                        <asp:Label ID="lblState" runat="server" meta:resourcekey="lblStateResource1" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="lblStateValue" runat="server" meta:resourcekey="lblStateValueResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSection" runat="server" meta:resourcekey="lblSectionResource1"
                            Font-Bold="True"></asp:Label>
                    </td>
                    <td class="style1">
                        <asp:Label ID="lblSectionValue" runat="server" meta:resourcekey="lblSectionValueResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSubSection" runat="server" meta:resourcekey="lblSubSectionResource1"
                            Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSubSectionValue" runat="server" meta:resourcekey="lblSubSectionValueResource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</ContentTemplate>
</asp:UpdatePanel>