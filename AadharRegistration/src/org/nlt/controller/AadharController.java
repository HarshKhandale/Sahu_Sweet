package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AadharController extends HttpServlet{

	
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html");
		
		HttpSession httpsession=req.getSession();
		
		String pagename=req.getParameter("page");
		
		if(pagename.equals("LogoutDetail"))
		{
			httpsession.invalidate();//will destroy session
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
		}
		else if(pagename.equals("logindetail"))
		{
			
			String username=req.getParameter("username");
			String password=req.getParameter("password");
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2","root","");
				Statement smt=con.createStatement();
				
				ResultSet rs=smt.executeQuery(" select * from users where email='"+username+"' and password='"+password+"'");
				if(rs.next())
				{
					String name=rs.getString("name");
					httpsession.setAttribute("LoginUser", name);
					RequestDispatcher rd=req.getRequestDispatcher("aadhar.jsp");
					rd.include(req, resp);
					
				}
				else
				{
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					out.println("<h2>Invalid Username or Password</h2>");
					rd.include(req, resp);
					
				}
				smt.close();
				con.close();
				
			} catch (Exception e)
			{
				out.println("<h2>"+e+"</h2>");
			}
		}
		else if(pagename.equals("personaldetail"))
		{
			
			String name=req.getParameter("name");
			String dob=req.getParameter("dob");
			String gender=req.getParameter("gender");
			if(name.isEmpty()||dob.isEmpty()||gender.isEmpty())
			{
				RequestDispatcher rd = req.getRequestDispatcher("personaldetail.jsp");
				out.println("<h2>Please Enter Valid Personal Detail</h2>");
				rd.include(req, resp);
			}
			else
			{
			httpsession.setAttribute("nameAtt", name);
			httpsession.setAttribute("dobAtt", dob);
			httpsession.setAttribute("genderAtt", gender);
			
			RequestDispatcher rd = req.getRequestDispatcher("contactdetail.jsp");
			out.println("<h2>Personal Detail Submitted Successfully</h2>");
			rd.include(req, resp);
			
			
			}
		}
		
		else if(pagename.equals("contactdetail"))
		{
			String phone=req.getParameter("phone");
			String email=req.getParameter("email");
			String address=req.getParameter("address");
			
			if(phone.isEmpty()||email.isEmpty()||address.isEmpty())
			{
				RequestDispatcher rd =req.getRequestDispatcher("contactdetail.jsp");
				out.println("<h2>Please Enter Valid Contact Detail</h2>");
				rd.include(req, resp);
			}
			else
			{
			httpsession.setAttribute("phoneAtt", phone);
			httpsession.setAttribute("emailAtt", email);
			httpsession.setAttribute("addressAtt", address);
			
			RequestDispatcher rd=req.getRequestDispatcher("otherdetail.jsp");
			out.println("<h2>Contact Detail Submitted Successfully</h2>");
			rd.include(req, resp);
			}
		}
		
		else if(pagename.equals("otherdetail"))
		{
			String education=req.getParameter("education");
			String [] hob= req.getParameterValues("hobbies");
			
			String hobbies="";
			if(hob!=null)
			{
				for(String h:hob)
				{
					hobbies=hobbies.concat(h);
				}
			}
			
			String mothertongue=req.getParameter("mothertongue");
			if(education.isEmpty()||hobbies.isEmpty()||mothertongue.isEmpty())
			{
				RequestDispatcher rd =req.getRequestDispatcher("otherdetail.jsp");
				out.println("<h2>Please Enter Valid Other Detail</h2>");
				rd.include(req, resp);
			}
			else
			{
			
					
				String name=httpsession.getAttribute("nameAtt").toString();
				String dob=httpsession.getAttribute("dobAtt").toString();
				String gender=httpsession.getAttribute("genderAtt").toString();
				String phone=httpsession.getAttribute("phoneAtt").toString();
				String email=httpsession.getAttribute("emailAtt").toString();
				String address=httpsession.getAttribute("addressAtt").toString();
			
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test2","root","");
					Statement smt=con.createStatement();
					
					smt.execute("INSERT INTO aadhars ( name, dob, gender, phone, email, address, education, hobbies, mothertongue, status) VALUES ('"+name+"', '"+dob+"', '"+gender+"', '"+phone+"', '"+email+"', '"+address+"', '"+education+"', '"+hobbies+"', '"+mothertongue+"', 1)");
					smt.close();
					con.close();
					
					RequestDispatcher rd=req.getRequestDispatcher("aadhar.jsp");
					out.println("<h2>New Aadhar Card Submitted</h2>");
					rd.include(req, resp);
				} catch (Exception e)
				{
					out.println("<h2>"+e+"</h2>");
				}
		}
	}
	}

}
