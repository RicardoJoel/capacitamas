$(function() {
    $('#btn-aviso').click(function() {
        $('#mdl-aviso').modal('hide');
    });

    $('#frm-propuesta').submit(function(e) {
        e.preventDefault();
        var url = $(this).attr('action');
        var name = $('#txt-name').val().trim();
        var lastname = $('#txt-lastname').val().trim();
        var position = $('#txt-position').val().trim();
        var telephone = $('#txt-telephone').val().trim();
        var email = $('#txt-email').val().trim();
        if (name.length < 1 || name.length > 50 || 
            lastname.length < 1 || lastname.length > 50 ||
            position.length < 1 || position.length > 50 ||
            !validatePhone(telephone) || !validateEmail(email)) {
            $('#txt-detalle').text('Por favor, asegúrate de haber ingresado los datos completos. El tamaño máximo de cada texto es cincuenta (50) caracteres. El celular debe comenzar con nueve (9) seguido de ocho (8) dígitos y la dirección de correo debe tener un formato válido.');
            $('#mdl-aviso').modal('show');
        }
        else {
            $('body').loadingModal({
                text:'Un momento, por favor...',
                animation:'wanderingCubes'
            });
            // Send the data using post
            $.post(url, {
                'name': name,
                'lastname': lastname,
                'position': position,
                'telephone': telephone,
                'email': email,
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

    function validatePhone(phone) {
        return phone.length == 9 && phone.charAt(0) == 9;
    }

    function validateEmail(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return 1 <= email.length && email.length <= 50 && regex.test(email);
    }
});
