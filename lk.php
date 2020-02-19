<?php 
    session_start();
    if(
    isset($_SESSION["id"]) && 
    isset($_SESSION["login"]) &&
    isset($_SESSION["pass"]))
    {
        $id = $_SESSION["id"];
        $login = $_SESSION["login"];
        $pass = $_SESSION["pass"];
        $dblink = mysqli_connect("localhost", "root", "", "lecht");
        $query = mysqli_query(
            $dblink, "SELECT secretinfo FROM users WHERE login='".$login."' and pswdhash='".$pass."' ");
        $records_req = "SELECT `owner_name`, `animal`, `animal_name`, `date`, `time`, `reasons` 
        FROM `appointment_with_a_vet` WHERE id = '".$id."'";
        $records = mysqli_query(
            $dblink, $records_req);
        $data = mysqli_fetch_assoc($query);
        $secret = $data["secretinfo"];
        require_once ("loginlk.html");
    } 
    else {
        echo("Упс, ошибка");
    }
    

?>
