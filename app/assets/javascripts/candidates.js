$(function () {
	$("#showMatchedStudent").click(function() {
		$.ajax({
            url: '/company/candidate/student',
            method: 'get',
            dataType: 'json',
            data: { id: $('#showMatchedStudent').data('id')},
            parameters: { id: $('#showMatchedStudent').data('id')},
            success: function(e) {
                console.log(e);



                $("#matched_student").modal("show");
            },
            error: function(e) {
                console.log(e);
                alert(e.responseJSON.errors);
                return false;
            }
        });
		
	});
})