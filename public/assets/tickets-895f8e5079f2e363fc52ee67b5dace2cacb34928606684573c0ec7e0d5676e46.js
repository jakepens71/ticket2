$(document).ready(function()
{

	$.ajax({
		type: 'GET',
		url:'getAdmins',
		dataType: "json",
		success: function (data)
		{
			console.log(data)

			
		}
	});



});
