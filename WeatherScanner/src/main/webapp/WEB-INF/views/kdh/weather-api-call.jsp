<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<h1>

</h1>
<input type="button" id="weather-btn" value="날씨확인">




<h2><p>검색한 데이터</p></h2>
<div id="show-weather">

	<p></p>
</div>

<br>

<h2><p>1년전 데이터</p></h2>
<div id="show-historyWeather">
	<p></p>
</div>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script>
$(function() {
	$("#weather-btn").on("click", function() {
		
		const latitude = "${lat}"; 
		const longitude = "${lon}"; 
		const date ="${time}";
		console.log(latitude);
		console.log(longitude);
		console.log(date);
	
		
		$.ajax({
				headers: {
                "Content-Type": "application/json",
                //'Access-Control-Allow-Origin': '*',
            	},
	            type: "GET",
	            url: "https://cors-anywhere.herokuapp.com/"+
	            "https://api.darksky.net/forecast/9db690b67adc938cb967104b6bb2b664/"+
	            latitude+","+longitude+"?exclude=flags&lang=ko",
	            //","+date+
	            
	            dataType: "json",
	        
	            success: function (result) {
	            	
	                printWeatherInfo(result);
	                
	                
	                // 검색한 날짜에서 1년전 데이터로 다시 데이터받음 
	                var histime = new Date();
	                var hisDate = result.currently.time - 31536000; // 1년을 초로 나타내면..
	                
	                console.log(hisDate);
	                
	                $.ajax({
	        			headers: {
	                    "Content-Type": "application/json",
	                    //'Access-Control-Allow-Origin': '*',
	                	},
	                    type: "GET",
	                    url: "https://cors-anywhere.herokuapp.com/"+
	                    "https://api.darksky.net/forecast/9db690b67adc938cb967104b6bb2b664/"+
	                    latitude+","+longitude+","+hisDate+"?exclude=flags&lang=ko",
	                    dataType: "json",
	                
	                    success: function (histroy) {
	                    	
	                        printHistroyWeatherInfo(histroy);
						 }
	                	
	        		});
	                
	            }
	                
		});

	});
	
	//날씨 정보 출력함수 
	function printWeatherInfo(result){
		
		const city = result.timezone;	//도시 
		const time = result.currently.time // 현재시간
		
		//시간별 온도
		const currentlyTem = (((result.currently.temperature)-32)*(5/9)).toFixed(1); //현재온도 
		const temperature0 = (((result.hourly.data[0].temperature)-32)*(5/9)).toFixed(1); 
		const temperature3 = (((result.hourly.data[3].temperature)-32)*(5/9)).toFixed(1);
		const temperature6 = (((result.hourly.data[6].temperature)-32)*(5/9)).toFixed(1);
		const temperature9 = (((result.hourly.data[9].temperature)-32)*(5/9)).toFixed(1);
		const temperature12 = (((result.hourly.data[12].temperature)-32)*(5/9)).toFixed(1);
		const temperature15 = (((result.hourly.data[15].temperature)-32)*(5/9)).toFixed(1);
		const temperature18 = (((result.hourly.data[18].temperature)-32)*(5/9)).toFixed(1);
		const temperature21 = (((result.hourly.data[21].temperature)-32)*(5/9)).toFixed(1);
		
		//시간별 날씨상태아이콘
		const currentlyIcon = result.currently.icon;
		
		const icon3 = result.hourly.data[3].icon; 
		const icon6 = result.hourly.data[6].icon;
		const icon9 = result.hourly.data[9].icon;
		const icon12 = result.hourly.data[12].icon; 
		const icon15 = result.hourly.data[15].icon; 
		const icon18 = result.hourly.data[18].icon; 
		const icon21 = result.hourly.data[21].icon;
		const icon0 = result.hourly.data[0].icon;
		
		const dailyIcon = result.daily.data[0].icon;
		
		// 날씨설명
		const currentlySum = result.currently.summary;
		const dailySum = result.daily.data[0].summary;
		
		
		//최저,최고 온도
		const dailyTemMin = (((result.daily.data[0].temperatureMin)-32)*(5/9)).toFixed(1);
		const dailyTemMax = (((result.daily.data[0].temperatureMax)-32)*(5/9)).toFixed(1);
		
		//습도 
		const dailyHumidity = (result.daily.data[0].humidity * 100).toFixed(1);
		
		var sunriseTime = result.daily.data[0].sunriseTime; //일출
		var sunsetTime = result.daily.data[0].sunsetTime; //일몰
		
		//유닉스 일몰일출 변환
		var rTimeStamp = sunriseTime * 1000;
		var sTimeStamp = sunsetTime * 1000;
		var riseDate = new Date(rTimeStamp);
		var setDate = new Date(sTimeStamp);
		
		
		// 나라별 국제 기준시간별 offset
		const offset = result.offset; 
		
			//현재유닉스시간 -> 현재시간변환
			var localtime = new Date();
			var t = localtime.getTime()+ (localtime.getTimezoneOffset() * 60000) + (offset * 3600000);
			localtime.setTime(t);
			
			let year = localtime.getFullYear();
			let month = localtime.getMonth() + 1;
			let date = localtime.getDate();
			let hours = localtime.getHours();
			let minutes = localtime.getMinutes();
			//2자리 숫자로 변환
			month < 10 ? month = '0' + month : month;
			date < 10 ? date = '0' + date : date;
			hours < 10 ? hours = '0' + hours : hours;
			minutes < 10 ? minutes = '0' + minutes : minutes;
			

		
		const element = "- 도시 : "+ city + "<br>"
						+"- 현재시간 : "+year+"-"+month+"-"+date+"-"+hours+"-"+minutes+"<br>"
						+"- 현재 날씨 : "+currentlySum+"<br>"
						+"- 현재온도 : "+currentlyTem+"<br>"
						+"- 현재날씨아이콘 : "+currentlyIcon+"<br><br>"
						
						+"- daily 날씨 : "+dailySum+"<br>"
						+"- daily 아이콘 : "+dailyIcon+"<br><br>"
						
						+"- 시간대별 데이터 <br>"
						+"- 03시  		06시  		09시  		12시  		15시  		18시  		21시  		24시<br>"
						+"- "+icon3+"	"+icon6+" 	"+icon9+" "+icon12+"	"+icon15+" 	"+icon18+" "+icon21+"	"+icon0+"<br>"
						+"- "+temperature3+"° 		"+temperature6+"° 		"+temperature9+"° 		"+temperature12+"° 		"+temperature15+"° 		"+temperature18+"° 		"+temperature21+"° 		"+temperature0+"°<br>"
						+"- 최저온도 : "+dailyTemMin+"°<br>"
						+"- 최고온도 : "+dailyTemMax+"°<br>"
						+"- 습도 : "+dailyHumidity+"%<br>"
						
						+"- 일출 : "+riseDate.getHours()+":"+riseDate.getMinutes()+"<br>"
						+"- 일몰 : "+setDate.getHours()+":"+setDate.getMinutes()+"<br>"
						+"- offset : "+offset;
						
	
		const target = $("#show-weather p");
		target.html(element);
		
	}
	
	//1년전 날씨 정보 출력함수 
	function printHistroyWeatherInfo(histroy){
		
		const city = histroy.timezone;	//도시 
		const time = histroy.currently.time // 현재시간
		
		//시간별 온도
		const currentlyTem = (((histroy.currently.temperature)-32)*(5/9)).toFixed(1); //현재온도 
		const temperature0 = (((histroy.hourly.data[0].temperature)-32)*(5/9)).toFixed(1); 
		const temperature3 = (((histroy.hourly.data[3].temperature)-32)*(5/9)).toFixed(1);
		const temperature6 = (((histroy.hourly.data[6].temperature)-32)*(5/9)).toFixed(1);
		const temperature9 = (((histroy.hourly.data[9].temperature)-32)*(5/9)).toFixed(1);
		const temperature12 = (((histroy.hourly.data[12].temperature)-32)*(5/9)).toFixed(1);
		const temperature15 = (((histroy.hourly.data[15].temperature)-32)*(5/9)).toFixed(1);
		const temperature18 = (((histroy.hourly.data[18].temperature)-32)*(5/9)).toFixed(1);
		const temperature21 = (((histroy.hourly.data[21].temperature)-32)*(5/9)).toFixed(1);
		
		//시간별 날씨상태아이콘
		const currentlyIcon = histroy.currently.icon;
		
		const icon3 = histroy.hourly.data[3].icon; 
		const icon6 = histroy.hourly.data[6].icon;
		const icon9 = histroy.hourly.data[9].icon;
		const icon12 = histroy.hourly.data[12].icon; 
		const icon15 = histroy.hourly.data[15].icon; 
		const icon18 = histroy.hourly.data[18].icon; 
		const icon21 = histroy.hourly.data[21].icon;
		const icon0 = histroy.hourly.data[0].icon;
		
		const dailyIcon = histroy.daily.data[0].icon;
		
		// 날씨설명
		const currentlySum = histroy.currently.summary;
		const dailySum = histroy.daily.data[0].summary;
		
		
		//최저,최고 온도
		const dailyTemMin = (((histroy.daily.data[0].temperatureMin)-32)*(5/9)).toFixed(1);
		const dailyTemMax = (((histroy.daily.data[0].temperatureMax)-32)*(5/9)).toFixed(1);
		
		//습도 
		const dailyHumidity = (histroy.daily.data[0].humidity * 100).toFixed(1);
		
		var sunriseTime = histroy.daily.data[0].sunriseTime; //일출
		var sunsetTime = histroy.daily.data[0].sunsetTime; //일몰
		
		//유닉스 일몰일출 변환
		var rTimeStamp = sunriseTime * 1000;
		var sTimeStamp = sunsetTime * 1000;
		var riseDate = new Date(rTimeStamp);
		var setDate = new Date(sTimeStamp);
		
		
		// 나라별 국제 기준시간별 offset
		const offset = histroy.offset; 
		
			//현재유닉스시간 -> 현재시간변환
			var localtime = new Date();
			var t = localtime.getTime()+ (localtime.getTimezoneOffset() * 60000) + (offset * 3600000);
			localtime.setTime(t);
			
			let year = localtime.getFullYear();
			let month = localtime.getMonth() + 1;
			let date = localtime.getDate();
			let hours = localtime.getHours();
			let minutes = localtime.getMinutes();
			//2자리 숫자로 변환
			month < 10 ? month = '0' + month : month;
			date < 10 ? date = '0' + date : date;
			hours < 10 ? hours = '0' + hours : hours;
			minutes < 10 ? minutes = '0' + minutes : minutes;
			

		
		const hisElement = "- 도시 : "+ city + "<br>"
						+"- 현재시간 : "+year+"-"+month+"-"+date+"-"+hours+"-"+minutes+"<br>"
						+"- 현재 날씨 : "+currentlySum+"<br>"
						+"- 현재온도 : "+currentlyTem+"<br>"
						+"- 현재날씨아이콘 : "+currentlyIcon+"<br><br>"
						
						+"- daily 날씨 : "+dailySum+"<br>"
						+"- daily 아이콘 : "+dailyIcon+"<br><br>"
						
						+"- 시간대별 데이터 <br>"
						+"- 03시  		06시  		09시  		12시  		15시  		18시  		21시  		24시<br>"
						+"- "+icon3+"	"+icon6+" 	"+icon9+" "+icon12+"	"+icon15+" 	"+icon18+" "+icon21+"	"+icon0+"<br>"
						+"- "+temperature3+"° 		"+temperature6+"° 		"+temperature9+"° 		"+temperature12+"° 		"+temperature15+"° 		"+temperature18+"° 		"+temperature21+"° 		"+temperature0+"°<br>"
						+"- 최저온도 : "+dailyTemMin+"°<br>"
						+"- 최고온도 : "+dailyTemMax+"°<br>"
						+"- 습도 : "+dailyHumidity+"%<br>"
						
						+"- 일출 : "+riseDate.getHours()+":"+riseDate.getMinutes()+"<br>"
						+"- 일몰 : "+setDate.getHours()+":"+setDate.getMinutes()+"<br>"
						+"- offset : "+offset;
						
	
		const target = $("#show-historyWeather p");
		target.html(hisElement);
	}
});
</script>
</body>
</html>