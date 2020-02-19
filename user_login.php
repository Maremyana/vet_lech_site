<?php 

include 'safety_requests.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if(isset($_POST["login"]) && isset($_POST["password"])){



        $dblink = mysqli_connect("localhost", "root", "", "lecht");
        $login = $_POST["login"];
        $pass = $_POST["password"];
       
        $login = safety_request($dblink, $login);
        $pass = safety_request($dblink, $pass);

        // echo($login);
        // echo($pass);
        // exit();

        $query = mysqli_query($dblink, "SELECT u_id, secretinfo FROM users WHERE login='".$login."'
                                            and pswdhash='".$pass."' ");
        if(mysqli_num_rows($query) === 1)
        {
            session_start();
            $data = mysqli_fetch_assoc($query);
            $_SESSION["id"] = $data["u_id"];
            $_SESSION["login"] = $login;
            $_SESSION["pass"] = $pass;

            header('Location: lk.php');
        } 
        else {
            header('Location: nologin.html');
        }
        $query->close();
        $dblink->close();
    } 
    else {
        echo("Упсс, вас подвел post запрос");
    }
} 
else {
    echo("Упсс, вы не туда попали");
}
?>
