<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>
<title>Insert title here</title>
</head>
<style>
	.row{
		padding: 15px;
	}
</style>
<body>

<form action="./submitDetails" method="post">
	<div class="container">
	<div class="col-md-6">
		<div class="row">
			<div class="col-md-4">Enter Name</div>
			<div class="col-md-4">
				<input type="hidden" name="pid" class="form-control" value="${idValue}"/>
				<input type="text" name="name" class="form-control" placeholder="Enter Username here" value="${nameValue}" />
			</div>
			<div class="col-md-4">${nameError}</div>
		</div>
		
		<div class="row">
			<div class="col-md-4">Enter Age</div>
			<div class="col-md-4">
				<input type="text" name="age" class="form-control" value="${ageValue}">
			</div>
			<div class="col-md-4">${ageError}</div>
		</div>
		
		<div class="row">
			<div class="col-md-4">Enter Phone</div>
			<div class="col-md-4">
				<input type="text" name="phone" class="form-control" value="${phoneValue}">
			</div>
			<div class="col-md-4">${phoneError}</div>
		</div>
		
		<div class="row">
			<div class="col-md-5">
				<input type="submit" value="SUBMIT" class="btn btn-success"/>
			</div>
			<div class="col-md-3">
				<a href="./" class="btn btn-info">RESET</a>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="text-success">
					<strong>${message}</strong>
				</div>
				<div class="text-danger">
					<strong>${error}</strong>
				</div>
			</div>
		</div>
		
		
	</div>
	
	
	<div class="col-md-6">
		<table class="table table-striped">
			<tr style="font-size: 15px">
				<th>Action</th>
				<th>ID</th>
				<th>NAME</th>
				<th>AGE</th>
				<th>PHONE</th>
			</tr>
		
		</table>
	</div>
</div>
</form>

</body>
</html>