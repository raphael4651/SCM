<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>구글차트 With mysql</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	var queryObject = "";
	var queryObjectLen = "";

	/* 비동기 통신 방식으로 JSON 데이터를 출력한다. */
	$.ajax({
		type : 'POST', /* 전송방식 */
		url : 'getData.jsp', /* 데이터를 가져올 위치 */
		dataType : 'json', /* 가져올 데이터 형태 */
		//비동기 통신 성공시
		success : function(data) {
			queryObject = eval('(' + JSON.stringify(data) + ')');
			queryObjectLen = queryObject.empdetails.length;
		},
		//실패시
		error : function(xhr, type) {
			alert('server error occoured')
		}
	});

	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});

	google.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable();

		data.addColumn('string', 'name');
		data.addColumn('number', 'saleqty');

		/* json 데이터를 가져온다. */
		for (var i=0;i<queryObjectLen;i++) {
			
			//사원명
			var name = queryObject.empdetails[i].name;
			//판매수량
			var saleqty = queryObject.empdetails[i].saleqty;
			
			//JSON 형태의 데이터를 구글 차트에 추가
			data.addRows([ [ name,saleqty] ]);
		}

		var options = {
			title : '사원별 판매 현황',
		};

		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));

		chart.draw(data, options);
		
		
		var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));

		chart.draw(data, options);
	}
</script>
</head>
<body>
	<div id="chart_div"></div>
	<div id="chart_div2"></div>
</body>
</html>





