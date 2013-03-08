// calculate the ASCII code of the given character
function CalcKeyCode(aChar) {
    
    var character = aChar.substring(0, 1);
    var code = aChar.charCodeAt(0);
    return code;
}

function checkNumber(val) {

    var strPass = val.value;
    var strLength = strPass.length;
    var lchar = val.value.charAt((strLength) - 1);
    var cCode = CalcKeyCode(lchar);

    /* Check if the keyed in character is a number
    do you want alphabetic UPPERCASE only ?
    or lower case only just check their respective
    codes and replace the 48 and 57 */

    if (cCode < 48 || cCode > 57) {
        var myNumber = val.value.substring(0, (strLength) - 1);
        val.value = myNumber;
    }
    return false;
}
