<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    session_start();
    include 'safety_requests.php';
    if(
        isset($_SESSION["id"]) && 
        isset($_SESSION["login"]) &&
        isset($_SESSION["pass"])
        && isset($_POST["owner_name"])
        && isset($_POST["animal"])
        && isset($_POST["animal_name"])
        && isset($_POST["date"])
        && isset($_POST["time"])
        && isset($_POST["reasons"]))
    {
        $id = $_SESSION["id"];
        $owner_name = $_POST["owner_name"];
        $animal = $_POST["animal"];
        $animal_name =$_POST["animal_name"];
        $date = $_POST["date"];
        $time = $_POST["time"].":00";
        $reasons = $_POST["reasons"];


        $dblink = mysqli_connect("localhost", "root", "", "lecht");

        $id = safety_request($dblink, $id);
        $owner_name = safety_request($dblink, $owner_name);
        $animal = safety_request($dblink, $animal);
        $animal_name = safety_request($dblink, $animal_name);
        $date = safety_request($dblink, $date);
        $time = safety_request($dblink, $time);
        $reasons = safety_request($dblink, $reasons);
   


        $reqst = "INSERT INTO `appointment_with_a_vet` 
        (`r_id`, `id`, `owner_name`, `animal`, `animal_name`, `date`, `time`, `reasons`) 
        VALUES ('NULL', '".$id."', '".$owner_name."', '".$animal."', '".$animal_name."', '".$date."', 
        '".$time."', '".$reasons."')";

        $query = mysqli_query($dblink, $reqst);
        if($query){
            echo("Успешно");
            
        } 
        else
        {
            echo("Ошибка базы данных, попробуйте познее");
        }
    }
    else{
        echo("Запрос есть, но вы не авторизованны, авторизуйтесь");
    }


}
else{
    echo("Ошибка перехода, вам похоже не сюда");
}


?>