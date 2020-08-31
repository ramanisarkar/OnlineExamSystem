<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 25%;
	background-color: #f1f1f1;
	position: fixed;
	height: 100%;
	overflow: auto;
}

li a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
}

li a.active {
	background-color: #4CAF50;
	color: white;
}

li a:hover:not(.active) {
	background-color: #555;
	color: white;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script>
$(document).ready(function() {                        
	$('#deaprtmentid').change(function(event) {  
        var username=$('#deaprtmentid').val();
     $.get('Department1',{q:username},function(response) {
    	 var obj = JSON.parse(response);
    	 var select = $('#semesterid');
    	 select.find('option').remove();
    	 $('<option>').val("").text("Select Semester").appendTo(select);   
    	 $.each(obj, function(index, value) {
		   	$('<option>').val(obj[index].id).text(obj[index].semester).appendTo(select);
		 });
     });   
  });
});
</script>
<title>Insert title here</title>
</head>
<body>

<div>
	<ul>
	  <c:forEach items="${sessionScope.collegedata }" var="q">
		<li><a href="College_Login.jsp">Home</a></li>
		<li><a href="<%=request.getContextPath()%>/Department?flag=insert&id=${q.id }">Add Department</a></li>
		<li><a href="<%=request.getContextPath()%>/Sem?flag=insert&id=${q.id }">Add Semester </a></li>
		<li><a href="<%=request.getContextPath()%>/Subject?flag=insert&id=${q.id }">Add Subject</a></li>
		<li><a href="<%=request.getContextPath()%>/Professor?flag2=professor&flag=insert&id=${q.id }">Add Professor</a></li>
		<li><a href="<%=request.getContextPath()%>/Professor?flag2=hod&flag=insert&id=${q.id }">Add Head Of Department</a></li>
		<li><a href="<%=request.getContextPath()%>/Student?flag=insert&id=${q.id }">Add Student</a></li>
		<li><a href="<%=request.getContextPath()%>/Exam?flag=insert&id=${q.id }">Add Exam</a></li>
		<li><a href="<%=request.getContextPath()%>/Sem?flag=viewsemlist&id=${q.id }">View SemList </a></li>
		<li><a href="<%=request.getContextPath()%>/Department?flag=viewdepartmentlist&id=${q.id }">View Department</a></li>
		<li><a href="<%=request.getContextPath()%>/Subject?flag=searchcollegesubject&id=${q.id }">View Subject</a></li>
		<li><a href="<%=request.getContextPath()%>/Professor?flag=searchcollegeprofessor&id=${q.id }">View Professor</a></li>
		<li><a href="<%=request.getContextPath()%>/Student?flag=searchcollegestudent&id=${q.id }">View Student</a></li>
		<li><a href="<%=request.getContextPath()%>/Exam?flag=searchcollegeexam&id=${q.id }">View Exam</a></li>
		<li><a href="Com_Login.jsp">Logout</a></li>
	  </c:forEach>
	</ul>
</div>
	<div style="margin-left: 25%; padding: 1px 16px; height: 1000px;">
		<div style="padding-top: 2%;">
			<%
				if (session.getAttribute("studentadd") != null) {
			%>
			<p style="color: red">Add Successfully</p>
			<%
				session.removeAttribute("studentadd");
			} else if (session.getAttribute("emailidadd") != null) {
			%>
			<p style="color: red">Email id already exist</p>
			<%
				session.removeAttribute("emailidadd");
			} else if (session.getAttribute("cahck") != null) {
			%>
			<p style="color: red">Please select department and semester</p>
			<%
				session.removeAttribute("cahck");
			}
			%>
			<h3>Add Student</h3>
			<form method="post" action="<%=request.getContextPath()%>/Student">
				
				<c:forEach items="${sessionScope.studentlist }" var="q">
				<span>*</span> First_Name: 
				<input type="text" name="firstName" value="${q.firstName}"><br><br> 
				
				<span>*</span>Last_Name: 
				<input type="text" name="lastName" value="${q.lastName }" required><br> <br> 
				
				<span>*</span>Contact_No:
  				<input type="tel" id="phone" name="Con_no" placeholder="123-456-7890"pattern="[0-9]{3}[0-9]{3}[0-9]{4}" value="${q.con_no }"><br><br>
  				<span>*</span>Roll No:
				<input type="text" name="roll" value="${q.roll }"><br><br>
				<span>*</span>Department:-<br>
				<select name="departmentid" id="deaprtmentid" required>
					<option value="${q.departmentid.id }">${q.departmentid.department }</option>
					<c:forEach items="${sessionScope.departmentist }" var="q">
						<option value="${q.id }">${q.department }</option>
					</c:forEach>
				</select><br><br>
				</c:forEach>
				<c:forEach items="${sessionScope.studentlist }" var="q">
  				<span>*</span>Semester:-<br>
				<select	name="semid" id="semesterid" required>
					<option value="${q.semesterid.id }">${q.semesterid.semname }</option>
				</select><br> <br> 
				
				
				<span>*</span>Address:
				<input type="text" name="address" value="${q.address }"><br><br>
				<span>*</span>Email: 
				<input type="email" name="email" value="${q.email }" required><br><br> 
				
				<span>*</span>Password:
				<input type="text" name="pass" value="${q.password }" required><br><br>
				<input type="hidden" name="flag" value="update">
				<input type="hidden" name="gender" value="${q.gender }">
				<input type="hidden" name="collegeid" value="${q.collegeid.id }">
				<input type="hidden" name="id" value="${q.id }">
				<input type="hidden" name="joiningdate" value="${q.joiningdate }">
	            <input type="submit" name="submit">
	            </c:forEach>
			</form>
		</div>
	</div>
</body>
</html>