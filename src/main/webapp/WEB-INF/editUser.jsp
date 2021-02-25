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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<title>David Yoon</title>
</head>
<body>
	
	<div class="main">
		<div class="row">
			<div class="col-sm-3">
				<h1><a href="/user/${loginUser.id}/profile"><c:out value="${loginUser.name}"/></a></h1>
				<br>
				<br>
				<a href="/users/${loginUser.id}/edit">edit</a>
				<br>
				<br>
				<a href="/logout">Logout</a>
				<br>
				<br>
				<a href="/main">home</a>
			</div>
			<div class="col-sm-6">
				<div><h1>Edit Info</h1></div>
				<div>
					<form:form method="post" action="/users/${user.id}/update" modelAttribute="user">
						<input type="hidden" name="_method" value="put">
						<form:label path="name">name:</form:label>
						<form:input type="text" path="name" />		
						<input type="submit" value="Confirm">
					</form:form>
				</div>
				<div>
					<form method="post" action="/users/${user.id}/delete">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" value="Delete Acc">
					</form>
				</div>
			</div>
			<div class="col-sm-3">
				<h1>Sidebar</h1>
			</div>
		</div>
</div>
</body>
</html>