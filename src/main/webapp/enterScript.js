jQuery('document').ready(function () {

  jQuery('#enter').on('click', function () {
    var login = jQuery('#login').val();
    var password = jQuery('#password').val();
    var params = 'login=' + login + '&' + 'password=' + password;
    console.log(params);
    ajaxCheck(params);
  });

});

function ajaxCheck(params) {
  var xmlhttprequest = new XMLHttpRequest();

  xmlhttprequest.onreadystatechange = function () {
    if (xmlhttprequest.readyState === 4 && xmlhttprequest.status === 200) {
      var msg = xmlhttprequest.responseText;
      if (msg === 'Fill in all the fields' || msg
          === 'Password or login is incorrect') {
        jQuery('#message').text(msg);
      } else {
        window.location.replace(msg);
      }
    }
  };
  xmlhttprequest.open('POST', 'AjaxChecker');
  xmlhttprequest.setRequestHeader('Content-Type',
      'application/x-www-form-urlencoded');
  xmlhttprequest.send(params);

}