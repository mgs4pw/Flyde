    
	function showProfile(position_id, student_id) {
		$.ajax({
            url: '/company/candidate/student',
            method: 'get',
            dataType: 'json',
            data: { id: student_id},
            parameters: { id: student_id},
            success: function(e) {
                profile = JSON.parse(e.candidate);
                
                $("#matched_student span#profile_name").text(profile.name);
                $("#matched_student span#profile_email").text(profile.email);
                $("#matched_student span#profile_phonenumber").text(profile.phonenumber);
                $("#matched_student span#profile_birthyear").text(profile.birthyear);
                $("#matched_student span#profile_country").text(profile.country);
                $("#matched_student span#profile_province").text(profile.province);
                $("#matched_student span#profile_school").text(profile.school);
                $("#matched_student span#profile_academic").text(profile.academicstatus);
                $("#matched_student span#profile_major").text(profile.major);
                $("#matched_student span#profile_study").text(profile.study);
                $("#matched_student img#profile_photo").attr('src', profile.photo);

                $("#matched_student").modal("show");

                experiences = JSON.parse(e.experience);
                $("#matched_student tbody#experience_body").html("");
                for (i = 0; i < experiences.length; i++) {
                    tr = "<tr>" + "<td>" + experiences[i].experience + "</td>" + 
                        "<td>" + experiences[i].date_from + " ~ " + experiences[i].date_to + "</td>" + 
                        "</tr>";
                    $("#matched_student tbody#experience_body").append(tr);
                }

                skills = JSON.parse(e.skill);
                $("#matched_student div#skill_body").html("");
                for (i = 0; i < skills.length; i++) {
                    div = "<div class='col-md-2'>" + skills[i].skill + "</div>";
                    $("#matched_student div#skill_body").append(div);
                }

                $("#matched_student #link").attr("href", "/interview/request." + id)

            },
            error: function(e) {
                console.log(e);
                alert(e.responseJSON.errors);
                return false;
            }
        });
	};

    function showRequestInterview(position_id, student_id) {
        $("#interview_request").modal("show");
        $("#interview_request #interview_interview_datetime").val("");
        $("#interview_request #interview_description").val("");
        $("#interview_request #student_id").val(student_id);
        $("#interview_request #position_id").val(position_id);
    }
