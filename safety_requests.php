<?php 
    function sanitize_html_filed($str){
        $rstr = htmlspecialchars($str, ENT_QUOTES);
        $rstr = filter_var ($rstr, FILTER_SANITIZE_STRING); 
        $rstr = sanitize_crlf($rstr);
        return $rstr;
    }
    function sanitize_sql_request($dblink, $str){
        $rstr = mysqli_real_escape_string($dblink, $str);
        return $rstr;
    }
    function sanitize_crlf($str){
        return str_replace("\n","",$str);
    }
    function safety_request($dblink, $str){
        $rstr = sanitize_html_filed($str);
        return sanitize_sql_request($dblink, $rstr);
    }
?>