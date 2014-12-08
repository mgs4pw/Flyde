
function showCompanyProfile(company_id) {
	$.ajax({
        url: '/student/company',
        method: 'get',
        dataType: 'json',
        data: { id: company_id},
        parameters: { id: company_id},
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

            $("#matched_company").modal("show");
        },
        error: function(e) {
            console.log(e);
            alert(e.responseJSON.errors);
            return false;
        }
    });
};
