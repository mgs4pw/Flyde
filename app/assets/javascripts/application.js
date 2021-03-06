//= require adminre/library/jquery/js/jquery.min
//= require adminre/library/jquery/js/jquery-migrate.min
//= require adminre/library/bootstrap/js/bootstrap.min
//= require adminre/library/core/js/core.min
//= require adminre/javascript/app.min

//= require adminre/plugins/sparkline/js/jquery.sparkline.min
//= require adminre/plugins/owl/js/owl.carousel.min
//= require adminre/plugins/layerslider/js/greensock.min
//= require adminre/plugins/layerslider/js/transitions.min
//= require adminre/plugins/layerslider/js/layerslider.min
//= require adminre/plugins/inputmask/js/inputmask.min

//= require adminre/plugins/inputmask/js/inputmask.min
//= require adminre/plugins/selectize/js/selectize.min
//= require adminre/plugins/jqueryui/js/jquery-ui.min
//= require adminre/plugins/jqueryui/js/jquery-ui-timepicker.min
//= require adminre/plugins/jqueryui/js/jquery-ui-touch.min
//= require adminre/javascript/forms/element

//= require jquery_ujs
//= require_tree

$(document).ready(function () {
	$("#experience_date_from").datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: 'yy-mm-dd'
    });

    $("#experience_date_to").datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: 'yy-mm-dd'
    });

    // datepicker + timepicker
    $("#interview_interview_datetime").datetimepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: 'yy-mm-dd'
    });

    $("#experience_date_from").datepicker({
        defaultDate: "+1w",
        numberOfMonths: 2,
        onClose: function (selectedDate) {
            $("#experience_date_to").datepicker("option", "minDate", selectedDate);
        }
    });
    $("#experience_date_to").datepicker({
        defaultDate: "+1w",
        numberOfMonths: 2,
        onClose: function (selectedDate) {
            $("#experience_date_from").datepicker("option", "maxDate", selectedDate);
        }
    });
});
