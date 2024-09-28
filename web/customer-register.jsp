<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ElegentShine Registration</title>
        <!-- Importing all ui libs -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <script src="js/simpleCart.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script src="js/jquery.easing.min.js"></script>
        <script src='../../../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
        <script src="../../../../../../m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
    </head>
      <body style="background-image: url('./sirii.jpg'); background-size: cover; background-position: center; font-family: 'Times New Roman', Times, serif; color: pink;">
        <div class="ban-top" style="background-color:black; font-family: 'Times New Roman', Times, serif; color: pink>
            <div class="container">
                <div class="top_nav_left">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed"
                                        data-toggle="collapse"
                                        data-target="#bs-example-navbar-collapse-1"
                                        aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span> <spanclass="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                                </button>
                            </div>
                            <jsp:include page="header.jsp"></jsp:include>
                            </div>
                        </nav>
                    </div>
                    <div class="top_nav_right" >
                        <div class="cart box_1" style="background-color: pink;">
                            <a href="checkout.jsp"> 
                            <%
                                ResultSet resultCount = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("id") + "'");
                                resultCount.next();
                                int count = resultCount.getInt(1);
                            %>
                            <h3>
                                <div class="total">
                                    <i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i>
                                    (
                                    <%=count%>
                                    items )
                                </div>
                            </h3>
                        </a>
                        <p>
                            <a href="javascript:;" class="simpleCart_empty" style="font-family: 'Times New Roman', Times, serif;">Empty Cart</a>
                        </p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <br>
        <div class="modal-dialog" role="document" style=" font-family: 'Times New Roman', Times, serif; color: pink;">
            <div class="modal-content modal-info">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body modal-spa">
                    <div class="login-grids">
                        <div class="login">
                            <div class="login-bottom">
                                <h3 style="font-family: 'Times New Roman', Times, serif; color: #85858c; ">SIGN UP HERE</h3>
                                <%
                                    String success = (String) session.getAttribute("success-message");
                                    if (success != null) {
                                        session.removeAttribute("success-message");
                                %>
                                <div class='alert alert-success' id='success' style="width: 680px; font-family: 'Times New Roman', Times, serif; color: #85858c;">Customer
                                    Register Successfully.</div>
                                    <%
                                        }
                                        String fail = (String) session.getAttribute("fail-message");
                                        if (fail != null) {
                                            session.removeAttribute("fail-message");
                                    %>
                                <div class="alert alert-danger" id='danger' style="width: 680px; font-family: 'Times New Roman', Times, serif; color: #85858c;">Customer
                                    Registration Fail,Please try again</div>
                                    <%
                                        }
                                    %>
                                <form action="AddCustomer" method="post">
                                    <div class="sign-up">
                                        <h4>Your Name :</h4>
                                        <input type="text" placeholder="Name" style="width: 680px; font-family: 'Times New Roman', Times, serif; color: #85858c;" name="name" pattern="[A-Za-z ]+" title="Name must contain only letters." required>
                                    </div>
                                    <div class="sign-up">
                                        <h4>Email :</h4>
                                        <input type="text" placeholder="Type here" required="" style="width: 680px; font-family: 'Times New Roman', Times, serif; color: #85858c;"
										name="email"  pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" title="Please enter a valid email address (e.g., name@example.com).">
                                    </div>
                                    <div class="sign-up">
                                        <h4>Password :</h4>
                                        <input type="password" placeholder="Password" style="width: 680px; font-family: 'Times New Roman', Times, serif; color: #85858c;" name="password" 
										pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,}"
           title="Must contain at least one number, one uppercase letter, one lowercase letter, one special character (@#$%^&+=!), and be at least 8 characters long"
               required>
                                    </div>
                                    <div class="sign-up">
                                        <h4>Phone :</h4>
                                        <input type="text" placeholder="Type here" style="width: 680px; font-family: 'Times New Roman', Times, serif; color: #85858c;" name="mobile"
										pattern="[6-9]\d{9}" title="Mobile number should contain only 10 digits and start with 6 to 9" maxlength="10" required>
                                    </div>
                                    <div class="sign-up">
                                        <h4>Gender :</h4>
                                        <br> <select class="form-control" style="width: 680px;font-family: 'Times New Roman', Times, serif; color: #85858c;" name="gender">
                                            <option>Male</option>
                                            <option>Female</option
											<option>Others</option>
                                        </select>
                                    </div>
                                    <br>
                                    <div class="sign-up">
                                        <h4>Address :</h4>
                                        <input type="text" placeholder="Type here" required="" style="min-height: 100px; width: 680px; font-family: 'Times New Roman', Times, serif; color: #85858c;" name="address">
                                    </div>
                                    <div class="sign-up">
                                        <h4>Pin Code :</h4>
                                        <input type="text" placeholder="Pincode" maxlength="6" required="" style="width: 680px; font-family: 'Times New Roman', Times, serif; color: #85858c;" 
										minlength="6" pattern="\d{6}"name="pincode"  oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 10);">
                                    </div>
                                    <div class="sign-up">
                                        <input type="submit" value="REGISTER NOW"  style="width: 680px;" >
                                    </div>
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <p>
                            <a href="customer-login.jsp" style=" font-family: 'Times New Roman', Times, serif; color: pink; text-align: center;">Existing Customer? Log In</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>