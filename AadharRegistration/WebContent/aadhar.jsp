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
%>

<body>
  <jsp:include page="header.jsp"/>
	
	
	<div class="row">
		<div class="col-md-6"><h4><a href="personaldetail.jsp">New Aadhar</a></h4></div>
	</div>
	
	<div class="row content-area">
		<div class="col-md-12">
			<table class="table">
  				<thead>
   					 <tr>
					      <th scope="col">ACTION</th>
					      <th scope="col">ID</th>
					      <th scope="col">NAME</th>
					      <th scope="col">CONTACT</th>
					      <th scope="col">EMAIL</th>
					      <th scope="col">EDUCATION</th>
					       <th scope="col">HOBBIES</th>      
    				</tr>
  				</thead>
  				<tbody>
  				<%
  				Class.forName("com.mysql.jdbc.Driver");
  				Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/test2","root","");
  				Statement smt=con.createStatement();
  				ResultSet rs= smt.executeQuery("Select * from aadhars where status=1");
  				
  				while(rs.next())
  				{
  				
  				%>
	    			<tr>
	    				<td><a href="./edit.jsp?id=<%=rs.getInt("id")%>">EDIT </a> || <a href="delete.jsp" ">DELETE</a></td>
					      <td><%=rs.getInt("id") %></td>
					       <td><%=rs.getString("name")%></td>
					       <td><%=rs.getString("phone")%></td>
					       <td><%=rs.getString("email")%></td>
					       <td><%=rs.getString("education")%></td>
					       <td><%=rs.getString("hobbies")%></td>   
	    			</tr>
	    		<%	
  				}
  				
  				rs.close();
  				smt.close();
  				con.close();
  				%>
	  			</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="footer.jsp"/>
	</body>
</html>