<div class="tab-step">
    <div class="fila">
        <div class="columna columna-1">
            <h6>
                <?php
                    echo (count($quests) > 3) ? $quests[3]['statement'] : 'Lo sentimos, algo salió mal.';
                ?>
            </h6>
        </div>
    </div>
    <div class="fila">
        <div class="space1"></div>
        <div class="columna columna-1">
            <center>
            <button type="button" id="btn-qst4-yes" class="btn-effie">Sí</button>
            <button type="button" id="btn-qst4-not" class="btn-effie">No</button>
            </center>
        </div>
    </div>
    <div id="div-contact">
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <h6>
                    <?php
                        echo (count($quests) > 3) ? $quests[3]['substatement1'] : 'Lo sentimos, algo salió mal.';
                    ?>
                </h6>
            </div>
        </div>
        <div class="fila">
            <div class="space1"></div>
            <div class="columna columna-3">
                <label>Nombre</label>
                <input type="text" id="txt-qst4-cont-name" minlength="1" maxlength="50" onkeypress="return checkNombre(event)" placeholder="Máximo 50 caracteres">
            </div>
            <div class="columna columna-3">
                <label>Apellido</label>
                <input type="text" id="txt-qst4-cont-lastname" minlength="1" maxlength="50" onkeypress="return checkNombre(event)" placeholder="Máximo 50 caracteres">
            </div>
            <div class="columna columna-3">
                <label>Celular</label>
                <input type="tel" id="txt-qst4-cont-phone" minlength="9" maxlength="9" pattern="9[0-9]{8}" onkeypress="return checkNumero(event)" placeholder="999 999 999">
            </div>
        </div>
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <center>
                    <button id="btn-qst4-cont-send" class="btn-effie"><i class="fa fa-send"></i> Enviar solicitud</button>
                </center>
            </div>
        </div>
    </div>
    <div id="div-authority">
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <h6>
                    <?php
                        echo (count($quests) > 3) ? $quests[3]['substatement2'] : 'Lo sentimos, algo salió mal.';
                    ?>
                </h6>
            </div>
        </div>
        <div class="fila">
            <div class="space1"></div>
            <div class="columna columna-3">
                <label>Nombre</label>
                <input type="text" id="txt-qst4-auth-name" minlength="1" maxlength="50" onkeypress="return checkNombre(event)" placeholder="Máximo 50 caracteres">
            </div>
            <div class="columna columna-3">
                <label>Apellido</label>
                <input type="text" id="txt-qst4-auth-lastname" minlength="1" maxlength="50" onkeypress="return checkNombre(event)" placeholder="Máximo 50 caracteres">
            </div>
            <div class="columna columna-3">
                <label>Cargo</label>
                <input type="text" id="txt-qst4-auth-position" minlength="1" maxlength="50" onkeypress="return checkTexto(event)" placeholder="Máximo 50 caracteres">
            </div>
            <div class="columna columna-3">
                <label>Email</label>
                <input type="email" id="txt-qst4-auth-email" minlength="6" maxlength="50" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2, 4}$" placeholder="correo@ejemplo.com">
            </div>
            <div class="columna columna-3">
                <label>Celular</label>
                <input type="tel" id="txt-qst4-auth-phone" minlength="9" maxlength="9" pattern="9[0-9]{8}" onkeypress="return checkNumero(event)" placeholder="999 999 999">
            </div>
        </div>
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <center>
                    <button id="btn-qst4-auth-send" class="btn-effie"><i class="fa fa-send"></i> Enviar solicitud</button>
                </center>
            </div>
        </div>
    </div>
</div>