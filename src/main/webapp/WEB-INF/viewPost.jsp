<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css">
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %> 
<script type="text/javascript" src="js/LTCController.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>David Yoon</title>
</head>
<body>
	<div >
		<div class="row">
			<div class="col-sm-3">
				<h1><a href="/users/${loginUser.id}/edit"><c:out value="${loginUser.name}"/></a></h1>
				<br>
				<br>
				<a href="/logout">Logout</a>
				<br>
				<br>
				<a href="/main">home</a>
			</div>
			<div class="col-sm-6">
				<h1>main feed</h1>
				<div >
					<div class="postHeader">
						<c:out value="${post.title}"/>
					</div>
					<div class="postContext">
						<c:out value="${post.context}"/>
					</div>
					<div class="comments">
						<p>comments</p>
					</div>
					<div>
					
					</div>
					<div>
						<form:form method="post" action="/post" modelAttribute="post">
							<form:label path="user">user:</form:label>
							<form:input type="text" path="user" value="${loginUser.id}" />
							
							<form:label path="title">title:</form:label>
							<form:input type="text" path="title" />
							
							<form:label path="context">context:</form:label>
							<form:input type="text" path="context" />
							
							<input type="submit" value="Post">
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div>
					<h1>sidebar</h1>
				</div>
			</div>
		</div>
	</div>
</body>
</html>