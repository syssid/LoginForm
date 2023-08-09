<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="LoginForm.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Welcome</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
</head>
<body>
	<style>
		#image {
			height: 120px;
			width: 160px;
			text-align: center;
		}
	</style>
	<form id="form1" runat="server">
		<div>
			<center>
				<div style="text-align: center; color: red; font-size: xx-large;">Welcome To The Club We  Are The Hackers</div>

				<img id="image" src="images/OIP.jfif" /></center>
		</div>

		<div style="text-align: center; color: brown; font-size: xx-large;">Login To Continue...</div>
		<br />
		<div style="text-align: center">
			<span>Login ID : </span>
			<input id="login" type="text" hint="Id" />
		</div>
		<br />
		<div id="reset" style="text-align: center">
			<span id="">Password : </span>
			<input id="password" type="password" />
		</div>
		<br />
		<div id="vis" style="display: none">
			<div style="text-align: center;">
				<span id="password0">New Password : </span>
				<input id="PasswordNew" type="password" />

			</div>
			<br />
			<div style="text-align: center;">
				<span id="confirm">Confirm Password : </span>
				<input id="PasswordConfirm" type="password" />
			</div>

		</div>
		<div style="text-align: center">

			<input id="btnSubmit" onclick="SaveDetails();" type="button" value="Login" />
			<span>
				<input id="btnChange" style="display: none" onclick="ChangePassword();" type="button" value="Change Password" />
			</span>
			<h5 id="forget" onclick="forget();">Forgot Password </h5>



		</div>

		<table id="table" class="table table-bordered table-striped">
			<thead>
				<tr>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>

		<center>
			<h5 id="createaccount" onclick="PageGo();">Don't Have An Account.? Create One..</h5>
		</center>
	</form>

	<script>
		$(document).ready(function () {


		});

		function SaveDetails() {
			var log_id = $("#login").val();
			var pass = $("#password").val();

			if (log_id == '') {
				alert('Please give a login ID');
				return;
			}

			else if (pass == '') {
				alert('Please give a password');
				return;
			}

			$.ajax({
				type: "POST",
				url: "WebLogin.aspx/CheckRegistration",
				data: JSON.stringify({ "id": log_id }),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					mydata = response.d;
					if (mydata.length > 0)
						$.ajax({
							type: "POST",
							url: "WebLogin.aspx/getLogin",
							data: JSON.stringify({ "id": log_id, "password": pass }),
							contentType: "application/json; charset=utf-8",
							dataType: "json",
							success: function (response) {
								mydata = response.d;
								if (mydata.length > 0)
									window.open("ViwePage.aspx?LoginID=" + log_id + "&Password=" + pass);

								else
									alert("ID and Password Mismatch")

							}, error: function (response) {
								alert(response.e);
							}
						});
					else
						alert("User Is Not Registred With Us Please Create An Account")

				}, error: function (response) {
					alert(response.e);
				}
			});
		}
		function forget() {
			$('#reset').hide();
			$('#vis').show();
			$("#btnChange").show();
			$("#btnSubmit").hide();
		}

		function ChangePassword() {
			var newPass = $('#PasswordNew').val();
			var cPass = $('#PasswordConfirm').val();
			var id = $('#login').val();

			if (id == '') {
				alert('Please Enter ID ');
				return;
			}
			if (newPass == '') {
				alert('Please Enter New Password ');
				return;
			}

			if (cPass == '') {
				alert('Please Enter Confirm Password');
				return; newPass
			}
			if (newPass !== cPass) {
				alert(' Password Mismatch');
				return;
			}

			$.ajax({
				type: "POST",
				url: "WebLogin.aspx/UpdatePassword",
				data: JSON.stringify({ "id": id, "password": newPass }),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					mydata = response.d;
					if (mydata.length > 0)
						window.open("ViwePage.aspx?LoginID=" + id + "&Password=" + newPass);



				}, error: function (response) {

				}
			});



		}
		function PageGo() {
			window.open("Registration.aspx?");

		}
	</script>
</body>
</html>
