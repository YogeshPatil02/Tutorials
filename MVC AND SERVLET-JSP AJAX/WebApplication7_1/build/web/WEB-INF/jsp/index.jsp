<!DOCTYPE html>
<%@page import="com.vimal.dao.StudentDaoImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.vimal.model.DBConnection"%>
<%@page import="com.vimal.model.Student"%>
<%@page import="java.util.*"%>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<script>

var contexPath = "<%=request.getContextPath() %>"

function validateAlpha(email) 
{
    var re = /^[a-zA-Z]+$/;
    return re.test(email);
}

function validateEmail(email) 
{
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}

function IsNumeric(input)
{
    return (input - 0) == input && (''+input).trim().length > 0;
}

function onCancelClick()
{	
  $("#myform").trigger('reset');
}

$(document).ready(function(){
	$("#submit").click(function(){
	var name = $("#name").val();
	var email = $("#email").val();
	var phone = $("#phone").val();
	var marks = $("#marks").val();
	// Returns successful data submission message when the entered information is stored in database.
	var dataString = 'name='+ name + '&email='+ email + '&phone='+ phone + '&marks='+ marks;
	if(name==''||email==''||phone==''||marks=='')
	{
	alert("Please Fill All Fields");
	  return false;
	}
	
	if(validateAlpha(name)==false)
	{
	  alert("Name Must be Alphabets");
	  return false;
	}
	
	if(validateEmail(email)==false)
	{
	  alert("Email Must be Valid");
	  return false;
	}
	if(phone.length != 10) {
	    alert("Phone number must be 10 digits.");
	    return false;
	}
	
	if(IsNumeric(phone)==false)
	{
	  alert("Mobile Number Must be Numeric");
	  return false;
	}
	
	if(IsNumeric(marks)==false)
	{
	  alert("Marks Must be Numeric");
	  return false;
	}
	
	else
	{
	// AJAX Code To Submit Form.
	$.ajax({
	type: "POST",
	url: contexPath + "/AddUser.htm",
	data: dataString,
	cache: false,
	success: function(result){
	//alert(result);
	console.log(result);
		if(result="Save Successfully"){
			$('#myModal').modal('hide');
			$('#tab').append('<tbody><tr><td>--</td><td>'+name+'</td><td>'+email+'</td><td>'+phone+'</td><td>'+marks+'</td></tr></tbody>');
			//location.reload();
		}
		else
		{
			alert("Sorry");
		}
	}
	});
	}
	return false;
	});
	});
</script>

	<%

%>
	<div class="container">
		<h2>Student List</h2>
		<table class="table table-bordered" id="tab">
			<thead>
				<tr>
					<th>No</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Marks</th>
				</tr>
			</thead>
		<%
			StudentDaoImpl dao = new StudentDaoImpl();
			List<Student> list = dao.getAllStudent();
			 if(list!=null&& list.size()>0)
			 {
			  for(Student student:list)
			  {
			%> 
			  	 
			
			<tbody>
				<tr>
					<td><%=student.getId() %></td>
					<td><%=student.getName()%></td>
					<td><%=student.getEmail() %></td>
					<td><%=student.getContact()%></td>
					<td><%=student.getMarks()%></td>
				</tr>


			</tbody>
			<% }%>
				
		
<% 
 }
%>
</table>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">Add Student</button>

		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Add Student</h4>
					</div>
					<div class="modal-body">
						<form role="form" id="myform">                                                    
                                                     
							<div class="form-group">
								<label for="name">Name:</label> <input type="text"
									class="form-control" id="name" placeholder="">
							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="email"
									class="form-control" id="email" placeholder="">
							</div>
							<div class="form-group">
								<label for="phone">Phone:</label> <input type="text"
									class="form-control" id="phone" placeholder="">
							</div>
							<div class="form-group">
								<label for="email">Marks:</label> <input type="text"
									class="form-control" id="marks" placeholder="">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"  data-dismiss="modal" onclick="onCancelClick();">Close</button>
						<button type="button" class="btn btn-primary" id="submit" data-dismiss="modal">Save Change</button>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
