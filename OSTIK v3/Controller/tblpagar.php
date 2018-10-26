<?php
session_start();
include "../Model/db.php";
 ?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="../View/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="../View/estilo1.css"/>
		<script src="js/jquery2.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="main.js"></script>
	</head>
 <body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand"><img align="top" src='../View/ostik.jpg' style='width:120px; height:45px'/></a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="index.php"><span class="glyphicon glyphicon-home"></span>Inicio</a></li>

			</ul>
		</div>
	</div>
	<p><br/></p>
	<p><br/></p>
	<p><br/></p>
<?php

include('metodo1/index.php');
?>
<?php

echo '				<form action="https://www.sandbox.paypal.com/cgi-bin/webscr">
				    <input type="submit" value="Pagar Via Paypal" />
				  <input type="hidden" name="cmd" value="_cart">
				  <input type="hidden" name="business" value="shoppingcart@khanstore.com">
				   <input type="hidden" name="upload" value="1">';

				  $x=0;
				  $uid = $_SESSION["uid"];
				  $sql = "SELECT * FROM cart WHERE user_id = '$uid'";
				  $run_query = mysqli_query($con,$sql);
				  while($row=mysqli_fetch_array($run_query)){
					  $x++;
				 echo  '<input type="hidden" name="item_name_'.$x.'" value="'.$row["product_title"].'">
				  <input type="hidden" name="item_number_'.$x.'" value="'.$x.'">
				  <input type="hidden" name="amount_'.$x.'" value="'.$row["price"].'">
				  <input type="hidden" name="quantity_'.$x.'" value="'.$row["qty"].'">';
				}
 ?>


</body>
</html>
