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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<h1><a href="/user/${loginUser.id}/profile"><c:out value="${user.name}"/></a></h1>
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
				<div>
					<h1><a href="user/${user.id}/profile">${user.name}</a></h1>
				</div>
				<div>
					<c:forEach items="${user.posts}" var="post">
						<div class="postList">
							<div class="postHeader">
								<h3><c:out value="${post.user.name}"/></h3>
							</div>
							<div class="postContext">
								<p><c:out value="${post.context}"/></p>
							</div>
							<div>
								<p>up REPLY</p>
							</div>
							<div>
								<p>${posts.comments.size()} comments</p>
							</div>
							<div>
								<c:forEach items="${post.comments}" var="comment">
									<p><a href="/user/${comment.user.id}/profile">${comment.user.name }</a> : ${comment.context} </p>
									<p>up down <a href="user/${comment.user.id}/reply">REPLY</a></p>
								</c:forEach>
							</div>
							<div>
								<form:form method="post" action="/comment" modelAttribute="comment">
									<form:label path="user">user:</form:label>
									<form:input type="text" path="user" value="${loginUser.id}" />
									
									<form:label path="post">post:</form:label>
									<form:input type="text" path="post" value="${post.id}" />
									
									<form:label path="context">context:</form:label>
									<form:input type="text" path="context" />
									
									<input type="submit" value="Comment">
								</form:form>
							</div>
						</div>
					</c:forEach>
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