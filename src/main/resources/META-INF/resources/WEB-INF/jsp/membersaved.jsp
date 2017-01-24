<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function ajaxCall() {
		//var contextRoot = "/" + window.location.pathname.split('/')[1];

		var password = $('#newPassword').val();
		console.log(password);
		$.ajax({
			url : '/getCredentials/',
			type : 'GET',
			dataType : "json",
			data : 'password=' + password,
			success : function(credentials) {
				alert("hurray");
				displayLoan(credentials);

			},
			error : function(jqXHR, textStatus, exception) {
				//alert("Error Caught");
				alert('a');
			}
		});

	}

	function displayLoan(credentials) {

		$('#result').html("");
		$("#result")
				.append(
						'<H4 align="right"> <a href="#" onclick="toggle_visibility(\'result\');"><b>X</b> </a> </H4>');
		$("#result").append('<H3 align="center"> Your  Credentials  <H3>');
		$("#result").append(
				'<H4 align="center">' + credentials.username + '<H4>');
		$("#result").append(
				'<H4 align="center">' + credentials.password + '<H4>');

		$("#result").attr("style", "display: list-item")
	}

	toggle_visibility = function(id) {
		var e = document.getElementById(id);
		if (e.style.display == 'block') {
			e.style.display = 'none';
		} else {
			e.style.display = 'block';
		}
	}
</script>
</head>
<body>

	<div>

		<h2>User Form</h2>
	</div>

	<div id="container">
		<div id="content">

			<!-- add html table here -->
			<table>
				<tr>
					<th>User Name</th>
					<th>Password</th>
					<th>Date Of Creation</th>
				</tr>
				<!-- loop and print our members -->
				<tr>
					<td>${ member.credentials.username}</td>
					<td>${ member.credentials.password}</td>
					<td>${member.dateOfMembership}</td>
					<td><img src="/images/${member.firstName}.jpg"
						width="40px"
						height="40px/></td>
						

						

					</tr>

					<!-- construct an "
						update" link with memberid --> <c:url var="updatelink"
							value="updates">
							<c:param name="id" value="${member.id}"></c:param>
						</c:url> <!-- construct an "delete" link with member id --> <c:url
							var="deletelink" value="delete">
							<c:param name="id" value="${member.id}"></c:param>
						</c:url>
				<tr>
					<td><a href="${updatelink}">Update</a> | <a
						href="${deletelink}"
						onclick="if(!(confirm('Are you sure you want to delete this user?'))) return false">Delete</a>
						<!-- javasprit code --></td>
				</tr>

			</table>
			<p>
				<!-- Change UserName <input type="text" id="newUsername"
					name="username" /> -->
				Change Password <input type="text" id="newPassword" name="password" />
				<button onclick="ajaxCall(); return false;">Submit</button>
			</p>
			<div id="result" style="display: none"></div>

			<a href="/">Go to Login</a>
		</div>
	</div>
</body>
</html>