<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div>

		<h2>User Form</h2>
	</div>
	</div>
	<div id="container">
		<div id="content">

			<!-- add html table here -->
			<table>
				<tr>
					<th>User Name</th>
					<th>Action</th>
				</tr>
				<!-- loop and print our members -->
				<c:forEach var="member" items="${members}">

					<!-- construct an "update" link with member id -->
					<c:url var="updatelink" value="updatecredentials">
						<c:param name="username" value="${member.credentials.username }"></c:param>
					</c:url>
					<!-- <img src="/"+ -->
					
					

					<!-- construct an "delete" link with member id -->
					
					<c:url var="deletelink" value="deletecredentials">
						<c:param name="username" value="${member.credentials.username }"></c:param>
					</c:url>
					<tr>
						<td>${ member.firstName}</td>
						<td>${ member.email}</td>
						<td><img src="<c:url value="/images/${member.firstName}.jpg"></c:url>" alt="image"  style = "width:60px"/></td>

						<td><a href="${updatelink}">Update</a> | <a
							href="${deletelink}"
							onclick="if(!(confirm('Are you sure you want to delete this user?'))) return false">Delete</a>
							<!-- javasprit code --></td>

					</tr>
				</c:forEach>
			</table>

			<!-- for add brand button -->
			<input value="Add Member" type="button" class="add-button" />
		</div>
	</div>
	<a href = "/logout_farmer">Sign Out</a>

	
	

		
</body>
</html>