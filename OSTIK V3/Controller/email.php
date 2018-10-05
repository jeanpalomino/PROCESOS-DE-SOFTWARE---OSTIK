<?php


require 'email/PHPMailer/PHPMailerAutoload.php';

$mail = new PHPMailer();

$mail->isSMTP();
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'tls';
$mail->Host = 'smtp.gmail.com';
$mail->Port = '587';
$mail->Username = 'whisbony@gmail.com';
$mail->Password = 'jhms2009';

$mail->setFrom('whisbony@gmail.com', 'Confirmación de pedido');

$mail->addAddress('poolpalomino1@gmail.com','Cliente');

$mail->Subject = 'Estado de Pedido';
$mail->Body = 'Su pedido se ha procesado';

if($mail->send()){
	echo " ";

} else{
		echo "error";

}


?>

<?php

session_start();
if(!isset($_SESSION["uid"])){
	header("location:index.php");
}

?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>OSTIK</title>
		<link rel="stylesheet" href="css/bootstrap.min.css"/>
		<link rel="stylesheet" href="estilo1.css"/>
		<script src="js/jquery2.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="main.js"></script>
		<style><link rel="stylesheet" href="estilo1.css"/>
			table tr td {padding:10px;}
		</style>
	</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">	
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapse" aria-expanded="false">
					<span class="sr-only">navegación</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand"><a class="navbar-brand"><img align="top" src='ostik.jpg' style='width:120px; height:45px'/></a></a>
			</div>
		<div class="collapse navbar-collapse" id="collapse">
			<ul class="nav navbar-nav">
				<li><a href="index.php"><span class="glyphicon glyphicon-home"></span>Inicio</a></li>
			</ul>
		</div>
	</div>
	</div>	<p><br/></p>
	<p><br/></p>
	<p><br/></p>
	<div class="container-fluid">
	
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-default">
					<div class="panel-heading"></div>
					<div class="panel-body">
						<h1>Gracias </h1>
						<hr/>
						<p>Hola <?php echo $_SESSION["name"]; ?>,Su proceso de pedido se ha
completado con éxito.<b></b><br/>
						puedes continuar tus compras<br/></p>
						<a href="index.php" class="btn btn-success btn-lg">Seguir comprando</a>
					</div>
					<div class="panel-footer"></div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>





