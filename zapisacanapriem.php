
<?php
$cur_date = date("Y-m-d");
$cur_time = date("H:i");
$hours = intval(substr($cur_time, 0, 2));
//echo $cur_time;
//echo $cur_date;
if($hours >= 21)
{

    
    $cur_date = date("Y-m-d", strtotime("tomorrow"));
    //$cur_time = "09:00";
}

 session_start();
 require_once ("zapisacanapriem.html");
?>