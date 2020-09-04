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
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}
a {
	text-decoration: none;
	display: inline-block;
	padding: 8px 16px;
}

a:hover {
	background-color: #555;
	color: white;
}
</style>
</head>
<body>
<body>

<div>
	<ul>
	  <c:forEach items="${sessionScope.professordata }" var="q">
		<li><a href="Professor_HOD_Login.jsp">Home</a></li>
		<li><a href="<%=request.getContextPath()%>/Subject?flag=hodinsert&id=${q.collegeid.id }">Add Subject</a></li>
		<li><a href="<%=request.getContextPath()%>/Student?flag=hodinsert&id=${q.collegeid.id }">Add Student</a></li>
		<li><a href="<%=request.getContextPath()%>/Exam?flag=hodinsert&id=${q.collegeid.id }">Add Exam</a></li>
		<li><a href="<%=request.getContextPath()%>/Sem?flag=hodviewsemlist&id=${q.departmentid.id }">View SemList </a></li>
		<li><a href="<%=request.getContextPath()%>/Subject?flag=hodviewsubject&id=${q.departmentid.id }">View Subject</a></li>
		<li><a href="<%=request.getContextPath()%>/Professor?flag=hodprofessorlist&id=${q.departmentid.id }">View Professor</a></li>
		<li><a href="<%=request.getContextPath()%>/Student?flag=searchcollegestudent&id=${q.id }">View Student</a></li>
		<li><a href="<%=request.getContextPath()%>/Exam?flag=searchcollegeexam&id=${q.id }">View Exam</a></li>
		<li><a href="Com_Login.jsp">Logout</a></li>
	  </c:forEach>
	</ul>
</div>
<div style="margin-left:25%;padding:1px 16px;height:1000px;">
	<div style="padding-top:2%;" >
		<h3>View Professor Details</h3>
		<%int i=1; %>
		<a class="previous"
			href="HOD_Professor_List.jsp">&laquo;
			Previous</a>
		<table border="1">
			<tr>
				<td>No</td>
				<td>Professor Name</td>
				<td>Subject</td>
				<td>Semester</td>
				<td>Department</td>
				<td>Delete</td>
				
			</tr>
				<c:forEach items="${sessionScope.collegeProfessorDepartmentSubjectList }" var="q">
					<tr>
						<td><%=i %></td>
						<td>${q.professorid.firstName }</td>
						<td>${q.subjectid.subject }</td>
						<td>${q.semprofessorid.semid.semname }</td>
						<td>${q.departmentprofessorid.departmentid.department }</td>
						<td><a href="<%=request.getContextPath()%>/Professor?flag=deleteProfessorSubject&id=${q.id }">Delete</a></td>
					</tr>
					<%i++; %>
				</c:forEach>
		</table>
	</div>
</div>
</body>
</html>