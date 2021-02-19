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
				<h1>Welcome, <a href="/users/${loginUser.id}/edit"><c:out value="${loginUser.name}"/></a></h1>
				<br>
				<br>
				<a href="/logout">Logout</a>
				<br>
				<br>
				<br>
				<a href="/users/${loginUser.id}/post">post</a>
				</div>
			<div class="col-sm-6"><h1>main feed</h1>
				<div>
					<table class="table table-bordered table-striped">
						<thead >
							<th >id</th>
							<th >user name</th>
							<th >delete user</th>
							<th >user post title</th>
						</thead>
						
						<tbody>
							<c:forEach items="${users}" var="user">
							<tr>
								<td><c:out value="${user.id}"/></td>
								<td><a href="/users/${user.id }/edit"><c:out value="${user.name}"/></a></td>
								<td>
									<form method="post" action="/users/${user.id}/delete">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" value="Delete Acc">
									</form>
								</td>
								<td><a href="/users/${user.id }/posts"><c:out value="${user.posts.size()}"/></a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<table class="table table-bordered table-striped">
						<thead >
							<th >id</th>
							<th >post title</th>
							<th >post user name</th>
							<th >delete post</th>
						</thead>
						
						<tbody>
							<c:forEach items="${posts}" var="post">
							<tr>
								<td><c:out value="${post.id}"/></td>
								<td><a href="/posts/${post.id}/post"><c:out value="${post.title}"/></a></td>
								<td><a href="/posts/${post.id }/edit"><c:out value="${post.user.name}"/></a></td>
								<td>
									<form method="post" action="/posts/${post.id}/delete">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" value="Delete Post">
									</form>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-sm-3">
				<div>
					<h1>sidebar</h1>
				</div>
				<div>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3306.435828042668!2d-117.9185818842864!3d34.032689780611214!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c329e4ae6ad6dd%3A0x720f99b6e03e2722!2s2100%20Lark%20Ellen%20Ave%2C%20West%20Covina%2C%20CA%2091792!5e0!3m2!1sko!2sus!4v1613252005181!5m2!1sko!2sus" width="450" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
				</div>
			</div>
		</div>
	</div>
</body>
</html>