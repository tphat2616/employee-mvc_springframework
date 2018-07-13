<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <link href="resources/themes/lbd/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="resources/themes/lbd/assets/js/jquery-1.10.2.js" type="text/javascript"></script> -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Quản lý nhân viên</title>
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
	</head>
	<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
		<div class="row">
			<div class="row" style="padding: 50px">
				<div class= "col-md-7">
					<button class="btn btn-default pull-right"  onclick="loadAddNewEmployee();return false;">Thêm mới nhân viên</button>
					<div id ="div-list-employee">
					</div>
					
				</div>
				
				<div class= "col-md-5">
						<button class="btn btn-default pull-right"  onclick="loadListEmployee();">Danh sách nhân viên</button>
						<div id="div-control-employee"></div>
				</div>
			</div>
		</div>
		<script>
		$(function(){
		});
		
		
		
		function loadAddNewEmployee(){
			$.ajax({
				type: "POST",
				url: "addNewEmployee",
				success: function (a){
					$("#div-list-employee").html(a);
				}
			});
		}
		function loadListEmployee(){
			$.ajax({
				type: "GET",
				url: "listEmployee",
				success: function (a){
					$("#div-control-employee").html(a);
				}
			});
		}
		function detailEmployee(b){
			var id = $(b).data("id");
			$.ajax({
				type: "POST",
				url: "editNewEmployee",
				data: {id: id},
				success: function(a){
					$("#div-control-employee").html(a);
				}
			});
		}
		
		function newEmployee(){
			var Name = $("#txtNameEployee").val();
			var Email = $("#txtEmailEployee").val();
			var Phone = $("#txtPhoneEployee").val();
			var flag = true;
			if(Name.trim() =="" || Phone.trim()=="" || Email.trim()==""){
				flag= false;
				alert("Name, email, phone can not empty. Please fill them");
			}
			if(!validateEmail(Email)){
				flag = false;
				alert("Wrong format email. abc@gmail.com");
			}
			
			if(!validatePhone(Phone)){
				flag = false;
				alert("Wrong format phone. number length <=11 and >=10");
			}
			
			if(flag){
				$.ajax({
					type:"POST",
					url: "submitNewEmployee",
					data:{name: Name , email: Email, phone: Phone},
					success: function (a){
						alert(a);
						loadListEmployee();
						loadAddNewEmployee();
					}
				});
			}
		}
		</script>
	</body>
	
	
</html>