<?php  

include 'database.php';
$db = new database();
$db->addFirstUser();


if(isset($_POST['submit'])){

    $fieldnames = ['username', 'password'];

    $error = false; 

    foreach($fieldnames as $field){
        if(!isset($_POST[$field]) || empty($_POST[$field])){
            $error = true; 
        }
    }

    if(!$error){
        $username = $_POST['username'];
        $password = $_POST['password'];

         $db = new database();
         $db->login($username, $password);      
    }

}

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
    </head>
    <body>

        <form action="loginCustomer.php" method="post">
            <label for="username">Username</label>
            <input type="text" name="username" required><br>
            <label for="password">Password</label>
            <input type="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>