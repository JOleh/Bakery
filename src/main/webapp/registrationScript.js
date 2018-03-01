jQuery('document').ready(function () {

    jQuery('#submit').on('click', function () {
        var name = jQuery('#name').val();
        var surname = jQuery('#surname').val();
        var phone = jQuery('#phonenumber').val();
        var email = jQuery('#email').val();
        var password = jQuery('#pass1').val();
        var password2 = jQuery('#pass2').val();

        if(name === '' || surname === '' || (phone === '' && email === '') || password!==password2){
            jQuery('#submit_msg').text('Fill in all the fields');
        }else{
            var msg = 'name='+name+'&'+'surname='+surname+'&'+'phone='+phone+
                        '&'+'email='+email+'&'+'password='+password;
            register(msg);
        }
    });

    jQuery(function(){
        jQuery("#phonenumber").mask("+99(999)999-9999");
    });
    
    jQuery('#pass2').focusout( function () {
        /*alert('lose focus');*/
        var pass1 = jQuery('#pass1').val();
        var pass2 = jQuery('#pass2').val();

        if(pass1 !== '' && pass1 !== pass2 ){
            jQuery('#pass2_msg').text('Incorrect password');
        }else{
            jQuery('#pass2_msg').text('');
        }
    });

    jQuery('#pass1').focusout(function () {
        var pass1 = jQuery('#pass1').val();
        if(pass1 === ''){
            jQuery('#pass2_msg').text('');
        }
    });

    jQuery('#email').on('keyup', function () {
        var name = jQuery('#email').val();
        //alert("msg");
        if(name !== ''){
            var msg = 'email='+name;
            check(msg, 'email_msg', 'CheckEmail');
        }
    });

    jQuery('#phonenumber').on('keyup', function () {
        var phone = jQuery('#phonenumber').val();
        if (phone !== ''){
            var msg = 'phone='+phone;
            check(msg, 'phone_msg', 'CheckPhone');
        }
    })
});

function register(params) {
    var request = new XMLHttpRequest();

    request.onreadystatechange = function () {
        if (request.readyState === 4 && request.status === 200){
            var msg = request.responseText;
            jQuery('input[name="name"]').val('Введіть і\'мя');
            jQuery('#surname').val('');
            jQuery('#phonenumber').val('');
            jQuery('#email').val('');
            jQuery('#pass1').val('');
            jQuery('#pass2').val('');
            jQuery('#submit_msg').text(msg);
            //window.location.replace('index.jsp');
        }/*else{
            jQuery('#submit_msg').text('Problems with registration');
        }*/
    };
    request.open('POST', 'Registration');
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    request.send(params);
}

function check(param, result, cl) {
    var request = new XMLHttpRequest();

    request.onreadystatechange = function () {
        if (request.readyState === 4 && request.status === 200){
            var msg = request.responseText;
            jQuery('#'+result).text(msg);
        }
    };
    request.open('POST', cl);
    request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    request.send(param);
}

