<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	else
	{
		String id=request.getParameter("id");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/test2","root","");
		Statement smt= con.createStatement();
		ResultSet rs= smt.executeQuery("select * from aadhars where id= '"+id+"' and status=1");
		
		if(rs.next())
		{
		 
		%>

<body>

<jsp:include page="header.jsp"/>
	<div class="row">
		<div class="col-md-6"><h4>Aadhar Details Update</h4></div>
	</div>
	
	<div class="row content-area">
	
		<form action="./aadhar" method="post">
			<div class="col-md-6">
				<div class="row bg-danger">
					<div class="col-md-6">Enter Name</div>
					<div class="col-md-6">
					<input type="hidden" name="page" value="aadhardetailedit"/>
					<input type="hidden" name="id" value=<%=rs.getInt("id") %>"/>
					<input type="text" name="name" value="<%=rs.getString("name") %>" class="form-control"/></div>
				</div>
				
				<div class="row bd-warning">
					<div class="col-md-6">Enter DOB</div>
					<div class ="col-md-6">
					<input type="date" name="dob" value="<%=rs.getString("dob") %>"class="form-control"/></div>
				</div>
				
				<div class="row bg-danger">
					<div class="col-md-6">Select Gender</div>
					<div class="col-md-2"><input type="radio" name="gender" value="male" <%=rs.getString("gender").equals("male")?"checked":"" %>/>Male</div>
					<div class="col-md-2"> <input type="radio" name="gender" value="female" <%=rs.getString("gender").equals("female")?"checked":"" %>/>Female</div>
					<div class="col-md-2"><input type="radio" name="gender" value="transgender" <%=rs.getString("gender").equals("transgender")?"checked":"" %>/>Transgender</div>
				</div>	
				
				<div class="row bd-warning">
					<div class="col-md-6">Enter Phone</div>
					<div class="col-md-6">
					<input type="text" name="phone" value="<%=rs.getString("phone") %>"class="form-control"/></div>
				</div>
			
				<div class="row bg-danger">
					<div class="col-md-6">Enter Email</div>
					<div class="col-md-6"><input type="text" name="email" value="<%=rs.getString("email")%>"class="form-control"/></div>
				</div>
				
				<div class="row bg-warning">
					<div class="col-md-6">Enter Address</div>
					<div class="col-md-6"><textarea name="address" rows="3" cols="20"><%=rs.getString("address") %></textarea></div>
				</div>
				
				<div class="row bg-danger">
					<div class ="col-md-6">Enter Final Qualification</div>
					<div class="col-md-6">
					<input type="text" name="education" value="<%=rs.getString("education") %>" class="form-control"/></div>
				</div>
				
				<div class="row bg-warning">
					 <div class="col-md-6">Select Hobbies</div>
					 <div class="col-md-6">
					 <input type="checkbox" name="hobbies" value="reading" <%=rs.getString("hobbies").contains("reading")?"checked":"" %> />Reading
					 <input type="checkbox" name="hobbies" value="dancing" <%=rs.getString("hobbies").contains("dancing")?"checked":"" %>/>Dancing
					 <input type="checkbox" name="hobbies" value="playing" <%=rs.getString("hobbies").contains("playing")?"checked":"" %>/> Playing
					 </div>
				</div>
				
				<div class="row bg-danger">
					<div class="col-md-6">Mother Tongue</div>
					<div class="col-md-6">
						<select name="mothertongue" class="form-control">
							<option value="-1">Select</option>
							<option value="hindi" <%=rs.getString("mothertongue").equals("hindi")?"selected":"" %>>Hindi </option>
							<option value="english" <%=rs.getString("mothertongue").equals("english")?"selected":"" %>>English</option>
							<option value="marathi" <%=rs.getString("mothertongue").equals("marathi")?"selected":"" %>>Marathi</option>
						</select>
					</div>
				</div>
				
				<div class="row bg-warning">
					<div class="col-md-3"><input type="submit" value="UPDATE" class="btn btn-info"/></div>
				</div>
				</div>
				
				</form>
			
				
				
<jsp:include page="footer.jsp"/>
</div>
</body>
<%
		}
		   }

%>
</html>