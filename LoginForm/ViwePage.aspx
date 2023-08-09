<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViwePage.aspx.cs" Inherits="LoginForm.ViwePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="js/Style.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

    <form id="form1" runat="server">
        <br />
        <div style="text-align: center">
            <h3>WELCOME  : </h3> <span id="namespace">  </span>
             <h5> Want To Update A Record ??</h5>
            <br />
            <span> Please Enter ID Number You Wish To Update : </span>
            <span>
                <input id="lblID" type="text" hint="Password" />
            </span>
            <span>Update Password : </span>
            <span>
                <input id="lblPassword" type="text" hint="ID" />
            </span>
            <input id="btnUpdate" onclick="UpdateData();" type="button" value="Update" />
        </div>
        <br />
        <center>
            <h5> Want To Delete A Record ??</h5>
            <br />
            <br />
             <span>Delete Record : </span>
            <span>
                <input id="lblDelete" type="text" hint="Delete" />
            </span>
            <input id="btnDelete" onclick="DeleteData();" type="button" value="Delete" />
        </center>
    
        <div>
               <span>Download In Excel </span> <span>  <img id="excel" style="height:30px; width:30px" onclick="fnExcelReport('table', 'XLS');" src="images/Capture.PNG" /></span>
            <br />
            <table id="table" class="table table-bordered table-striped">
                <thead>
                    <tr>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>



        </div>




    </form>

    <script>
        $(document).ready(function () {

            var ids = getQueryStringValue("LoginID");

            var passs = getQueryStringValue("Password");

            $("#namespace").html(ids).css("background-color", "yellow")

            $.ajax({
                type: "POST",
                url: "WebLogin.aspx/LoginMenu",
                data: JSON.stringify({ "id": ids, "password": passs }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    mydata = response.d;

                    $("#table >thead>tr").empty();
                    $("#table >thead>tr").append('<th>ID</th>');
                    $("#table >thead>tr").append('<th>Password</th>');

                    $("#table >tbody").empty();

                    $.each(mydata, function (index) {
                        $("#table >tbody").append('<tr></tr>');

                        var ID = mydata[index].id;
                        var NAME = mydata[index].name;

                        $("#table >tbody>tr:last-child").append('<td>' + ID + '</td>');
                        $("#table >tbody>tr:last-child").append('<td>' + NAME + '</td>');

                    });
                },
                error: function (x, e) {
                    //alert(x.responseText);
                    console.log(x.responseText);
                }
            });


        });

        function getQueryStringValue(key) {
            return decodeURIComponent(window.location.search.replace(new RegExp("^(?:.*[&\\?]" + encodeURIComponent(key).replace(/[\.\+\*]/g, "\\$&") + "(?:\\=([^&]*))?)?.*$", "i"), "$1"));
        }

        function UpdateData() {

            var upd_pass = $("#lblPassword").val();
            var log_id = $("#lblID").val();

            $.ajax({
                type: "POST",
                url: "WebLogin.aspx/UpdateData",
                data: JSON.stringify({ "id": log_id, "password": upd_pass }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    mydata = response.d;

                    $("#table >thead>tr").empty();
                    $("#table >thead>tr").append('<th>ID</th>');
                    $("#table >thead>tr").append('<th>Password</th>');

                    $("#table >tbody").empty();

                    $.each(mydata, function (index) {
                        $("#table >tbody").append('<tr></tr>');

                        var ID = mydata[index].id;
                        var NAME = mydata[index].name;

                        $("#table >tbody>tr:last-child").append('<td>' + ID + '</td>');
                        $("#table >tbody>tr:last-child").append('<td>' + NAME + '</td>');

                    });
                },
                error: function (x, e) {
                    //alert(x.responseText);
                    console.log(x.responseText);
                }

            });
        }


        function DeleteData() {

            var id = $("#lblDelete").val();

            $.ajax({
                type: "POST",
                url: "WebLogin.aspx/DeleteEmployeeDetails",
                data: JSON.stringify({ "id": id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    mydata = response.d;
                    $("#table >thead>tr").empty();
                    $("#table >thead>tr").append('<th>ID</th>');
                    $("#table >thead>tr").append('<th>Password</th>');

                    $("#table >tbody").empty();

                    $.each(mydata, function (index) {
                        $("#table >tbody").append('<tr></tr>');

                        var ID = mydata[index].id;
                        var NAME = mydata[index].name;

                        $("#table >tbody>tr:last-child").append('<td>' + ID + '</td>');
                        $("#table >tbody>tr:last-child").append('<td>' + NAME + '</td>');

                    });


                }, error: function (response) {

                }
            });
        }

        function fnExcelReport(obj, filename) {
            debugger;
            var id = obj;
            var fileName = filename;
            var tab_text = "<table border='2px'><tr bgcolor='#87AFC6'>";
            var textRange; var j = 0;
            tab = document.getElementById('' + id + ''); // id of table

            for (j = 0; j < tab.rows.length; j++) {
                tab_text = tab_text + tab.rows[j].innerHTML + "</tr>";
                //tab_text=tab_text+"</tr>";
            }

            tab_text = tab_text + "</table>";
            tab_text = tab_text.replace(/<a[^>]*>|<\/a>/g, "");//remove if u want links in your table
            tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
            tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params
            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");

            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
            {

                txtArea1.document.open("txt/html", "replace");
                txtArea1.document.write(tab_text);
                txtArea1.document.close();
                txtArea1.focus();
                sa = txtArea1.document.execCommand("SaveAs", true, "" + fileName + ".xls");
            }
            else {
                var sDate = '<%= HttpContext.Current.Session["LoginDate"] %>';
                var element = document.createElement('a');
                element.setAttribute('href', 'data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));
                element.setAttribute('download', fileName + '_' + sDate);
                element.style.display = 'none';
                document.body.appendChild(element);
                element.click();
                document.body.removeChild(element);
            }

        }

    </script>
</body>
</html>
