<?php
header('Content-Type: application/text');
require 'include/conexion.php';
$date = new DateTime(null, new DateTimeZone('America/Lima'));
$now = $date->format('Y-m-d H:i:s');
if ($stmt = $mysqli->prepare('call sp_contacts_insert(?,?,?,?,?,?,?)')) {
    $stmt->bind_param(
        'sssssss', $_POST['name'], $_POST['lastname'], 
        $_POST['telephone'], $_POST['position'], 
        $_POST['email'], $now, $now
    );
    $stmt->execute();
    $stmt->close();
} else echo 'Error al ejecutar el procedimiento: '.$mysqli->error;
$mysqli->close();
?>