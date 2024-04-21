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
		<div class="col-md-6"><h4>Contact Detail</h4></div>
	</div>
	
	<div class="row content-area">
		<form action="./aadhar" method="post">
			<div class="col-md-6">
				<div class="row bg-danger">
					<div class="col-md-6">Enter Phone</div>
					<div class="col-md-6">
					<input type="hidden" name="page" value="contactdetail"/>
					<input type="text" name="phone" class="form-control"/></div>
				</div>
			
				<div class="row bg-warning">
					<div class="col-md-6">Enter Email</div>
					<div class="col-md-6"><input type="text" name="email" class="form-control"/></div>
				</div>
				
				<div class="row bg-danger">
					<div class="col-md-6">Enter Address</div>
					<div class="col-md-6"><textarea name="address" rows="3" cols="20"></textarea></div>
				</div>
			
				<div class="row bg-warning">
					<div class="col-md-3"><input type="submit" value="NEXT" class="btn btn-info"/></div>
				</div>
			</div>
		</form>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>