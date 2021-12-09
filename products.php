<?php
	require "searchUtil.php";
	$db = searchUtil::loginConnection();
	
	$stmt = $db->stmt_init();
	
	if($stmt->prepare("select * from products where productName like ?") or die(mysqli_error($db))) {
		$searchString = '%' . $_GET['searchProduct'] . '%';
		$stmt->bind_param("s", $searchString);
		$stmt->execute();
		$stmt->bind_result($productID, $quantity, $price, $category, $status, $condition, $productName);
		echo "<table border=1><th>Product ID</th><th>Quantity</th><th>Price</th><th>Category</th><th>Status</th><th>Condition</th><th>Product Name</th>\n";
		while($stmt->fetch()) {
			echo "<tr><td>$productID</td><td>$quantity</td><td>$price</td><td>$category</td><td>$status</td><td>$condition</td><td>$productName</td></tr>";
		}
		echo "</table>";
	
		$stmt->close();
	}
	
	$db->close();


?>
