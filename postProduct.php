<?php
// Include config file
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: login.php");
    exit;
}

require_once "dbutil.php";

 
// Define variables and initialize with empty values
$quantity = $price = $category = $status = $condition = $productName = "";
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $con = new mysqli($SERVER, $USERNAME, $PASSWORD, $DATABASE);
    // Check connection
    if (mysqli_connect_errno()) {
    echo("Can't connect to MySQL Server. Error code: " .
    mysqli_connect_error());
    return null;
    }

$sql = "INSERT INTO products VALUES (?,?,?,?,?,?,?)";
if($stmt = $con->prepare($sql)){
    echo "works!";
    $stmt->bind_param("issssss", $p_pid, $p_quantity, $p_price, $p_category, $p_status, $p_condition, $p_productName);
    $p_pid = rand(10, 10000000);
    $p_quantity = $_POST['quantity'];
    $p_price = $_POST['price'];
    $p_category = $_POST['category'];
    $p_status = "available";
    $p_condition = $_POST['condition'];
    $p_productName = $_POST['productName'];
    // $p_quantity = 10;
    // $p_price = 10.99;
    // $p_category = "Electronics";
    // $p_status = "available";
    // $p_condition = "new";
    // $p_productName = "Charger";

    if($stmt->execute()){
        header("location: account.php");
    }else{
        echo "Oops! Something went wrong. Please try again later.";
    }
    $stmt->close();
}


    // Close connection
    $con->close();
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Post Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body{ font: 14px sans-serif; }
        .wrapper{ width: 360px; padding: 20px; }
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
    <div class="wrapper">
        <h2>New Product Info</h2>
        <p>Please fill this to post a new product.</p>
        
        
        
        
  <!-- NEW PRODUCT FORM -->
  <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" >
  <!-- Product name -->
  <div class="form-group">
    <label for="productName">Product Name</label>
    <input type="text" class="form-control" id = "productName" name = "productName" value="<?php echo $productName; ?>" placeholder="Bose Headphones" required>
  </div>

  <!-- Category -->
  <div class="form-group">
    <label for="category">Category</label>
    <select class="form-control" value="<?php echo $category; ?>" name="category" id="category">
      <option>Applicances</option>
      <option>Arts & Crafts</option>
      <option>Personal Care</option>
      <option>Clothing</option>
      <option>Electronics</option>
      <option>Garden & Outdoor</option>
      <option>Home/Kitchen</option>
      <option>Toys & Games</option>
      <option>Travel</option>
      <option>Office</option>
    </select>
  </div>
  <!-- Price -->
  <div class="form-group">
    <label for="price">Price</label>
    <input type="text" class="form-control" name = "price" value="<?php echo $price; ?>" placeholder="Do not include $" id="price" required>
  </div>

  <!-- quantity -->
  <div class="form-group">
    <label for="price">Quantity</label>
    <input type="number" class="form-control" name = "quantity" id="quantity" value="<?php echo $quantity; ?>" placeholder="10" required>
  </div>

  <!-- Condition -->
  <div class="form-group">
    <label for="condition">Condition</label>
    <select class="form-control" value="<?php echo $condition; ?>" name="condition" id="condition">
      <option>new</option>
      <option>used</option>
    </select>
  </div>
  
  <input type="submit" class="btn btn-primary" value="Submit">
</form>
    </div>    
</body>
</html>