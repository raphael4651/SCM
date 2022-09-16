<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav class = "navbar navbar-expand navbar-dark bg-dark">
		<div class = "container">
			<div class = "navbar-header">
				<a class = "navbar-brand" href="./welcom.jsp">Home</a>			
			</div>
		</div>
	</nav>
	
	<%!
		String greeting = "Welcome to Wep shopping Mall";
		String tagline = "Welcome to Web Market!";
	%>
	<div class = "jumbotron">
		<div class = "container">
			<div class = "text-center">
				<h1 class = "display-3">
					<%= greeting %>
				</h1>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<div class = "text-center">
			<h3>
				<%= tagline %>
			</h3>
		</div>
	</div>
	
	<footer class = "container">
		<p>&copy; WebMarket</p>
	</footer>
</body>
</html>