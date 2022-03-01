<div class="tab-step">
    <div class="fila">
        <div class="columna columna-1">
            <h6>
                <?php
                    echo (count($quests) > 1) ? $quests[1]['statement'] : 'Lo sentimos, algo salió mal.';
                ?>
            </h6>
        </div>
    </div>
    <div class="fila">
        <div class="space1"></div>
        <div class="columna columna-1">
            <center>
            <button type="button" id="btn-qst2-yes" class="btn-effie">Sí</button>
            <button type="button" id="btn-qst2-not" class="btn-effie">No</button>
            </center>
        </div>
    </div>
    <div id="div-courses">
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <h6>
                    <?php
                        echo (count($quests) > 1) ? $quests[1]['substatement1'] : 'Lo sentimos, algo salió mal.';
                    ?>
                </h6>
            </div>
        </div>
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-3"><br></div>
            <div class="columna columna-3">
                <center>
                <input type="number" id="txt-qst2-courses" min="1" max="100" onkeypress="return checkNumero(event)" placeholder="Mínimo 1 y máximo 100">
                <button id="btn-qst2-check" class="btn-effie"><i class="fa fa-share"></i> Siguiente</button>
                </center>
            </div>
        </div>
    </div>
</div>