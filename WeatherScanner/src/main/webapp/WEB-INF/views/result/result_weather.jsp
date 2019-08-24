<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<c:if test="${empty trig }">
	 	<jsp:include page="../include/header.jsp"></jsp:include>
	 </c:if>
	 
	 <c:if test="${trig}">
	 	<jsp:include page="../include/header_ad.jsp"/>
	 </c:if>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>


<!--  아이콘 파일 경로 -->
<script src="<c:url value='/resources/icon/skycons.js'/>"></script>



<meta charset="UTF-8">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

</head>
<style>
@media (max-width:400px){
#city-info-page p {
	
		font-size: 18px;
	}
#show-weather p {
	font-size: 18px;
}
	
}
</style>
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />

<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">


				<div class="offset-md-4 col-md-8">

					<form action="<c:url value='/api'/>" method="get" style="width:75%">
                  <input type="date" id="dateSelect" name="date" style="margin-right:5%;"/> 
                  <select name="city" style="margin-top:5px;" id="citySelect">
                  <option selected disabled hidden >나라&도시</option>
                     <optgroup label="아시아">
                        <option value="방콕">방콕</option>
                        <option value="싱가포르">싱가포르</option>
                     </optgroup>
							
						</select> <input id="searchBtn" type="submit" value="search"  style="margin-left: 100px;" />
						
					</form>
				</div><br><br>
				<div class="offset-md-1 col-md-11">
					<hr>
				</div><br><br>

				<div id="page-wrapper">

					
						<br>
						<h1>&emsp;${city}의 정보</h1><br>
						<div id="city-info-page">
							<p>${info}</p><hr>
						</div>	
						<h3>&emsp;${date} 날씨정보</h3>
						<div id="show-weather">
							<p></p>
						</div>


						<script>
							const latitude = "${lat}";
							const longitude = "${lon}";
							const time = "${time}";
							const date = "${date}";
							
							$.ajax({
								headers : {
										"Content-Type" : "application/json",
										//'Access-Control-Allow-Origin': '*',
										},
										type : "GET",
										url : "https://cors-anywhere.herokuapp.com/"
												+ "https://api.darksky.net/forecast/9db690b67adc938cb967104b6bb2b664/"
												+ latitude
												+ ","
												+ longitude
												+ ","
												+ time
												+ "?exclude=flags&lang=ko",

										dataType : "json",

										success : function(result) {

											printWeatherInfo(result,date);

								}
							});

							//날씨 정보 출력함수 
							function printWeatherInfo(result,date) {

								const city = result.timezone; //도시 

								//시간별 온도
								const temperature0 = (((result.hourly.data[0].temperature) - 32) * (5 / 9))
										.toFixed(1);
								const temperature3 = (((result.hourly.data[3].temperature) - 32) * (5 / 9))
										.toFixed(1);
								const temperature6 = (((result.hourly.data[6].temperature) - 32) * (5 / 9))
										.toFixed(1);
								const temperature9 = (((result.hourly.data[9].temperature) - 32) * (5 / 9))
										.toFixed(1);
								const temperature12 = (((result.hourly.data[12].temperature) - 32) * (5 / 9))
										.toFixed(1);
								const temperature15 = (((result.hourly.data[15].temperature) - 32) * (5 / 9))
										.toFixed(1);
								const temperature18 = (((result.hourly.data[18].temperature) - 32) * (5 / 9))
										.toFixed(1);
								const temperature21 = (((result.hourly.data[21].temperature) - 32) * (5 / 9))
										.toFixed(1);

								//시간별 날씨상태아이콘
								const dailyIcon = result.daily.data[0].icon;
								const icon0 = result.hourly.data[0].icon;
								const icon2 = result.hourly.data[2].icon;
								const icon4 = result.hourly.data[4].icon;
								const icon6 = result.hourly.data[6].icon;
								const icon8 = result.hourly.data[8].icon;
								const icon10 = result.hourly.data[10].icon;
								const icon12 = result.hourly.data[12].icon;
								const icon14 = result.hourly.data[14].icon;
								const icon16 = result.hourly.data[16].icon;
								const icon18 = result.hourly.data[18].icon;
								const icon20 = result.hourly.data[20].icon;
								const icon22 = result.hourly.data[22].icon;
								

								// 날씨설명
								const dailySum = result.daily.data[0].summary;

								//최저,최고 온도
								const dailyTemMin = (((result.daily.data[0].temperatureMin) - 32) * (5 / 9))
										.toFixed(1);
								const dailyTemMax = (((result.daily.data[0].temperatureMax) - 32) * (5 / 9))
										.toFixed(1);

								//습도 
								const dailyHumidity = (result.daily.data[0].humidity * 100)
										.toFixed(1);
								
								// 나라별 국제 기준시간별 offset
								const offset = result.offset;
								
								//일출,일몰
								var sunriseTime = result.daily.data[0].sunriseTime;
								var sunsetTime = result.daily.data[0].sunsetTime;
								console.log(sunriseTime);
								console.log(sunsetTime);
								//유닉스 일몰일출 변환
								var riseT = new Date(sunriseTime*1000-(offset*(-60000)));
								var setT = new Date(sunsetTime*1000-(offset*(-60000)));
								

								console.log(riseT);
								console.log(setT);

								//현재유닉스시간 -> 현재시간변환
								var localtime = new Date();
								var t = localtime.getTime()
										+ (localtime.getTimezoneOffset() * 60000)
										+ (offset * 3600000);
								localtime.setTime(t);

								let year = localtime.getFullYear();
								let month = localtime.getMonth() + 1;
								let day = localtime.getDate();
								let hours = localtime.getHours();
								let minutes = localtime.getMinutes();
								//2자리 숫자로 변환
								month < 10 ? month = '0' + month : month;
								day < 10 ? day = '0' + day : day;
								hours < 10 ? hours = '0' + hours : hours;
								minutes < 10 ? minutes = '0' + minutes
										: minutes;
								
								
								
								
								const element = "&emsp;- 도시 : "+city+"<br>"
										+"&emsp;- daily 날씨 : "+ dailySum+ "<br>"
										+ "&emsp;- daily 아이콘 : <canvas class='"+dailyIcon+"'width ='"+60+"'height ='"+60+"'></canvas><br>"										
										+ "&emsp;- 최고온도 : "+ dailyTemMax+ "°<br>"
										+ "&emsp;- 최저온도 : "+ dailyTemMin+ "°<br><br>"
										+"<h4>Dry season & Rainy season</h4><br>"
										+"<div id='timeline'></div><br>"
										+"<h4>Daily Data Chart</h4>"
										+"<div id='lineChartArea'></div>"
										+"&ensp;<canvas class='"+icon0+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;"
										+"<canvas class='"+icon2+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;"
										+"<canvas class='"+icon4+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon6+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon8+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon10+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon12+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon14+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon16+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon18+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon20+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&emsp;&ensp;"
										+"<canvas class='"+icon22+"'width ='"+60+"'height ='"+60+"'></canvas>&emsp;&emsp;&ensp;<br>"
										+ "- 습도 : " + dailyHumidity + "%<br>"
										+ "- 일출 : " + riseT.getHours() + ":"+ riseT.getMinutes() + "<br>"
										+ "- 일몰 : " + setT.getHours() + ":"+ setT.getMinutes() + "<br>"
										
										+ "- 현재시간기준 로컬시간 : " + year + "-"
										+ month + "-" + day + "-" + hours
										+ "시-" + minutes + "분<br>"
										+ "- offset : " + offset;

								const target = $("#show-weather p");
								target.html(element);

								//아이콘 셋팅         
								var icons = new Skycons(), i, list = [
										dailyIcon, icon0, icon2, icon4, icon6,
										icon8, icon10, icon12, icon14, icon16, icon18, 
										icon20, icon22];

								for (i = list.length; i--;) {
									var weatherType = list[i], elements = document
											.getElementsByClassName(weatherType);
									for (e = elements.length; e--;) {
										icons.set(elements[e], weatherType);
									}
								}

								icons.play();
								
							///////////////////////////////// 건기우기 차트 //////////////////////////////
								google.charts.load('current', {'packages':['timeline']});
							      google.charts.setOnLoadCallback(DRdrawChart);
							      
							      function DRdrawChart() {
							        var container = document.getElementById('timeline');
							        var DRchart = new google.visualization.Timeline(container);
							        var DRdataTable = new google.visualization.DataTable();

							        DRdataTable.addColumn({ type: 'string', id: 'President' });
							        DRdataTable.addColumn({ type: 'date', id: 'Start' });
							        DRdataTable.addColumn({ type: 'date', id: 'End' });
							        
							        
							        DRdataTable.addRows([
							           ['우기(비)', new Date("${dr.cityRainStart}"), new Date("${dr.cityRainEnd}")],
							           ['건기(dry)', new Date("${dr.cityDryStart}"), new Date("${dr.cityDryEnd}")],
							           ['Recommend', new Date("${dr.rcmdMonStart}"), new Date("${dr.rcmdMonEnd}")]
							          ]);
							
							         
							        DRchart.draw(DRdataTable);
							      }
							
								///////////////////////////////// 시간별 온도 차트 //////////////////////////////
								
      							google.charts.load('current', {'packages':['line']});
   								google.charts.setOnLoadCallback(drawChart);
   								
   								
   								
   								
   								
							  	 function drawChart(){
							  		 
							          var data = new google.visualization.DataTable();
							          
							          //그래프에 표시할 컬럼 추가
							          data.addColumn('number' , '시간');
							          data.addColumn('number'   , '온도');							          

							          //데이터 셋팅
							          var dataRow = new Array();
								  		
								  		for(var i = 0; i <= 23; i++){ 
								            var tem   = (((result.hourly.data[i].temperature)-32)*(5/9)).toFixed(1);
								          	var temperature = tem*1; 
								          	 
								            dataRow[i] = [i, temperature];
								           			        
								            data.addRows(dataRow);
							          	}
							 
							          var options = {
							        		  chartType   : 'LineChart',
							        	      chart: {
							        	          title: 'Hourly data of Daily',
							        	          subtitle: 'temperature'
							        	       },
							        	        width: '80%',
							        	        height: 500,
							        	        colors: 'blue',
							        	        axes: {
							        	            x: {
							        	              0: {side: 'bottom'}
							        	            }
							        	        },
							        	        isStacked   : 'percent',
							        	        focusTarget : 'category',
							        	        legend      : { position: "top", textStyle: {fontSize: 13}},
							        	       animation        : {startup: true,duration: 1000,easing: 'linear' }
							        	      };
							        	      var chart = new google.charts.Line(document.getElementById('lineChartArea'));
							        	      chart.draw(data, google.charts.Line.convertOptions(options));
							  	 }			
							}
							
							$("#searchBtn").click(function(){
						    	  var target = document.getElementById("citySelect").value;
						    		if( target === "나라&도시" || $("#dateSelect").val() === "" ){
						    			alert("날짜와 도시를 선택하세요!");
						    			return false;
						    		}
						    		
						    	});
							
						</script><br><br>

						
				</div>
			</div>
		</div>
		
	</div>
		
	
		<jsp:include page="../include/footer.jsp" />
		
</body>
</html>