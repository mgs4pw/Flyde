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

function showCompanyProfile(company_id, interview_id) {
	$.ajax({
        url: '/student/company',
        method: 'get',
        dataType: 'json',
        data: { id: company_id, interview_id: interview_id},
        parameters: { id: company_id, interview_id: interview_id},
        success: function(e) {
            profile = JSON.parse(e.company);

            $("#matched_company span#profile_companyname").text(profile.company_name);
            $("#matched_company span#profile_name").text(profile.name);
            $("#matched_company span#profile_email").text(profile.email);
            $("#matched_company span#profile_phonenumber").text(profile.phonenumber);
            $("#matched_company span#profile_country").text(profile.country);
            $("#matched_company span#profile_province").text(profile.province);
            $("#matched_company img#profile_photo").attr('src', profile.photo);
            $("#matched_company img#profile_position").attr('src', profile.position);
            $("#matched_company img#profile_website").attr('src', profile.website);
            $("#matched_company #interview_id").text(profile.interview_id);
            $("#matched_company #interview_date").text(profile.interview_date);
            $("#matched_company #interview_description").text(profile.interview_desc);

            $("#matched_company #accept_btn").attr('href', 'student/interview/' + profile.interview_id + '/accept');
            $("#matched_company #deny_btn").attr('href', 'student/interview/' + profile.interview_id + '/deny');


            $("#matched_company").modal("show");
        },
        error: function(e) {
            console.log(e);
            alert(e.responseJSON.errors);
            return false;
        }
    });
};
