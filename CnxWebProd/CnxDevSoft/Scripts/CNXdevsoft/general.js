/**
* Script file for general purposes
* Author: Janus 
**/

/*** Small change div effect ***/
    var ori_border_col = '';
    function changeDiv(ele, color)
    {
      ori_border_col = ele.style.borderColor;
      ele.style.borderColor = color;
    }



    function GenerateDateTimeTools()
    {
        $("#datetimepickerAddress").datetimepicker({
            pickTime: false, language: 'en'
        });
        $("#datetimepickerPickup").datetimepicker({
            pickTime: false, language: 'en'
        });
    }



    function ScrollbarRender()
    {
        $('.CartDetail').slimScroll({
            color: '#012950',
            size: '6px',
            height: '200',
            alwaysVisible: true,
            opacity: 1,
            touchScrollStep: 50,
            wheelStep: 10
        });
    }


    function ScrollBarOfBasketPopup()
    {
        

        $('#CartOnHeader').on('shown.bs.dropdown', function () {
            $("#Cart-Dropdown").css("display", "block");
            ScrollbarRender();
           
        })

        $("body").click(function (e) {
            $('#CartOnHeader').on('hidden.bs.dropdown', function () {
                $("#Cart-Dropdown").css("display", "none");
            })

            $('#CartOnRightSide').on('hidden.bs.dropdown', function () {
                $("#CartOnRight-Dropdown").css("display", "none");
            })

        })

        $('#CartOnRightSide').on('shown.bs.dropdown', function () {
            $("#CartOnRight-Dropdown").css("display", "block");

            ScrollbarRender();
        })



        $("#Cart-Dropdown").bind('click', function (e) {
            $("#Cart-Dropdown").css("display", "block");

            ScrollbarRender();
            e.stopPropagation();
        });
        $("#CartOnRight-Dropdown").bind('click', function (e) {
            $("#CartOnRight-Dropdown").css("display", "block");

            ScrollbarRender();
            e.stopPropagation();
        });

    }




    function IsRepresents()
    {
        $('#IsRepresents').click(function () {
            if ($('#IsRepresents').is(':checked')) {
                $("#repersents").attr("required", "required");
                $("#repersents").toggle(this.checked);
            }
            else {
                $("#repersents").toggle(this.checked);
                $("#repersents").removeAttr("required");
            }
        });
    }

    function isKrone(str) {
        var re = /^([1-9]{1}[\d]{0,2}(\.[\d]{3})*(\,[\d]{0,2})?|[1-9]{1}[\d]{0,}(\,[\d]{0,2})?|0(\,[\d]{0,2})?|(\,[\d]{1,2})?)$/
        if (re.test(str)) {
            return true
        };
        return false;
    }

/*** Validation ***/
function isEmpty( str )
{
  if( str == null || str.length == 0 ){ return true; }
  return false;
}

function isNumeric(str)
{
  var re = /[\D]/g
  if (re.test(str)) return false;
  return true;
}

function isEmail(str)
{
  if(isEmpty(str)) return false;
  var re = /^[^\s()<>@,;:\/]+@\w[\w\.-]+\.[a-z]{2,}$/i
  return re.test(str);
}

function isLengthBetween(str, min, max)
{
    return (str.length >= min)&&(str.length <= max);
}

function isAlphaNumericAndWhitespaces(value)
{   
    var re = /^[0-9A-Za-z\sæøåÆØÅ,.:;-?+()%#!/]+$/;
    if(re.test(value))
        return true;
    return false;
}

function isAlphaNumericAndWhitespacesMinMax(str, min, max)
{
    if(isAlphaNumericAndWhitespaces(str))
        return isLengthBetween(str, min, max)
    return false;
}

function isNumericMinMax(str, min, max)
{
  if(isNumeric(str))
    return isLengthBetween(str, min, max)
  return false;
}

function displayStatusMessage(ele, type, msg)
{
  ele.html('<div style="color:'+(type == 1 ? 'green; font-size:18px;' : 'red; font-size:16px;')+';">'+msg+'</div>');  
  ele.slideDown();
 /*** setTimeout(function()
  {  
    ele.slideUp('slow'); 
  }, 5000);
  ***/
}

    function sendEmailNewCustomer()
    {  
    /*** Get the input values from the FORM ***/
    var comp_name = $('#company_name').val();
    var address = $('#address').val();
    var zip_city = $('#zip_city').val();
    var country = $('#country').val();
    var phone = $('#phone').val();
    var email = $('#email').val();
    var website = $('#website').val();

    var bank_connection = $('#bank_connection').val();
    var bank_number = $('#bank_number').val();
    var cb_order_catalog = ( $('#order_catalog').attr('checked') ? 'Ja' : 'Nej'); 
    var cb_register_as_customer = ( $('#register_as_customer').attr('checked') ? 'Ja' : 'Nej');  

    var company_number = $('#company_number').val();
    var company_cvr = $('#company_cvr').val();
  var cb_buy_usage = ( $('#buy_usage').attr('checked') ? 'Eget forbrug' : 'Videresalg'); 
  var branch = $('#branch').val();
  var buy_amount = $('#buy_amount').val();
  var cb_is_store = ( $('#is_store').attr('checked') ? 'Ja' : 'Nej'); 
  var opening_times = $('#opening_times').val();
  var store_area = $('#store_area').val();
  var pruduct_group = $('#pruduct_group').val();
  var comment = $('#comment').val();

    if(!isAlphaNumericAndWhitespacesMinMax(comp_name, 2, 250)){      displayStatusMessage($('#error_message'), 2, 'Du skal skrive et gyldigt firmanavn.');  return; }
    //if(!isAlphaNumericAndWhitespacesMinMax(address, 2, 250)){      displayStatusMessage($('#error_message'), 2, 'Du skal skrive en gyldig adresse.');  return; }
    if(!isAlphaNumericAndWhitespacesMinMax(zip_city, 2, 250)){      displayStatusMessage($('#error_message'), 2, 'Du skal skrive et gyldigt postnummer og bynavn.');  return; }
    if(!isAlphaNumericAndWhitespacesMinMax(country, 2, 250)){      displayStatusMessage($('#error_message'), 2, 'Du skal skrive et Land.');  return; }
    if(!isNumericMinMax(phone, 8, 11)){                  displayStatusMessage($('#error_message'), 2, 'Du skal skrive et gyldigt telefon-nummer.');  return; }
    if(!isEmail(email)){                        displayStatusMessage($('#error_message'), 2, 'Du skal skrive en gyldig email-adresse.');  return; }

    //if(!isLengthBetween(bank_connection, 2, 250)){  displayStatusMessage($('#error_message'), 2, 'Du skal skrive en gyldig bankforbindelse.');  return; }
    //if(!isLengthBetween(bank_number, 2, 250)){    displayStatusMessage($('#error_message'), 2, 'Du skal skrive et gyldigt Reg. nr Konto nr.');  return; }

    //if(!isLengthBetween(company_number, 2, 30)){    displayStatusMessage($('#error_message'), 2, 'Du skal skrive et gyldigt ApS - A/S reg. nr.');  return; }
    //if(!isLengthBetween(company_cvr, 2, 30)){    displayStatusMessage($('#error_message'), 2, 'Du skal skrive et gyldigt CVR-nr.');  return; }
  if(!isLengthBetween(branch, 2, 255)){      displayStatusMessage($('#error_message'), 2, 'Du skal skrive en gyldig branche.');  return; }
  if(!isLengthBetween(buy_amount, 2, 255)){    displayStatusMessage($('#error_message'), 2, 'Du skal skrive et forventet årskøb.');  return; }
  //if(!isLengthBetween(opening_times, 2, 255)){    displayStatusMessage($('#error_message'), 2, 'Du skal skrive Åbningstider.');  return; }
  //if(!isLengthBetween(store_area, 2, 255)){    displayStatusMessage($('#error_message'), 2, 'Du skal skrive et Butiksareal.');  return; }
  if(!isLengthBetween(pruduct_group, 2, 255)){    displayStatusMessage($('#error_message'), 2, 'Du skal skrive en Primær produktgruppe.');  return; }
  //if(!isLengthBetween(comment, 0, 9999)){      displayStatusMessage($('#error_message'), 2, 'Skriv en gyldig Bemærkning.');  return; }

    /*** Contruct the template of email send ***/
    var email_subject = 'HP SCHOU - New Customer';
    var email_to_ = 'jl@hpschou.com';
    var email_to_1 = 'caf@hpschou.com';
    var email_content = '<table>'+
                '<tr><td>Firmanavn:</td><td>'+comp_name+'</td></tr>'+
                '<tr><td>Adresse:</td><td>'+address+'</td></tr>'+
                '<tr><td>Postnr/By:</td><td>'+zip_city+'</td></tr>'+
                '<tr><td>Telefon:</td><td>'+phone+'</td></tr>'+
                '<tr><td>Email:</td><td>'+email+'</td></tr>'+
                '<tr><td>Website:</td><td>'+website+'</td></tr>'+
                '<tr><td colspan="2">&nbsp;</td></tr>'+
                '<tr><td>Bankforbindelse:</td><td>'+bank_connection+'</td></tr>'+
                '<tr><td>Reg. nr. Kontonr.:</td><td>'+bank_number+'</td></tr>'+
                '<tr><td>Bestil katalog:</td><td>'+cb_order_catalog+'</td></tr>'+
                '<tr><td>Oprettelse som bruger:</td><td>'+cb_register_as_customer+'</td></tr>'+
        '<tr><td colspan="2">&nbsp;</td></tr>'+
                '<tr><td>APS-A/S reg-nr:</td><td>'+company_number+'</td></tr>'+
                '<tr><td>CVR-nr.:</td><td>'+company_cvr+'</td></tr>'+
                '<tr><td>Indkøbet hos os foretages til:</td><td>'+cb_buy_usage+'</td></tr>'+
                '<tr><td>Branche:</td><td>'+branch+'</td></tr>'+
        '<tr><td>Forventet årskøb:</td><td>'+buy_amount+'</td></tr>'+
        '<tr><td>Butik:</td><td>'+cb_is_store+'</td></tr>'+
        '<tr><td>Åbningstider:</td><td>'+opening_times+'</td></tr>'+
        '<tr><td>Butiksareal:</td><td>'+store_area+'</td></tr>'+
        '<tr><td>Primær produktgruppe:</td><td>'+pruduct_group+'</td></tr>'+
        '<tr><td colspan="2">&nbsp;</td></tr>'+
        '<tr><td>Bemærkning:</td><td>&nbsp;</td></tr>'+
        '<tr><td colspan="2">'+comment+'</td></tr>'+
              '</table>';
    // Encode
    var email_content_encoded = encodeURIComponent(email_content); 
      
       /*** Clear the input values from the FORM ***/
      $('#company_name').val("");
      $('#address').val("");
      $('#zip_city').val("");
      $('#country').val("");
      $('#phone').val("");
      $('#email').val("");
      $('#website').val("");
      $('#bank_connection').val("");
      $('#bank_number').val("");
     /* 
      $('#order_catalog').attr('checked') ? 'Ja' : 'Nej'); 
      $('#register_as_customer').attr('checked') ? 'Ja' : 'Nej'); 
      */
      $('#company_number').val("");
      $('#company_cvr').val("");
      /*
       $('#buy_usage').attr('checked') ? 'Eget forbrug' : 'Videresalg'); 
      */
      $('#branch').val("");
      $('#buy_amount').val();
     /*
      $('#is_store').attr('checked') ? 'Ja' : 'Nej'); 
      */
      $('#opening_times').val("");
      $('#store_area').val("");
      $('#pruduct_group').val("");
      $('#comment').val("");
      
      
    //escape(
        //alert('1');
        $.ajax(
        {
            type: "POST",
            data: {subject: email_subject, email_to: email_to_, content: email_content_encoded},
            url: 'SendMail.aspx',
            cache: false,
            success: function(return_status)
            {
              //alert(return_status);
              var type = return_status.substring(0, 1);
              var msg = return_status.substring(1, return_status.length);
              displayStatusMessage($('#error_message'), type, msg);
              alert('success to '+email_to_);
            },
            error: function(xhr, txtstat, errorThrown) 
            {
                alert("SendMail3 XMLHttpRequest: " + xhr + "\n" + "textStatus:" + txtstat + "\n" + "errorThrown: " + errorThrown);
            }
        });
        /*** Send to second email ***/
        $.ajax(
        {
            type: "POST",
            data: {subject: email_subject, email_to: email_to_1, content: email_content_encoded},
            url: 'SendMail.aspx',
            cache: false,
            success: function(return_status)
            {
              //alert(return_status);
              var type = return_status.substring(0, 1);
              var msg = return_status.substring(1, return_status.length);
              displayStatusMessage($('#error_message'), type, msg);
              alert('success to '+email_to_1);
            },
            error: function(xhr, txtstat, errorThrown) 
            {
                alert("SendMail4 XMLHttpRequest: " + xhr + "\n" + "textStatus:" + txtstat + "\n" + "errorThrown: " + errorThrown);
            }
        });
    }
    
function sendContactEmail()
{
  var email_from = $('#email').val();
    var name = $('#name').val();
    var message = $('#message').val();
    if(!isEmail(email_from)){                  displayStatusMessage($('#error_message'), 2, 'Du skal skrive en gyldig email-adresse.'); 
                                               return; }
    if(!isAlphaNumericAndWhitespacesMinMax(name, 2, 250)){  displayStatusMessage($('#error_message'), 2, 'Du skal skrive et gyldigt navn.');  return; }
    if(!isLengthBetween(message, 2, 9999)){          displayStatusMessage($('#error_message'), 2, 'Du skal skrive en gyldig besked.');  return; }
 
  

     
    /*** Contruct the template of email send ***/
    var email_subject = 'HP SCHOU - Contact';
    var email_to_1 = 'caf@hpschou.com';  
    var email_to_2 = 'jl@hpschou.com'; // 
 
    var email_content = '<table>'+
              '<tr><td>Navn:</td><td>'+name+'</td></tr>'+
              '<tr><td>Email:</td><td>'+email_from+'</td></tr>'+
              '<tr><td>Besked:</td><td>&nbsp;</td></tr>'+
              '<tr><td colspan="2">'+message+'</td></tr>'+
            '</table>';
    // Encode
    var email_content_encoded = encodeURIComponent(email_content); 
   $('#email').val("")
   $('#name').val("");
   $('#message').val("");
  
    //escape(
        //alert('1');
        $.ajax(
        {
            type: "POST",
            data: {subject: email_subject, email_to: email_to_1, content: email_content_encoded},
            url: 'SendMail.aspx',
            cache: false,
            success: function(return_status)
            {
              //alert(return_status);
              var type = return_status.substring(0, 1);
              var msg = return_status.substring(1, return_status.length);
              displayStatusMessage($('#error_message'), type, msg);
             
             },
            error: function(xhr, txtstat, errorThrown) 
            {
                alert("SendMail1 XMLHttpRequest: " + xhr + "\n" + "textStatus:" + txtstat + "\n" + "errorThrown: " + errorThrown);
            }
        });

        $.ajax(
        {
            type: "POST",
            data: {subject: email_subject, email_to: email_to_2, content: email_content_encoded},
            url: 'SendMail.aspx',
            cache: false,
            success: function(return_status)
            {
              //alert(return_status);
              var type = return_status.substring(0, 1);
              var msg = return_status.substring(1, return_status.length);
              displayStatusMessage($('#error_message'), type, msg);
            },
            error: function(xhr, txtstat, errorThrown) 
            {
                alert("SendMail2::XMLHttpRequest: " + xhr + "\n" + "textStatus:" + txtstat + "\n" + "errorThrown: " + errorThrown);
            }
        });
}


