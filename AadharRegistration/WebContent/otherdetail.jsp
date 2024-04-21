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
	<div class="col-md-6"><h4>Other Detail</h4></div>
	</div>
	
		<div class="row content-area">
		<form action ="./aadhar" method="post">
			
			<div class="col-md-6">
				
				<div class="row bg-warning">
					<div class ="col-md-6">Enter Final Qualification</div>
					<div class="col-md-6">
					<input type="hidden" name="page" value="otherdetail"/>
					<input type="text" name="education" class="form-control"/></div>
				</div>
				
				<div class="row bg-danger">
					 <div class="col-md-6">Select Hobbies</div>
					 <div class="col-md-6">
					 <input type="checkbox" name="hobbies" value="reading"/>Reading
					 <input type="checkbox" name="hobbies" value="dancing" />Dancing
					 <input type="checkbox" name="hobbies" value="playing"/> Playing
					 </div>
				</div>
				
				<div class="row bg-warning">
					<div class="col-md-6">Mother Tongue</div>
					<div class="col-md-6">
						<select name="mothertongue" class="form-control">
							<option value="-1">Select</option>
							<option value="hindi">Hindi</option>
							<option value="english">English</option>
							<option value="marathi">Marathi</option>
						</select>
					</div>
				</div>
				
				<div class="row bg-danger">
					<div class="col-md-3"><input type="submit" value ="SUBMIT" class="btn btn-info"/></div>
				</div>
			</div>
		</form>
	
	</div>

<jsp:include page="footer.jsp"/>
</body>
</html>