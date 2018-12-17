$(document).ready(function() {
    // GET contact
    $("#label_answer").ready(function(event) {

        $('#answer_loading').show();
        $.ajax({
            url: '/api/contact',
            type: 'GET',
            timeout:8000,
            data: '',
            cache: false,
            contentType: 'application/json; charset=UTF-8',
            success: function(response){
                $("#label_answer").html(response.question);
                $('#answer_loading').hide();
            },
            error: function(){
                $('#answer_loading').hide();
                $("#label_answer").html("API ERROR");
           }
        });

    });
   // POST
    $("#form_contact").submit(function(event) {
       event.preventDefault();
        var json = {}
        $.each($('#form_contact').serializeArray(), function() {
           json[this.name] = this.value;
        });
        json = JSON.stringify(json);
        $('#button_loading').show();
        $.ajax({
            url: '/api/contact',
            type: 'POST',
            timeout:8000,
            dataType: 'json',
            data: json,
            cache: false,
            contentType: 'application/json; charset=UTF-8',
            success: function(response){
                $('#button_loading').hide();
                $.each($('#form_contact').serializeArray(), function() {

                document.getElementById(this.name).classList.remove("is-invalid");
                document.getElementById(this.name).classList.add("is-valid");
                document.getElementById(this.name).disabled=true;
                });
                document.getElementById('button_contact').disabled=true;
                document.getElementById('button_contact').classList.remove("btn-primary");
                document.getElementById('button_contact').classList.remove("btn-warning");
                document.getElementById('button_contact').classList.add("btn-success");
                $('#button_text').html("Done");
                $('#alert_contact').show();
                $('#alert_contact_text').html("Your request added!");
            },
             error: function(xhr){
                if (xhr.status == 511){
                    document.getElementById('answer').classList.add("is-invalid");
                    $('#button_loading').hide();
                    document.getElementById('button_contact').classList.remove("btn-primary");
                    document.getElementById('button_contact').classList.remove("btn-success");
                    document.getElementById('button_contact').classList.add("btn-warning");
                    $('#alert_contact').show();
                    $('#alert_contact_text').html("Bad answer!");
                }else{
                    $('#alert_contact').show();
                    $('#alert_contact_text').html("API ERROR");
                    $('#button_loading').hide();
                    $("#button_text").html("API ERROR");
                }
           }
       });
   });

});

