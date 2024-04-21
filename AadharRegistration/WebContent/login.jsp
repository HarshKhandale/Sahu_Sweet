<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"/>
<body>
<style type="text/css">

	.content-area
	{
		border:4px double gray;
		border-radius:10px;
	}
	
	.content-area:before
	
	{
		background-image: url("https://bsmedia.business-standard.com/_media/bs/img/article/2020-10/14/full/1602646324-1791.jpg");
		width: 100%;
		height: 100%;
		background-size: cover;
		content: "";
		
		
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		
		z-index:-1;
		display:block;
		filter:blur(2px);
	}
	
</style>
<jsp:include page="header.jsp"/>
	<div class="row">
		<div class="col-md-6"><h4>Login Details</h4></div>
	</div>
	
	<div class="row content-area">
	
		<form action="./aadhar" method="post">
			<div class="col-md-6">
				<div class="row bd-warning">
					<div class="col-md-6">Enter Username </div>
					<div class="col-md-6">
					<input type="hidden" name="page" value="logindetail"/>
					<input type="text" name="username" class="form-control"/></div>
				</div>
				
				<div class="row bd-warning">
					<div class="col-md-6">Enter Password</div>
					<div class ="col-md-6"><input type="password" name="password" class="form-control"/></div>
				</div>	
				
				<div class="row-bg-danger">
					<div class="col-md-3"><a href="forget.jsp">ForgetPassword</a></div>
				</div>	
				
				<div class="row bd-warning">
					<div class="col-md-3"><input type="submit" value="LOGIN" class="btn btn-info"/></div>
				</div>
			</div>
			
			
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>