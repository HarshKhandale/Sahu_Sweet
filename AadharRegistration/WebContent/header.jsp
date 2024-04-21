<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <div class="container">
    	<div class="row">
    		<div class="col-md-3"><h2>Aadhar Centre</h2></div>
    		<div class="col-md-6"><h4>Login User:<%=session.getAttribute("LoginUser")!=null?session.getAttribute("LoginUser"):"" %></h4></div>
    		<div class="col-md-3"><h4><%=session.getAttribute("LoginUser")!=null?"<a href='./aadhar?page=LogoutDetail'> Logout</a>":""%></h4></div>
    	</div>
    
    
    </div>