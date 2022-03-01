<?php 
    include 'header.php'; 
?>
<div class="container">
    <div class="fila">
        <div class="columna columna-1">
            <h4 class="title1">Gracias por tu respuesta.</h4>
        </div>
    </div>
    <div class="fila">
        <div class="space"></div>
        <div class="columna columna-1">
            <h6>Por favor, indícanos por qué no deseas participar.</h6>
        </div>
    </div>
    <form id="frm-propuesta" action="sendreason.php" method="post" class="form-participacion">
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <textarea id="txt-reason" minlength="1" maxlength="500" onkeypress="return checkTexto(event)" rows="10" placeholder="Máximo 500 caracteres"></textarea>
            </div>
        </div>
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <center>
                    <button id="btn-send" class="btn-effie"><i class="fa fa-send"></i> Enviar razón</button>
                </center>
            </div>
        </div>
    </form>
</div>
<script src="assets/js/steps.js"></script>
<script src="assets/js/reason.js"></script>
<?php 
    include 'aviso.php';
    include 'footer.php';
?>
