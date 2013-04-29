function fulltime()
{
    var time = new Date();
    document.clock.full.value = time.toLocaleString();
    setTimeout('fulltime()', 500);
}