<?php
header('Content-Type: application/text');
require 'include/conexion.php';
$date = new DateTime(null, new DateTimeZone('America/Lima'));
$now = $date->format('Y-m-d H:i:s');
if ($stmt = $mysqli->prepare('call sp_rejections_insert(?,?,?)')) {
    $stmt->bind_param('sss', $_POST['reason'], $now, $now);
    $stmt->execute();
    $stmt->close();
} else echo 'Error al ejecutar el procedimiento: '.$mysqli->error;
$mysqli->close();
?>