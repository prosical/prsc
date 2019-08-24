$('#city-btn').click(function() {
		
			const city = $("#city-btn").val();
			
			console.log(city);

			$.ajax({
				type: "GET",
				url: "/weather/main",
				headers: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "GET"
				},
				dataType: "text",
				
				success: function(result) {
					console.log("city: " + result);
					
		
				}
			});
		
	});