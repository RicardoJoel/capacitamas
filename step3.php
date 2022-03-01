<div class="tab-step">
    <div class="fila">
        <div class="columna columna-1">
            <h6>
                <?php
                    echo (count($quests) > 2) ? $quests[2]['statement'] : 'Lo sentimos, algo salió mal.';
                ?>
            </h6>
        </div>
    </div>
    <div class="fila">
        <div class="space"></div>
        <div class="columna columna-3"><br></div>
        <div class="columna columna-3">
            <center>
                <input type="text" id="txt-qst3-position" minlength="1" maxlength="50" onkeypress="return checkTexto(event)" placeholder="Máximo 50 caracteres">
                <button id="btn-qst3-check" class="btn-effie"><i class="fa fa-share"></i> Siguiente</button>
            </center>
        </div>
    </div>
</div>