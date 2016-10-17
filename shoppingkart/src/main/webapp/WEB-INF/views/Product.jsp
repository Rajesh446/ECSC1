

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
				url : 'productgson'
			}).success(function(data, status, headers, config) {
				$scope.products = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
	
</script>


</head>
<style>
.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin: 5% 0;
	box-shadow: 3px 3px 2px #ccc;
	transition: 2s;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 2s;
}

div.TableMargin {
	margin-left: 380px;
	border-color: gray;
	border-width: 2px;
	border-left-style: solid;
	margin-right: 450px;
	border-collapse: separate;
	padding-left: 15px;
}

div.FontManip {
	font-weight: bold;
	color: red;
}

div.Table {
	margin-left: 0px;
	margin-top: 40px;
}

div.ProPrice {
	margin-left: -40px;
}

body {
	backgroundcolor: rgba(192, 192, 192, 0.3);
}
</style>

<body>

	<c:url var="addAction" value="addProduct"></c:url>
	<!-- //jstl tag available in core tag library// -->

	<form:form action="${addAction}" modelAttribute="product" id="btn-add"
		enctype="multipart/form-data">
		<!-- wen ever we click botton it should perform some Action -->
		<div class="TableMargin">
			<%--  <h3>
                    <c:if test="$(product.id==0}">
		       
	            </c:if>
	            <c:if test="${!empty product.id}">
		       <c:out value="${product.id}"/>
		      <form:hidden path="id"/>
	            </c:if>
         </h3> --%>
			<table>

				<tr>
					<c:if test="${product.id!=0}">
						<td>Id:</td>
						<td><form:input path="id" /></td>
					</c:if>

					<!--   <tr>
	 <div class="container"> 
	 <div class="form-group"> 
	<label class="control-label col-sm-2" for="Product">Name:</label>
	<input type="text" class="form-group" style=width:20% name="Name" path="name" placeholder="Enter Product name"> 
	</div> 
	 
	</tr> -->
				<tr>
					<td><allign =centre> Name:</td>
					<td><form:input path="name" /></td>
				<tr>
					<td>Description:</td>
					<td><form:input path="description" /></td>
				<tr>
					<td>Price:</td>
					<td><form:input path="price" /></td>
				<tr>
					<td><span style="margin-left: 00px; font-size: 90%;"><label>Category:</label></span></td>
	<td><span style="margin-left: 00px;"><form:select path="category_name" required="true"></span> <c:forEach
							items="${allCategory}" var="categorylist">
							<form:option class="input1" value="${categorylist.id}">${categorylist.name}</form:option>
						</c:forEach> </form:select></td>
				</tr>

				<br>
				<tr>
					<td><br>
					<span style="margin-left: 00px; font-size: 90%;"><label><br>Supplier:</label></span></td>
					<td><br>
					<br>
					<span style="margin-left: 00px;"><form:select
								path="supplier_name" required="true"></span> <c:forEach
							items="${allSupplier}" var="supplierlist">
							<form:option class="input1" value="${supplierlist.id}">${supplierlist.name}</form:option>
						</c:forEach> </form:select></td>
				</tr>


				<div class="col-xs-8 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<label class="col-md-4 form-group" for="image">Image:</label>
					<div class="col-md-2">
						<form:input type="file"
							class=" btn btn-default btn-block form-control" path="image"
							required="true" />
					</div>
				</div>


				<tr>
					<td colspan="2"><c:if test="${product.id==0}">
							<br>
							<span style="margin-left: 175px"> <input type="submit"
								class="btn btn-success" value="Add" id="btn-add"
								enctype="multipart/form-data" method="post"></span>
						</c:if> <c:if test="${product.id!=0}">
							<input type="submit" value="Update" id="btn-update">
						</c:if></td>
				<tr>
					<td colspan="2" class="success-msg"><c:out value="${msg}" /></td>
			</table>
		</div>


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
				



		
				<table class="table table-striped custab" style="margin-left: 40px">

					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Description</th>
							<th>Price</th>
							<th>Category_id</th>
							<th>Supplier_id</th>

							<th class="text-center" colspan="2">Action</th>
						</tr>
					</thead>

					<%-- <c:forEach var="obj" items="${allProduct}"> --%>
					
					 <tr data-ng-repeat="product in products | orderBy:sortType:sortReverse | filter:search">
					
							<td>{{product.id}}</td>
							<td>{{product.name}}</td>
							<td>{{product.description}}</td>
							<td>{{product.price}}</td>
							<td>{{product.category_name}}</td>
							<td>{{product.supplier_name}}</td>


							<td><div class="thumbnail">
									<img height="100px" width="100px" alt="{{product.id }}"
										src="<c:url value="/resources/images/product/{{product.id}}.jpg"></c:url>">
								
							<td><a class='btn btn-danger btn-xs'
								href="deleteProductById/{{product.id}}"><span
									class="glyphicon glyphicon-remove"></span> </a> / <a
								class='btn btn-info btn-xs' href="productById/{{product.id}}"><span
									class="glyphicon glyphicon-edit"></span></a></td>
						</tr>
					<%-- </c:forEach> --%>
					


				</table>
				</div>
				
				</div>
			</div>
		
	</form:form>

</body>
</html>
