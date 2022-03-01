$(function() {
    $('#btn-aviso').click(function() {
        $('#mdl-aviso').modal('hide');
    });

    $('#frm-propuesta').submit(function(e) {
        e.preventDefault();
        var url = $(this).attr('action');
        var reason = $('#txt-reason').val().trim();
        if (reason.length < 1 || reason.length > 500) {
            $('#txt-detalle').text('Por favor, asegúrate de haber ingresado una razón. El tamaño máximo del texto es quinientos (500) caracteres.');
            $('#mdl-aviso').modal('show');
        }
        else {
            $('body').loadingModal({
                text:'Un momento, por favor...',
                animation:'wanderingCubes'
            });
            // Send the data using post
            $.post(url, {
                'reason': reason
            })
            // Alerts the results
            .done(function() {
                window.location.replace('notice2.php');
                $('body').loadingModal('destroy');
            })
            .fail(function(err) {
                $('#txt-detalle').html(err);
                $('#mdl-aviso').modal('show');
                $('body').loadingModal('destroy');
            });
        }
    });
});
