<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// Initialize the session
session_start();
 
// Check if the user is logged in, otherwise redirect to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
 
// Include config file
require_once "dbutil.php";

if($_SERVER["REQUEST_METHOD"]=="POST"){
    
    $con = new mysqli($SERVER, $USERNAME, $PASSWORD, $DATABASE);
    // Check connection
    if (mysqli_connect_errno()) {
    echo("Can't connect to MySQL Server. Error code: " .
    mysqli_connect_error());
    return null;
    }

    $username = $_SESSION["username"];
    $result = $con->query("DELETE FROM account_info WHERE username='$username'");
    if($result){
        session_destroy();
        header("location: signup.php");
    }
    else{
        echo "Did not delete.";
    }
}

?>


<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body{ font: 14px sans-serif; text-align: center; }
    </style>
</head>
<body>
<ul class="nav justify-content-center">
     <li class="nav-item">
     <a class="nav-link active" href="products.html">MarketPlace</a>
     </li>
     <li class="nav-item">
     <a class="nav-link" href="account.php">Account</a>
     </li>
     <li class="nav-item">
     <a class="nav-link" href="reset-password.php">Reset Password</a>
     </li>
     <li class="nav-item">
     <a class="nav-link" href="logout.php">Sign Out</a>
     </li>
    </ul>

    <br></br>
<form name="my_form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
    <br></br>
    <input type="submit" name="btn_delete" value="Delete User" class="btn btn-danger btn-lg active"/>
    <br></br>
    <a class="btn btn-link ml-2" href="account.php">Cancel</a>
</form>
</body>

</html>