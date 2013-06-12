var isFlight = true;
var isNS4 = document.layers ? 1 : 0;
var isIE4 = document.all;
var isNS6 = document.getElementById && !document.all ? 1 : 0;
var MSG_SUGGESTING = "Suggesting";
var MSG_NO_MATCH = "No matching found";
var MSG_3_LETTERS = "Type 3 Characters To Search";
document.onkeypress = function(obj) {
	if (isNS4) document.captureEvents(Event.KEYPRESS);
	return (((isNS4 || isNS6) ? parseInt(obj.which) : parseInt(event.keyCode)) == 13) ? false : true;
}
function SetAcCssCls(obj, Cls) {
	obj.setAttribute("class", Cls);
	obj.setAttribute("className", Cls);
}
var ACNxtAction = "";
var ACSel = 0;
var IsCrsrIn = true;
function ClrChldrn(obj) { try { if (obj.hasChildNodes()) { while (obj.childNodes.length >= 1) obj.removeChild(obj.firstChild); } } catch (e) { } }
function AutoComplete(strTextID, strResultDivID, strFrameID, strBackGroundURL, strExtraParm, strAjaxPagePath) {
	var LEFT_ARROW_KEY = 37;
	var RIGHT_ARROW_KEY = 39;
	var DOWN_ARROOW_KEY = 40;
	var UP_ARROW_KEY = 38;
	var SHIFT_KEY = 16;
	var HOME_KEY = 36;
	var END_KEY = 35;
	var ENTER_KEY = 13;
	var ESCAPE_KEY = 27;
	var CONTROL_KEY = 17;
	var CAPS_LOCK_KEY = 20;
	var PAGE_UP_KEY = 33;
	var PAGE_DOWN_KEY = 34;
	var LEFT_MOUSE_BUTTON_KEY = 1;
	var TAB_KEY = 9;
	var AC_Txt = null;
	var PAGE_SIZE = 10;
	var TotalEnt = 0;
	var TotalShwnEnt = 0;
	var LST_NODES = null;
	var AC_DV = document.getElementById(strResultDivID);
	var AC_FRA = document.getElementById(strFrameID);
	var ShwSug = false;
	var AC_Index = -1;
	var SELF = this;
	SetTextBoxID(strTextID);
	SetResultDivID(strResultDivID);
	var ExtLoad = false;
	function DocKprs(obj) {
		var KeyCode = 0;
		if (isNS4) { document.captureEvents(Event.KEYPRESS); }
		if (isNS4 || isNS6) { KeyCode = parseInt(obj.which); }
		else { KeyCode = parseInt(event.keyCode); }
		var nIndex = 0;
		if (AC_Txt != null) {
			switch (KeyCode) {
				case TAB_KEY:
					IsCrsrIn = false;
					break;
				case ESCAPE_KEY:
					AC_Txt.value = "";
					AC_DV.style.display = "none";
					AC_FRA.style.display = "none";
					break;
				case PAGE_UP_KEY:
				case PAGE_DOWN_KEY:
				case RIGHT_ARROW_KEY:
				case LEFT_ARROW_KEY:
				case CONTROL_KEY:
				case CAPS_LOCK_KEY:
				case SHIFT_KEY:
				case HOME_KEY:
				case END_KEY:
					break;
				case UP_ARROW_KEY:
					if (AC_DV.style.display == "") {
						if (AC_Index > 0) AC_Index--;
						ChngClr();
					}
					break;
				case DOWN_ARROOW_KEY:
					if (AC_DV.style.display == "") {
						if (AC_Index < TotalShwnEnt - 1) AC_Index++;
						else AC_Index = 0;
						ChngClr();
					}
					break;
				case ENTER_KEY:
					if (ShwSug) {
						if (LST_NODES != null) {
							if (LST_NODES.length > 0) {
								if (AC_Index >= 0 && AC_Index <= LST_NODES.length - 1) {
									AC_Txt.value = LST_NODES[AC_Index];
								}
							}
						}
						if (AC_DV.style.display == "") {
							AC_DV.style.display = "none";
							AC_FRA.style.display = "none";
						}
						ShwSug = false;
					}
					else {
						try {
							if (AC_Txt.SrchBtn != null) {
								AC_Txt.SrchBtn.click();
								AC_Txt.SrchBtnClkd = true;
							}
						} catch (e) { }
					}
					ExtLoad = false;
					break;
				default:
					ExtLoad = false;
					ShwSug = false;
					IsCrsrIn = true;
					AC_Index = 0;
					Srch(0, PAGE_SIZE);
					ChngClr();
					break;
			}
		}
		return false;
	}
	function Srch(nPIndex, nPSize) {
		LST_NODES = null;
		if (AC_Txt.value.length > 0 && AC_Txt.value.length < 3) {
			AC_DV.innerHTML = "<i>" + MSG_3_LETTERS + "</i>"
			AC_DV.style.display = "block";
			AC_FRA.style.display = "block";
		}
		else {
			if (AC_Txt.value.length > 2) {
				AC_DV.innerHTML = "<i>" + MSG_SUGGESTING + "...</i>"
				PAGE_SIZE = nPSize;
				ClAjx()
			}
		}
	}
	var CrntEntDv = new Array();
	function ChngClr() {
		var i = 0;
		if (AC_Index < 0) AC_Index = 0;
		if (AC_Index > TotalShwnEnt - 1) AC_Index = TotalShwnEnt - 1;
		for (i = 0; i < TotalShwnEnt; i++) {
			var obj = CrntEntDv[i];
			if (obj != null) { SetAcCssCls(obj, ((AC_Index == i) ? "CompletionListHighlighted" : "CompletionList")); }
		}
	}
	var CrntReq = 0;
	var LST_WRD = "";
	function ClAjx() {
		var StrUserValue = AC_Txt.value;
		LST_WRD = AC_Txt.value;
		CrntReq++;
		GetSuggestions(StrUserValue, strExtraParm, PAGE_SIZE);
	}
	var ObjXMLHttp;
	function GetXmlHttpObject() {
		var xmlHttp = null;
		try { xmlHttp = new XMLHttpRequest(); } catch (e) {
			try { xmlHttp = new ActiveXObject("Msxml2.XMLHTTP"); }
			catch (e) { xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); }
		}
		return xmlHttp;
	}
	function GetSuggestions(P, S, C) {
		ObjXMLHttp = GetXmlHttpObject();
		if (ObjXMLHttp == null) {
			alert("Your browser does not support AJAX!");
			return;
		}
		var url = ((strAjaxPagePath == null || strAjaxPagePath == "") ? "AirportsSearch.ashx" : strAjaxPagePath) + "?System=" + S + "&Prefix=" + P + "&Count=" + C + "&sid=" + Math.random();
		ObjXMLHttp.onreadystatechange = stateChanged;
		ObjXMLHttp.open("GET", url, true);
		ObjXMLHttp.send(null);
	}
	function stateChanged() {
		if (ObjXMLHttp.readyState == 4) {
			var str = ObjXMLHttp.responseText;
			if (str != "") {
				var Arr = str.split("@");
				OnDataReturned(Arr);
			} else OnDataReturned(new Array());
		}
	}
	function BindData(Itm) {
		var ArrT = new Array();
		var ArrV = new Array();
		for (var i = 0; i < Itm.length; i++) {
			ArrT.push(Itm[i]);
		}
		if (AC_Txt.value != "") {
			AC_Index = 0;
			var ArrCountNodes = ArrT.length;
			TotalEnt = ArrT.length;
			var ArrRes = ArrT;
			TotalShwnEnt = ArrT.length;
			LST_NODES = ArrRes;
			DispEnt(ArrRes);
			if (ArrRes.length <= 0) {
				AC_DV.innerHTML = "<i>" + MSG_NO_MATCH + ".</i>";
				AC_DV.style.display = "block";
				AC_FRA.style.display = "block";
			}
			else {
				AC_DV.style.display = "";
				AC_FRA.style.display = "";
			}
		}
		else {
			AC_DV.style.display = "none";
			AC_FRA.style.display = "none";
		}
	}
	function OnDataReturned(Arr) {
		ShwSug = false;
		CrntReq = 0;
		if (LST_WRD != AC_Txt.value) { ClAjx(); return 0; }
		if (IsCrsrIn) {
			BindData(Arr);
		}
	}
	function DispEnt(Arr) {
		AC_DV.style.display = "none";
		AC_FRA.style.display = "none";
		var i = 0;
		CrntEntDv = null;
		CrntEntDv = new Array();
		ClrChldrn(AC_DV);
		for (i = 0; i < Arr.length; i++) {
			ShwSug = true;
			var objDv = document.createElement("div");
			objDv.innerHTML = "&nbsp;" + Arr[i];
			objDv.TmpTxt = Arr[i];
			objDv.TmpIndex = i;
			objDv.onclick = function() {
				try {
					AC_Txt.value = this.TmpTxt;
					AC_DV.style.display = "none";
					AC_FRA.style.display = "none";
				} catch (e) { }
			};
			objDv.onmouseover = function() {
				try {
					ACNxtAction = "SELECT_ENTRY";
					ACSel = this.TmpIndex;
					for (var x = 0; x < CrntEntDv.length; x++) { SetAcCssCls(CrntEntDv[x], "CompletionList"); }
					SetAcCssCls(this, "CompletionListHighlighted");
				} catch (E) { }
			};
			objDv.onmouseout = function() { try { SetAcCssCls(this, "CompletionList"); } catch (e) { } };
			SetAcCssCls(objDv, ((i == 0) ? "CompletionListHighlighted" : "CompletionList"));
			objDv.style.cursor = (isIE4) ? "hand" : "pointer";
			AC_DV.appendChild(objDv);
			CrntEntDv.push(objDv);
		}
		var Tmp = (Arr == null || Arr.length <= 0) ? "" : "none";
		AC_DV.style.display = Tmp;
		AC_FRA.style.display = Tmp;
	}
	function SetTextBoxID(T) {
		AC_Txt = document.getElementById(T);
		AC_Txt.onkeyup = DocKprs;
		AddEvent(AC_Txt,"onblur",LeaveTxtBx);
    }

	function LeaveTxtBx() {
		if (!ExtLoad) {
			IsCrsrIn = false;
			var isSrchClk = false;
			try { isSrchClk = AC_Txt.SrchBtnClkd; } catch (e) { }
			if (isSrchClk != true) {
				if (LST_NODES != null) {
					if (LST_NODES.length > 0) {
						AC_Txt.value = LST_NODES[AC_Index];
					}
				}
			}
			switch (ACNxtAction) {
				case "SELECT_ENTRY":
					AC_Index = ACSel;
					if (LST_NODES != null) {
						if (LST_NODES.length > 0) {
							if (AC_Index >= 0 && AC_Index <= LST_NODES.length - 1) {
								AC_Txt.value = LST_NODES[AC_Index];
							}
						}
					}
					if (AC_DV.style.display == "") {
						AC_DV.style.display = "none";
						AC_FRA.style.display = "none";
					}
					AC_Txt.focus();
					break;
				default:
					AC_DV.style.display = "none";
					AC_FRA.style.display = "none";
					break;
			}
			ACNxtAction = "";
			ACSel = 0;
		}
	}
	function SetResultDivID(Id) { AC_DV = document.getElementById(Id); };
	this.SetLastKeyword = function(nIndex) {
		ExtLoad = false;
		var V = LST_NODES[nIndex];
		AC_DV.style.display = "none";
		AC_FRA.style.display = "none";
		AC_Txt.value = V;
	}
	this.SetList = function(Itm) {
		ExtLoad = true;
		IsCrsrIn = true;
		Itm = Itm.value;
		BindData(Itm);
	}
}
function AddEvent(obj, strEvent, functionToRun) {
    if (strEvent.slice(0, 2) == "on")
    { strEvent = strEvent.slice(2, strEvent.length) }
    if (obj.addEventListener)
    { obj.addEventListener(strEvent, eval(functionToRun), false) }
    else
    { obj.attachEvent('on' + strEvent, eval(functionToRun)) }
}