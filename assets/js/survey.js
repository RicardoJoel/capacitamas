$(function() {    
    $('#btn-aviso').click(function() {
        $('#mdl-aviso').modal('hide');
    });

    $('#btn-qst1-yes').click(function() {
        $('#div-months').css('display', 'block');
        var pos = $("#div-months").offset().top;
        $("html, body").animate({
            scrollTop: pos
        }, 1000);
    });

    $('#btn-qst1-not').click(function() {
        $('#div-months').css('display', 'none');
        $('#slt-qst1-month').val('');
        nextPrev(1);
    });

    $('#slt-qst1-month').change(function() {
        if ($('#slt-qst1-month option:selected').val())
            setTimeout(() => {nextPrev(1);}, 500);
    });

    $('#btn-qst2-yes').click(function() {
        $('#div-courses').css('display', 'block');
        var pos = $("#div-courses").offset().top;
        $("html, body").animate({
            scrollTop: pos
        }, 1000);
    });

    $('#btn-qst2-not').click(function() {
        $('#div-courses').css('display', 'none');
        $('#slt-qst2-courses').val('');
        nextPrev(1);
    });

    $('#btn-qst2-check').click(function(e) {
        e.preventDefault();
        var num = $('#txt-qst2-courses').val().trim();
        if (num < 1 || num > 100) {
            $('#txt-detalle').text('Por favor, asegúrate que la cantidad de cursos de capacitación ingresados se encuentre entre uno (1) y cien (100).');
            $('#mdl-aviso').modal('show');
        }
        else {
            nextPrev(1);
        }
    });

    $('#btn-qst3-check').click(function(e) {
        e.preventDefault();
        var text = $('#txt-qst3-position').val().trim();
        if (text.length < 1 || text.length > 50) {
            $('#txt-detalle').text('Por favor, asegúrate de haber ingresado un cargo. El tamaño máximo del texto es cincuenta (50) caracteres.');
            $('#mdl-aviso').modal('show');
        }
        else {
            nextPrev(1);
        }
    });
    
    $('#btn-qst4-yes').click(function() {
        $('#div-authority').css('display', 'none');
        $('#div-contact').css('display', 'block');
        $('#txt-qst4-auth-name').val('');
        $('#txt-qst4-auth-lastname').val('');
        $('#txt-qst4-auth-position').val('');
        $('#txt-qst4-auth-email').val('');
        $('#txt-qst4-auth-phone').val('');
        var pos = $("#div-contact").offset().top;
        $("html, body").animate({
            scrollTop: pos
        }, 1000);
    });

    $('#btn-qst4-not').click(function() {
        $('#div-contact').css('display', 'none');
        $('#div-authority').css('display', 'block');
        $('#txt-qst4-cont-name').val('');
        $('#txt-qst4-cont-lastname').val('');
        $('#txt-qst4-cont-phone').val('');
        var pos = $("#div-authority").offset().top;
        $("html, body").animate({
            scrollTop: pos
        }, 1000);
    });

    $('#btn-qst4-cont-send').click(function(e) {
        e.preventDefault();
        var name = $('#txt-qst4-cont-name').val().trim();
        var lastname = $('#txt-qst4-cont-lastname').val().trim();
        var telephone = $('#txt-qst4-cont-phone').val().trim();
        if (name.length < 1 || name.length > 50 || 
            lastname.length < 1 || lastname.length > 50 ||
            !validatePhone(telephone)) {
            $('#txt-detalle').text('Por favor, asegúrate de haber ingresado tus datos completos. El tamaño máximo de cada texto es cincuenta (50) caracteres. El celular debe comenzar con nueve (9) seguido de ocho (8) dígitos.');
            $('#mdl-aviso').modal('show');
        }
        else {
            var month = $('#slt-qst1-month option:selected').val();
            var courses = $('#txt-qst2-courses').val().trim();
            var position = $('#txt-qst3-position').val().trim();
            var data = {
                'month': month,
                'courses': courses,
                'position': position,
                'name': name,
                'lastname': lastname,
                'telephone': telephone,
                'authority': '',
                'email': '',
            };
            // before send
            $('body').loadingModal({
                text:'Un momento, por favor...',
                animation:'wanderingCubes'
            });
            // Send the data using post
            $.post('sendsurvey.php', data)
            // Alerts the results
            .done(function() {
                window.location.replace('notice.php');
                $('body').loadingModal('destroy');
            })
            .fail(function(err) {
                $('#txt-detalle').html(err);
                $('#mdl-aviso').modal('show');
                $('body').loadingModal('destroy');
            });
        }
    });

    $('#btn-qst4-auth-send').click(function(e) {
        e.preventDefault();
        var name = $('#txt-qst4-auth-name').val().trim();
        var lastname = $('#txt-qst4-auth-lastname').val().trim();
        var telephone = $('#txt-qst4-auth-phone').val().trim();
        var authority = $('#txt-qst4-auth-position').val().trim();
        var email = $('#txt-qst4-auth-email').val().trim();
        if (name.length < 1 || name.length > 50 || 
            lastname.length < 1 || lastname.length > 50 ||
            authority.length < 1 || authority.length > 50 ||
            !validateEmail(email) || !validatePhone(telephone)) {
            $('#txt-detalle').text('Por favor, asegúrate de haber ingresado los datos completos. El tamaño máximo de cada texto es cincuenta (50) caracteres. El celular debe comenzar con nueve (9) seguido de ocho (8) dígitos y la dirección de correo debe tener un formato válido.');
            $('#mdl-aviso').modal('show');
        }
        else {
            var month = $('#slt-qst1-month option:selected').val();
            var courses = $('#txt-qst2-courses').val().trim();
            var position = $('#txt-qst3-position').val().trim();
            var data = {
                'month': month,
                'courses': courses,
                'position': position,
                'name': name,
                'lastname': lastname,
                'telephone': telephone,
                'authority': authority,
                'email': email,
            };
            // before send
            $('body').loadingModal({
                text:'Un momento, por favor...',
                animation:'wanderingCubes'
            });
            // Send the data using post
            $.post('sendsurvey.php', data)
            // Alerts the results
            .done(function() {
                window.location.replace('notice.php');
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
