<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				url : 'suppliergson'
			}).success(function(data, status, headers, config) {
				$scope.suppliers = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script> 


	
	
	
</head>




<body>
	<c:url var="addAction" value="addSupplier"></c:url>
	<!-- //jstl tag available in core tag library// -->

	<form:form action="${addAction}" modelAttribute="supplier" id="btn-add">
		<!-- wen ever we click botton it should perform some Action -->
		<h3>
			<c:if test="$(supplier.id==0}">
		       Add New Supplier
	            </c:if>
			<c:if test="${!empty supplier.id}">
		      Update Supplier for Id: <c:out value="${supplier.id}" />
				<form:hidden path="id" />
			</c:if>
		</h3>
		<table>

			<tr>
				<c:if test="${supplier.id!=0}">
					<td>Id:</td>
					<td><form:input path="id" /></td>
				</c:if>
			<tr>
				<td>Name:</td>
				<td><form:input path="name" /></td>
			<tr>
				<td>Address:</td>
				<td><form:input path="address" /></td>
			<tr>
				<td colspan="2"><c:if test="${supplier.id==0}">
						<input type="submit" value="Add" id="btn-add">
					</c:if> <c:if test="${supplier.id!=0}">
						<input type="submit" value="Update" id="btn-update">
					</c:if></td>
			<tr>
				<td colspan="2" class="success-msg"><c:out value="${msg}" /></td>
		
		</tr>
		</table>
		
		<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()"
				style="overflow: auto; height: 400px; width: 70%">
				
				<form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Supplier"
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

					<td>ID</td>
					<td>Name</td>
					<td>Address</td>


					<th class="text-center" colspan="2">Action</th>
				</tr>
				
			</thead>
			
			
			
			<%-- <c:forEach var="obj" items="${allSupplier}"> --%>
				<tr>
				 <tr
		      data-ng-repeat="supplier in suppliers | orderBy:sortType:sortReverse | filter:search">
		     
					<td>{{supplier.id}} </td>
					<td>{{supplier.name}}</td>
					<td>{{supplier.address}}</td>


					<td><a href="deleteSupplierById/{{supplier.id}}">Delete </a> / <a
						href="SupplierById/{{supplier.id}}">Edit</a></td>
				</tr>
			<%-- </c:forEach> --%>
		</table>
		</div>
		</div>
	</form:form>

</body>
</html>