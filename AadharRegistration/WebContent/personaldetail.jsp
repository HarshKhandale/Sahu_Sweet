<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"/>

<%
	if(session.getAttribute("LoginUser")==null)
	{
		response.sendRedirect("login.jsp");
	}
%>



<body>
<jsp:include page="header.jsp"/>
	<div class="row">
		<div class="col-md-6"><h4>Personal Details</h4></div>
	</div>
	
	<div class="row content-area">
	
		<form action="./aadhar" method="post">
			<div class="col-md-6">
				<div class="row bg-danger">
					<div class="col-md-6">Enter Name</div>
					<div class="col-md-6">
					<input type="hidden" name="page" value="personaldetail"/>
					<input type="text" name="name" class="form-control"/></div>
				</div>
				
				<div class="row bd-warning">
					<div class="col-md-6">Enter DOB</div>
					<div class ="col-md-6"><input type="date" name="dob" class="form-control"/></div>
				</div>
				
				<div class="row bg-danger">
					<div class="col-md-6">Select Gender</div>
					<div class="col-md-2"><input type="checkbox" name="gender" value="male"/>Male</div>
					<div class="col-md-2"> <input type="checkbox" name="gender" value="female"/>Female</div>
					<div class="col-md-2"><input type="checkbox" name="gender" value="transgender"/>Transgender</div>
				</div>			
				
				<div class="row bd-warning">
					<div class="col-md-3"><input type="submit" value="Next" class="btn btn-info"/></div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>