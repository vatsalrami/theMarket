<?php
// Initialize the session
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}
?>


 
<!DOCTYPE html>
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

    <h1 class="my-5">Hi, <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>. Welcome to theMarket.</h1>
    <a href="delete-account.php" class="btn btn-danger btn-lg active">Delete Account</a>
    <h3>Your Posted Products</h3>
<?php
require_once "dbutil.php";
$con = new mysqli($SERVER, $USERNAME, $PASSWORD, $DATABASE);
// Check connection
if (mysqli_connect_errno()) {
echo("Can't connect to MySQL Server. Error code: " .
mysqli_connect_error());
return null;
}
$stmt = $con->prepare("SELECT `productName`, `quantity`, `category` FROM `products`,`user_account`,`post` WHERE post.userID = user_account.userID AND post.productID = products.productID AND user_account.username=?");
$stmt->bind_param("s", $_SESSION['username']);
$stmt->execute();
$stmt->bind_result($prodName, $quant, $cat);
echo "<table border='1'>
<tr>
<th>Product</th>
<th>Quantity</th>
<th>Category</th>
</tr>";

while($stmt->fetch()){
echo $prodName;
// echo "<td>" . $row['quantity'] . "</td>";
// echo "<td>" . $row['quantity'] . "</td>";
// echo "</tr>";
}
// echo "</table>";
?>

<p>
    <a class="btn btn-primary" href="postProduct.php" role="button">Post New Product</a>
</p>
<br></br>
<h3>Purchased Products</h3>
<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">Product Name</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>


</body>
</html>
