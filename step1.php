<div class="tab-step">
    <div class="fila">
        <div class="columna columna-1">
            <h6>
                <?php
                    echo (count($quests) > 0) ? $quests[0]['statement'] : 'Lo sentimos, algo salió mal.';
                ?>
            </h6>
        </div>
    </div>
    <div class="fila">
        <div class="space1"></div>
        <div class="columna columna-1">
            <center>
            <button type="button" id="btn-qst1-yes" class="btn-effie">Sí</button>
            <button type="button" id="btn-qst1-not" class="btn-effie">No</button>
            </center>
        </div>
    </div>
    <div id="div-months">
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-1">
                <h6>
                    <?php
                        echo (count($quests) > 0) ? $quests[0]['substatement1'] : 'Lo sentimos, algo salió mal.';
                    ?>
                </h6>
            </div>
        </div>
        <div class="fila">
            <div class="space"></div>
            <div class="columna columna-3"><br></div>
            <div class="columna columna-3">
                <select id="slt-qst1-month">
                    <option selected disabled hidden value=""> -- Elegir una opción -- </option>
                    <?php
                        foreach($months as $month)
                            echo '<option value="'.$month['id'].'">'.$month['name'].'</option>';
                    ?>
                </select>
            </div>
        </div>
    </div>
</div>