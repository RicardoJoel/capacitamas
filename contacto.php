<?php 
    include 'header.php'; 
?>
<div class="container">
    <div class="fila">
        <div class="columna columna-1">
            <h4 class="title1">Gracias por tu apoyo.</h4>
        </div>
    </div>
    <div class="fila">
        <div class="space"></div>
        <div class="columna columna-1">
            <h6>Por favor, completa el formulario con los datos del representante de tu universidad para ponernos en contacto.</h6>
        </div>
    </div>
    <form id="frm-propuesta" action="sendcontact.php" method="post" class="form-participacion">
        <div class="fila">
            <div class="space1"></div>
            <div class="columna columna-3">
                <label>Nombre</label>
                <input type="text" id="txt-name" minlength="1" maxlength="50" onkeypress="return checkNombre(event)" placeholder="Máximo 50 caracteres">
            </div>
            <div class="columna columna-3">
                <label>Apellido</label>
                <input type="text" id="txt-lastname" minlength="1" maxlength="50" onkeypress="return checkNombre(event)" placeholder="Máximo 50 caracteres">
            </div>
            <div class="columna columna-3">
                <label>Cargo</label>
                <input type="text" id="txt-position" minlength="1" maxlength="50" onkeypress="return checkTexto(event)" placeholder="Máximo 50 caracteres">
            </div>
            <div class="columna columna-3">
                <label>Email</label>
                <input type="email" id="txt-email" minlength="6" maxlength="50" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$" placeholder="correo@ejemplo.com">
            </div>
            <div class="columna columna-3">
                <label>Celular</label>
                <input type="tel" id="txt-telephone" minlength="9" maxlength="9" pattern="9[0-9]{8}" onkeypress="return checkNumero(event)" placeholder="999 999 999">
            </div>
        </div>
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <center>
                    <button id="btn-send" class="btn-effie"><i class="fa fa-send"></i> Enviar datos</button>
                </center>
            </div>
        </div>
    </form>
</div>
<script src="assets/js/steps.js"></script>
<script src="assets/js/contact.js"></script>
<?php 
    include 'aviso.php';
    include 'footer.php';
?>
