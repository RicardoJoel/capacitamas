<?php 
    include 'header.php'; 
    require 'include/conexion.php';
    if ($stmt = $mysqli->prepare('call sp_questions_all')) {
        $stmt->execute();
        $quests = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
    } else echo 'Error al ejecutar el procedimiento: '.$mysqli->error;
    if ($stmt = $mysqli->prepare('call sp_months_all')) {
        $stmt->execute();
        $months = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        $stmt->close();
    } else echo 'Error al ejecutar el procedimiento: '.$mysqli->error;
    $mysqli->close();
?>
<div class="container">
    <div class="fila">
        <div class="columna columna-1">
            <h4 class="title1">Gracias por participar del proceso de creación de Capacita+</h4>
        </div>
    </div>
    <div class="fila">
        <div class="space"></div>
        <div class="columna columna-1">
            <div class="title2">
                <h6>Por favor, completa la siguiente encuesta</h6>
            </div>
        </div>
    </div>
    <form id="frm-propuesta" action="sendsurvey.php" method="post" class="form-participacion">
        <div class="fila steps">
            <span class="step active">Preg. 1</span>
            <span class="step">Preg. 2</span>
            <span class="step">Preg. 3</span>
            <span class="step">Preg. 4</span>
        </div>
        <?php 
            include 'step1.php';
            include 'step2.php';
            include 'step3.php';
            include 'step4.php';
        ?>
        <div class="fila">
            <div class="columna columna-1">
                <div class="downnav">
                    <button type="button" id="prevBtn" onclick="nextPrev(-1)"><i class="fa fa-reply"></i> Atrás</button>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="assets/js/steps.js"></script>
<script src="assets/js/survey.js"></script>
<?php 
    include 'aviso.php';
    include 'footer.php';
?>
