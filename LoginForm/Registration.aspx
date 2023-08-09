<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="LoginForm.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="js/Style.css" rel="stylesheet" />
    <script src="js/jquery-3.6.0.min.js"></script>
    <title>User Registration</title>
</head>
<body>
	<style>
     .gradient-custom-3 {
/* fallback for old browsers */
background: #84fab0;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
}
.gradient-custom-4 {
/* fallback for old browsers */
background: #84fab0;

/* Chrome 10-25, Safari 5.1-6 */
background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
}
	</style>
    <form id="form1" runat="server">
        <center>
            <div class="row mx-2 my-2">
            <div class="row justify-content-center">
                <div class="col-3 label-head">
                    <span><i class="bi bi-play-fill"></i>Name : </span>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" id="lblName" placeholder="" />
                </div>
            </div>
        </div>
        <div class="row mx-2 my-2">
            <div class="row justify-content-center">
                <div class="col-3 label-head">
                    <span><i class="bi bi-play-fill"></i>Phone : </span>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" id="lblPhone" placeholder=""  maxlength="10"  />
                </div>
            </div>
        </div>
        <div class="row mx-2 my-2">
            <div class="row justify-content-center">
                <div class="col-3 label-head">
                    <span><i class="bi bi-play-fill"></i>E-Mail</span>
                </div>
                <div class="col-3">
                    <input type="email" class="form-control" id="lblEmail" placeholder="" />
                </div>
            </div>
        </div>
        <div class="row mx-2 my-2">
            <div class="row justify-content-center">
                <div class="col-3 label-head">
                    <span><i class="bi bi-play-fill"></i>Login ID :</span>
                </div>
                <div class="col-3">
                    <input type="text" class="form-control" id="lblID" placeholder="" />
                </div>
            </div>
        </div>
        <div class="row mx-2 my-2">
            <div class="row justify-content-center">
                <div class="col-3 label-head">
                    <span><i class="bi bi-play-fill"></i>Password :</span>
                </div>
                <div class="col-3">
                    <input type="password" class="form-control" id="lblPassword" placeholder="" />
                </div>
            </div>
        </div>
        <div class="row mx-2 my-2">
            <div class="row justify-content-center">
                <div class="col-3 label-head">
                    <span><i class="bi bi-play-fill"></i>Confirm Password :</span>
                </div>
                <div class="col-3">
                    <input type="password" class="form-control" id="lblCPassword" placeholder="" />
                </div>
            </div>
        </div>

        <br />

        <input id="btnSubmit" onclick="SaveDetails();" type="button" value="Register" />
        </center>
        

        
        
    </form>
    <section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h2 class="text-uppercase text-center mb-5">Create an account</h2>

              <form>

                <div class="form-outline mb-4">
                  <input type="text" id="form3Example1cg" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example1cg">Your Name</label>
                </div>

                <div class="form-outline mb-4">
                  <input type="email" id="form3Example3cg" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example3cg">Your Email</label>
                </div>

                <div class="form-outline mb-4">
                  <input type="password" id="form3Example4cg" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example4cg">Password</label>
                </div>

                <div class="form-outline mb-4">
                  <input type="password" id="form3Example4cdg" class="form-control form-control-lg" />
                  <label class="form-label" for="form3Example4cdg">Repeat your password</label>
                </div>

                <div class="form-check d-flex justify-content-center mb-5">
                  <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" />
                  <label class="form-check-label" for="form2Example3g">
                    I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                  </label>
                </div>

                <div class="d-flex justify-content-center">
                  <button type="button"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                </div>

                <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="#!"
                    class="fw-bold text-body"><u>Login here</u></a></p>

              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
    <script>
        $(document).ready({

        });


        function SaveDetails() {
         
            var name = $('#lblName').val();
            var phn = $('#lblPhone').val();
            var email = $('#lblEmail').val();
            var id = $('#lblID').val();
            var pass = $('#lblPassword').val();
            var cpass = $('#lblCPassword').val();
            var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        
            if (name == '') {
                alert('Name Cannot Be Blank');
                return;
            }
            if (phn == '') {
                alert('Phone Cannot Be Blank');
                return;
            }
   
            if (email == '') {
                alert('Email Cannot Be Blank');
                return;
            }

            if (!email.match(regex)) {
                alert('Email Pattrn Is Not Correct')
                return;
            }
            if (id == '') {
                alert('ID Cannot Be Blank');
                return;
            }
            if (pass == '') {
                alert('Password Cannnot Be Blank');
                return;
            }
            if (pass.length < 8) {
                alert('Password Length Must Be 8 Or Greater');
                return;
            }
            if (cpass !== pass) {
                alert('Confirm Password Mismatch');
                return;
            }          

            $.ajax({
                type: "POST",
                url: "WebRegistration.aspx/RegistrationMenu",
                data: JSON.stringify({ "name": name, "phone": phn, "email": email, "id": id, "password": pass}),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("success");

                    window.open("LoginPage.aspx?");

                },
                error: function (x, e) {
                    console.log(x.responseText);
                }

            });

            $.ajax({
                type: "POST",
                url: "WebRegistration.aspx/SendMail",
                data: JSON.stringify({ "name": name, "phone": phn, "email": email, "id": id, "password": pass }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("success");

                    window.open("LoginPage.aspx?");

                },
                error: function (x, e) {
                    //alert(x.responseText);
                    console.log(x.responseText);
                }

            });


        }

       


    </script>
</body>
</html>
