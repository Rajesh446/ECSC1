<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body style="padding-top:">
	<div class="container">
	
	
	<c:choose>
				<c:when test="${!empty SuccessMessage}">
					<td colspan="2">
						<div class="alert alert-success fade in">
							<a href="login" class="close" data-dismiss="alert" aria-label="close">&times;</a>${SuccessMessage}
						</div>
					</td>
				</c:when>
			</c:choose>
	
	
	
	<section id="content">
			<c:url var="addAction" value="adduser"></c:url>
			<form:form action="${addAction}" commandName="user"
				method="post">
				<h4>Registration</h4>
				<%-- <div>
					<form:input path="userid" type="text" placeholder="USERID"
						 required="true" id="userid" name="userid" />
				</div>
 --%>				<div>
					<form:input path="username" type="text" placeholder="Username"
					pattern=".{5,10}" required="true" id="username" name="username"
					title="minimum length for username is 5" />
				</div>
				<div>
					<form:input path="password" type="password" placeholder="Password" pattern=".{3,8}"
						required="true" id="password" name="password" title="minimum length for passsword is 3" />
				</div>
				<div>
					<form:input path="confirmpassword" type="password" placeholder="Confirm Password" pattern=".{3,8}"
						required="true" id="confirmpassword" name="confirmpassword" title="minimum length for passsword is 3" />
				</div>
				<div>
					<form:input path="email" type="email" placeholder="Email"
						required="true" id="username" name="username" />
				</div>
				<div>
					<form:input path="phone" type="text" placeholder="Phone"
						pattern="^[789]\d{9}$" required="true" id="phone"
						name="phone" title="Enter valid mobile number" />
				</div>
				<div>
					<input type="submit" value="Register" /><a href="LOGIN">Sign In</a>
				</div>

			</form:form>
			
		</section>
		
	</div>
	
</body>
</html>