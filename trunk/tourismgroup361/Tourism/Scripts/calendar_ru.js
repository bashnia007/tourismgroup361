/* --- Swazz Javascript Calendar ---
/* --- v 1.0 3rd November 2006
By Oliver Bryant
http://calendar.swazz.org

Update:
Gene Bechtold
http://www.bechtold.biz
31/07/2008
*/

function getObj(objID) 
{
    if (document.getElementById) { return document.getElementById(objID); }
    else if (document.all) { return document.all[objID]; }
    else if (document.layers) { return document.layers[objID]; }
}

function checkClick(e) 
{
    var evt;
    e ? evt = e : evt = event;
    var CSE = evt.target ? evt.target : evt.srcElement;
    if (getObj('fc'))
        if (!isChild(CSE, getObj('fc')))
            getObj('fc').style.display = 'none';
}

function isChild(s, d) 
{
    while (s) 
    {
        if (s == d)
            return true;
        s = s.parentNode;
    }
    return false;
}

function Left(obj) 
{
    var curleft = 0;
    if (obj.offsetParent) 
    {
        while (obj.offsetParent) 
        {
            curleft += obj.offsetLeft
            obj = obj.offsetParent;
        }
    }
    else if (obj.x)
        curleft += obj.x;
    return curleft;
}

function Top(obj) 
{
    var curtop = 0;
    if (obj.offsetParent) 
    {
        while (obj.offsetParent) 
        {
            curtop += obj.offsetTop
            obj = obj.offsetParent;
        }
    }
    else if (obj.y)
        curtop += obj.y;
    return curtop;
}

// Calendar script
var now = new Date;
var currentCDay = now.getDate();
var currentMonthFrom = now.getMonth();
var currentFullYearFrom = now.getFullYear();
var currentMonthTo = now.getMonth();
var currentFullYearTo = now.getFullYear();

document.write('<table id="fc" style="position:absolute;border-collapse:collapse;background:#FFFFFF;border:1px solid #303030;display:none;-moz-user-select:none;-khtml-user-select:none;user-select:none;" cellpadding=2>');
document.write('<tr style="font:bold 13px Arial"><td style="cursor:pointer;font-size:15px" onclick="choosePrevMonth()">&laquo;</td><td colspan="5" id="monthss" align="center"></td><td align="right" style="cursor:pointer;font-size:15px" onclick="chooseNextMonth()">&raquo;</td></tr>');
document.write('<tr style="background:#FF9900;font:12px Arial;color:#FFFFFF"><td align=center>П</td><td align=center>В</td><td align=center>С</td><td align=center>Ч</td><td align=center>П</td><td align=center>С</td><td align=center>В</td></tr>');
for (var kk = 1; kk <= 6; kk++) 
{
    document.write('<tr>');
    for (var tt = 1; tt <= 7; tt++) {
        num = 7 * (kk - 1) - (-tt);
        document.write('<td id="v' + num + '" style="width:18px;height:18px">&nbsp;</td>');
    }
    document.write('</tr>');
}
document.write('<tr><td colspan="7" align="center" style="cursor:pointer;font:13px Arial;background:#FFC266" onclick="today()">Сегодня: ' + addzero(currentCDay, currentMonthFrom + 1, currentFullYearFrom) + '</td></tr>');
document.write('</table>');

document.all ? document.attachEvent('onclick', checkClick) : document.addEventListener('click', checkClick, false);

var updobj;
function lcs(ielem) 
{
    updobj = ielem;
    getObj('fc').style.left = Left(ielem);
    getObj('fc').style.top = Top(ielem) + ielem.offsetHeight;
    getObj('fc').style.display = '';

    // First check date is valid
    var curData = ielem.value;
    var curdtarr = curData.split('-');
    var isData;
    isData = true;
    for (var k = 0; k < curdtarr.length; k++) 
    {
        if (isNaN(curdtarr[k]))
            isData = false;
    }
    if (isData & (curdtarr.length == 3)) 
    {
        currentMonthTo = curdtarr[1] - 1;
        currentFullYearTo = curdtarr[2];
        prepcalendar(curdtarr[0], curdtarr[1] - 1, curdtarr[2]);
    }
}

function evtTgt(e) 
{
    var el;
    if (e.target) el = e.target;
    else if (e.srcElement) el = e.srcElement;
    if (el.nodeType == 3) el = el.parentNode; // defeat Safari bug
    return el;
}

function EvtObj(e) 
{
    if (!e) e = window.event; 
    return e;
}

function cs_over(e) 
{
    evtTgt(EvtObj(e)).style.background = '#FFEBCC';
}

function cs_out(e) 
{
    evtTgt(EvtObj(e)).style.background = '#FFFFFF';
}

function cs_click(e) 
{
    updobj.value = calendarValueArray[evtTgt(EvtObj(e)).id.substring(1, evtTgt(EvtObj(e)).id.length)];
    getObj('fc').style.display = 'none';
}

var months = new Array('Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентрябрь', 'Октябрь', 'Ноябрь', 'Декабрь');
var monthAllDay = new Array('31', '28', '31', '30', '31', '30', '31', '31', '30', '31', '30', '31');
var monthAllDayLeap = new Array('31', '29', '31', '30', '31', '30', '31', '31', '30', '31', '30', '31');
var calendarValueArray = new Array(42);

// view calendar
function f_cps(obj) 
{
    obj.style.background = '#FFFFFF';
    obj.style.font = '10px Arial';
    obj.style.color = '#333333';
    obj.style.textAlign = 'center';
    obj.style.textDecoration = 'none';
    obj.style.border = '1px solid #606060';
    obj.style.cursor = 'pointer';
}

/*function f_cpps(obj) 
{
    obj.style.background = '#C4D3EA';
    obj.style.font = '10px Arial';
    obj.style.color = '#FF9900';
    obj.style.textAlign = 'center';
    obj.style.textDecoration = 'line-through';
    obj.style.border = '1px solid #6487AE';
    obj.style.cursor = 'default';
}*/

/*function f_hds(obj) 
{
    obj.style.background = '#FFF799';
    obj.style.font = 'bold 10px Arial';
    obj.style.color = '#333333';
    obj.style.textAlign = 'center';
    obj.style.border = '1px solid #6487AE';
    obj.style.cursor = 'pointer';
}*/

// day selected
function prepcalendar(hd, currentMonth, currentYear) 
{
    now = new Date();
    //var sd = now.getDate();
    var td = new Date();
    td.setDate(1);
    td.setFullYear(currentYear);
    td.setMonth(currentMonth);
    var currentDay = td.getDay();
    if (currentDay == 0) currentDay = 6; else currentDay--;

    getObj('monthss').innerHTML = months[currentMonth] + ' ' + currentYear;

    var allMonthDays = ((currentYear % 4) == 0) ? monthAllDayLeap : monthAllDay;

    for (var d = 1; d <= 42; d++) 
    {
        f_cps(getObj('v' + parseInt(d)));
        
        // not empty slots
        if ((d >= (currentDay + 1)) && (d <= currentDay + allMonthDays[currentMonth])) 
        {
            getObj('v' + parseInt(d)).onmouseover = cs_over;
            getObj('v' + parseInt(d)).onmouseout = cs_out;
            getObj('v' + parseInt(d)).onclick = cs_click;

            // if today
            if (currentMonthFrom == currentMonth && currentCDay == (d - currentDay) && currentFullYearFrom == currentYear)
                getObj('v' + parseInt(d)).style.color = '#FF9900';

            getObj('v' + parseInt(d)).innerHTML = d - currentDay;

            calendarValueArray[d] = addzero(d - currentDay, currentMonth - (-1), currentYear);
        }
        // empty slots
        else 
        {
            getObj('v' + d).innerHTML = '&nbsp;';
            getObj('v' + parseInt(d)).onmouseover = null;
            getObj('v' + parseInt(d)).onmouseout = null;
            getObj('v' + parseInt(d)).onclick = null;
            getObj('v' + parseInt(d)).style.cursor = 'default';
        }
    }
}

prepcalendar('', currentMonthTo, currentFullYearTo);

// returns the next month
function chooseNextMonth() 
{
    var allMonthDays = ((currentFullYearTo % 4) == 0) ? monthAllDayLeap : monthAllDay;

    currentMonthTo += 1;
    if (currentMonthTo >= 12) 
    {
        currentMonthTo = 0;
        currentFullYearTo++;
    }
    prepcalendar('', currentMonthTo, currentFullYearTo);
}

//returns the previous month if it's possible
function choosePrevMonth() 
{
    var allMonthDays = ((currentFullYearTo % 4) == 0) ? monthAllDayLeap : monthAllDay;
    
    // user can't choose the past month or year
    if (now.getFullYear() < currentFullYearTo || now.getMonth() < currentMonthTo) 
    {
        currentMonthTo -= 1;
        if (currentMonthTo < 0) 
        {
            currentMonthTo = 11;
            currentFullYearTo--;
        }
    }
    
    prepcalendar('', currentMonthTo, currentFullYearTo);
}

function today() 
{
    updobj.value = addzero(now.getDate(), now.getMonth() + 1, now.getFullYear());
    getObj('fc').style.display = 'none';
    prepcalendar('', currentMonthFrom, currentFullYearFrom);
}

function addzero(d, m, y) 
{
    var d0 = '', m0 = '';
    if (d < 10) d0 = '0';
    if (m < 10) m0 = '0';

    return '' + d0 + d + '-' + m0 + m + '-' + y;
}