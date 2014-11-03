/*! ========================================================================
 * home.js
 * Page/renders: forntend/index.html
 * Plugins used: carousel
 * ======================================================================== */
$(function () {
    // Carousel
    // ================================
    $("#customer-reviews").owlCarousel({
        singleItem: true,
        autoPlay: true,
        autoHeight : true
    });
    $("#lovely-client").owlCarousel({
        autoPlay: true,
        autoHeight : true,
        pagination : false
    });

    // Layerslider8
    // ================================
    if($("#layerslider").length !== 0) {
        $("#layerslider").layerSlider({
            responsive: false,
            responsiveUnder: 1280,
            layersContainer: 1280,
            skin: "fullwidth",
            hoverPrevNext: false,
            skinsPath: "/assets/adminre/plugins/layerslider/skins/"
        });
    }

    $("#gotoCompanySignup").click(function() {
        $("#signup_company").modal('show');
        $("#signup_main").modal('hide');

        $("div#singup_company_error").fadeOut();
    });

    $("#gotoStudentSignup").click(function() {
        $("#signup_student").modal('show');
        $("#signup_main").modal('hide');

        $("div#singup_company_error").fadeOut();
    });

    // User sign up Ajax call
    var signup_success = "Email has been sent to verify your email account.";

    $("form#sign_up_company").submit(function(e) {
        $.ajax({
            url: $('#sign_up_company').attr('action'),
            method: 'post',
            dataType: 'json',
            data: $('#sign_up_company').serializeArray(),
            success: function(e) {
                console.log(e);
                $("div#singup_company_error div").html(signup_success);
                $("div#singup_company_error").fadeIn();
            },
            error: function(e) {
                console.log(e);
                $("div#singup_company_error div").html(e.responseJSON.errors);
                $("div#singup_company_error").fadeIn();
            }
        });

        return false;
    });

    $("form#sign_up_student").submit(function(e) {
        $.ajax({
            url: $('#sign_up_student').attr('action'),
            method: 'post',
            dataType: 'json',
            data: $('#sign_up_student').serializeArray(),
            success: function(e) {
                console.log(e);
                $("div#singup_student_error div").html(signup_success);
                $("div#singup_student_error").fadeIn();
            },
            error: function(e) {
                console.log(e);
                $("div#singup_student_error div").html(e.responseJSON.errors);
                $("div#singup_student_error").fadeIn();
            }
        });

        return false;
    });

    $("form#sign_in_user").submit(function(e) {
        $.ajax({
            url: $('#sign_in_user').attr('action'),
            method: 'post',
            dataType: 'json',
            data: $('#sign_in_user').serializeArray(),
            success: function(e) {
                console.log(e);
            },
            error: function(e) {
                console.log(e);

                $("div#singin_error div").html(e.responseJSON.errors);
                $("div#singin_error").fadeIn();
            }
        });

        return false;
    });

    $("#signin_form").on("hidden.bs.modal", function () {
        $("div#singin_error div").html("");
        $("div#singin_error").fadeOut();
    });

    // Get province list by country
    var country_element = $("form#sign_up_student select#user_country_id");
    var province_element = $("form#sign_up_student select#user_province_id");
    var getProvinceList = function(e){
        $.ajax({
            url:'/provinces',
            type:'GET',
            data: { country: country_element.val() },
            success:function(e) { 
                province_element.empty();
                for (i = 0; i < e.length; i++) {
                    province_element.append(new Option(e[i].name, e[i].id));
                }
            },
            error: function(e) {
                province_element.empty();
                console.log(e);
            }
        });
    }

    country_element.on("change", getProvinceList);
    country_element.trigger("change");

});


