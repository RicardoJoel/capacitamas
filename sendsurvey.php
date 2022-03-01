<?php
header('Content-Type: application/text');
$date = new DateTime(null, new DateTimeZone('America/Lima'));
$now = $date->format('Y-m-d H:i:s');
$surveyId = 0;
require 'include/conexion.php';
if ($stmt = $mysqli->prepare('INSERT INTO surveys (created_at, updated_at) VALUES (?,?)')) {
    $stmt->bind_param('ss', $now, $now);
    $stmt->execute();
    $stmt->close();
    $surveyId = $mysqli->insert_id;
} else echo 'Error al ejecutar el procedimiento: '.$mysqli->error;
$mysqli->close();

if (!$surveyId) die('Lo sentimos, algo salió mal.');
require 'include/conexion.php';
if ($stmt = $mysqli->prepare('call sp_answers_insert(?,?,?,?,?,?,?,?,?,?,?)')) {
    $stmt->bind_param(
        'iiissssssss', $surveyId, 
        $_POST['month'], $_POST['courses'], $_POST['position'], 
        $_POST['name'], $_POST['lastname'], $_POST['telephone'],
        $_POST['authority'], $_POST['email'], $now, $now
    );
    $stmt->execute();
    $stmt->close();
} else echo 'Error al ejecutar el procedimiento: '.$mysqli->error;
$mysqli->close();
?>