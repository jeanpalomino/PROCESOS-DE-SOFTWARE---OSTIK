<?php
require('fpdf/fpdf.php');

$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
$pdf->Cell(40,10,'¡Hola, Mundo!');
$pdf->Image('ostik.jpg',10,10,-300);
$pdf->Output();
?>

<?php
// Queremos hacer en pdf la factura numero 1 de la tipica BBDD de facturacion
require('fpdf/fpdf.php');
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);

// Imprimimos el logo a 300 ppp
$pdf->Image('../../ostik.jpg',10,10,-300);

// Consulta a la base de datos para sacar cosas de la factura 1
$c=mysql_connect("127.0.0.1","root","root");
mysql_select_db("facturitas");

$orden1="SELECT nombre,direccion,nif,fecha,num_fact
FROM clientes,facturas
WHERE clientes.cod_cli=facturas.cod_cli
AND facturas.num_fact=1";
$paquete1=mysql_query($orden1);
$reg1=mysql_fetch_array($paquete1);

$orden2="SELECT denominacion,precio,cantidad
FROM articulos,lineas_factura
WHERE lineas_factura.cod_art=articulos.cod_art
AND lineas_factura.num_fact=1";
$paquete2=mysql_query($orden2);

mysql_close($c);

// 1º Datos del cliente
$texto1="Cliente: ".$reg1[0]."\nDireccion: ".$reg1[1]."\nNIF: ".$reg1[2];
$pdf->SetXY(25, 50);
$pdf->MultiCell(90,10,$texto1,1,"L");

// 2º Datos de la factura (fecha y numero de factura)
$texto2="Factura número: ".$reg1[4]." de fecha: ".$reg1[3];
$pdf->SetXY(25, 90);
$pdf->Cell(150,10,$texto2,1,0,"C");

// 3º Una tabla con los articulos comprados

// La cabecera de la tabla (en azulito sobre fondo rojo)
$pdf->SetXY(40, 120);
$pdf->SetFillColor(255,0,0);
$pdf->SetTextColor(0,255,255);
$pdf->Cell(80,10,"Articulo",1,0,"C",true);
$pdf->Cell(30,10,"Cant.",1,0,"C",true);
$pdf->Cell(20,10,"€/Ud",1,0,"C",true);
$pdf->Cell(30,10,"Subt.",1,1,"C",true);
$total=0;

// Los datos (en negro)
$pdf->SetTextColor(0,0,0);

    while($reg2=mysql_fetch_array($paquete2)){
        $pdf->SetX(40);
        $pdf->Cell(80,10,$reg2[0],1,0,"L");
        $pdf->Cell(30,10,$reg2[2],1,0,"C");
        $pdf->Cell(20,10,number_format($reg2[1],2),1,0,"C");
        $pdf->Cell(30,10,number_format(($reg2[2]*$reg2[1]),2),1,1,"R");
        $total+=($reg2[2]*$reg2[1]);
    }

// 4º Los totales, IVAs y demás
$pdf->SetX(120);
$pdf->Cell(50,10,"Subtotal:",1,0,"C");
$pdf->Cell(30,10,number_format($total,2),1,1,"R");
$pdf->SetX(120);
$pdf->Cell(50,10,"IVA (4%): ",1,0,"C");
$pdf->Cell(30,10,number_format(0.04*$total,2),1,1,"R");
$pdf->SetX(120);
$pdf->Cell(50,10,"Total:",1,0,"C");
$pdf->Cell(30,10,number_format(1.04*$total,2),1,1,"R");

// El documento enviado al navegador
$pdf->Output();
?>