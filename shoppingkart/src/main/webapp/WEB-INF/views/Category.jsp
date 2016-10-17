.<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Admin</title>
<script
	src="${pageContext.request.contextPath}/app-resources/js/lib/jquery-2.2.3.min.js"></script>

<script
	src="${pageContext.request.contextPath}/app-resources/js/myapp.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/app-resources/css/style.css" />
	
	<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.17/angular.min.js"></script>

 <script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search = '';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'categorygson'
			}).success(function(data, status, headers, config) {
				$scope.categories = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script> 




</head>
<body>
	<c:url var="addAction" value="addCategory"></c:url>
	<!-- //jstl tag available in core tag library// -->

	<form:form action="${addAction}" modelAttribute="category" id="btn-add">
		<!-- wen ever we click botton it should perform some Action -->
		<h3>
			<c:if test="${category.id==0}"></c:if>
			<c:if test="${!empty category.id}">
				<c:out value="${category.id}" />
				<form:hidden path="id" />
			</c:if>
		</h3>
		<table>

			<tr>
				<c:if test="${category.id!=0}">
			</tr>
			<td>Id:</td>
			<td><form:input path="id" /></td>
			</c:if>

			<!--  <tr>
	 <div class="container"> 
	 <div class="form-group"> 
	<label class="control-label col-sm-2" for="Category">CategoryName:</label>
	<input type="text" class="form-control" style=width:20% name="CategoryName" placeholder="name"> 
	</div> 
	
	</tr> -->

			<tr>
				<td>Name:</td>
				<td><form:input path="name" /></td>
			<tr>

				<!--  <div class="container"> 
	 <div class="form-group"> 
	<label class="control-label col-sm-2" for="Category">CategoryDescription:</label>
	<input type="text" class="form-control" style=width:20% name="CategoryDescription" placeholder="Description"> 
	</div>
	
	</tr> -->






				<td>Description:</td>
				<td><form:input path="description" /></td>
			<tr>
				<td colspan="2"><c:if test="${category.id==0}">

						<div class="form-group">
							<div class="col-sm-offset-80 col-sm-200">
								<button type="submit" class="btn btn-default">Add</button>
							</div>
						</div>





						<!-- <input type="submit" value="Add" id="btn-add"> -->
					</c:if> <c:if test="${category.id!=0}">
						<input type="submit" value="Update" id="btn-update">
					</c:if></td>
			<tr>
				<td colspan="2" class="success-msg"><c:out value="${msg}" /></td>
		</table>
<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 70%">
				
				<form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Category"
						style="width: 20%">

				</form>
			
				<br>
    
  <div align="center">
	  <table> 
	  <div class="container"></div>
			<div class="row col-md-6 col-md-offset-2 custyle"></div>
			<table class="table table-striped custab" style="margin-left: -115px">  
			<thead>

					<tr>
						<th>Id</th>
						<th>name</th>
						<th>description</th>
					</tr>
				</thead>
	      	
    	     <%--  <c:forEach var="obj" items="${allInfo}"> --%>
		      <tr
		      data-ng-repeat="category in categories | orderBy:sortType:sortReverse | filter:search">
		                 <td> {{category.id}} </td>
		                 <td> {{category.name}} </td>
				 <td> {{category.description}} </td>
				 
				<td> <a href="deleteCategoryById/{{category.id}}">Delete </a> |
				     <a href="CategoryById/{{category.id}}">Edit</a> 
				 </td>
				 </tr>
		     
	</tr>
				<%-- </c:forEach> --%>
			</table>
			</form:form>
</body>
</html>





