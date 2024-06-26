<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.attendance.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.util.Random"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Student Attendance System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#F0F0F0">
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="admin_side_header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="panel panel-default shadow p-3 mb-5">
			<div class="panel-body">
				<div class="alert alert-info shadow p-3 mb-5" style="text-transform: uppercase">Send User Name and Password Email to Students</div>
				<%
					String resultMessage = (String) session.getAttribute("mail-success");
						if (resultMessage != null) {
							session.removeAttribute("mail-success");
				%>
				<div class="alert alert-success" id="success">Your login user
					name and password send successfully in your email.</div>
				<%
					}
				%>

				<div class="panel panel shadow p-3 mb-5">
					<div class="panel-heading bg-light" style="text-transform: uppercase;font-size:small;font-weight: bold;">
						User Name and Password&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="panel-body">
						<table id="table"
							class="table table-striped table-hover table-bordered">
							<thead>
								<tr>
									<th>Student Id</th>
									<th>Student Name</th>
									<th>Mobile No</th>
									<th>Email Id</th>
									<th>User Name</th>
									<th>Student Password</th>
									<th>Send User Name and Password in Mail</th>
								</tr>
							</thead>
							<tbody>
								<%
									ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from students");
										while (rs.next()) {
											//int id=rs.getInt(1);
								%>
								<form action="" method="post">
									<tr>
										<td><%=rs.getInt(1)%></td>
										<td><%=rs.getString(2)%></td>
										<td><%=rs.getString(4)%></td>
										<td><%=rs.getString(6)%></td>
										<td><%=rs.getString(7)%></td>
										<td><span class="label label-info"><%=rs.getString(8)%></span></td>
										<td><a
											href="EmailSendingServlet?student_id=<%=rs.getInt(1)%>"
											class="btn btn-primary"><span
												class="glyphicon glyphicon-envelope"></span> Send User Name
												& Password in Mail</a></td>
									</tr>
								</form>
								<%
									}
								%>
							</tbody>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
</body>
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table').DataTable();
	})
</script>
<script type="text/javascript">
	$(function() {
		$('#success').delay(5000).show().fadeOut('slow');
	});
</script>
</html>
