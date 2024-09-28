<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

    <!-- Importing all ui libs -->
   <link href="assets/css/font-awesome.css" rel="stylesheet" />
   <link href="assets/css/style.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" /> 
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
     <body style=" background-color:#c8caf1 font-family: 'Times New Roman', Times, serif; color: pink;">


    <div class="ban-top" style="background-color:black; font-family: 'Times New Roman', Times, serif; color: pink>>
        <div class="container">
            <div class="top_nav_left">
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed"
                                    data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-1"
                                    aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                            </button>
                        </div>
                        <jsp:include page="header.jsp"></jsp:include>
                        </div>
                    </nav>
                </div>
                <div class="top_nav_right">
                    <div class="cart box_1" style="background-color: pink;>
                        <a href="checkout.jsp"> 
                        <%
                            //Getting all cart details of the customer
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
                        <a href="javascript:;" class="simpleCart_empty" style="font-family: 'Times New Roman', Times, serif;">My Cart</a>
                    </p>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="banner-grid">
        <div id="visual">
         <!--   <div class="slide-visual">
                <ul class="slide-group">
                    <li><img class="img-responsive" src="./pendent.jpeg" alt="ElegentShine" /></li>
                     <li><img class="img-responsive" src="./oxidized-pendend-necklace.jpg" alt="ElegentShine" /></li>
                   <li><img class="img-responsive" src="./diamond-pendant1.png" alt="ElegentShine" /></li>
                </ul>  --> 
                <div class="script-wrap">
                    <ul class="script-group">
                        
                        <li><div class="inner-script">
                                <img class="img-responsive" src="./back_g4.jpg" alt="ElegentShine" />
                            </div></li>
                    </ul>
            <!--        <div class="slide-controller">
                        <a href="#" class="btn-prev"><img src="images/btn_prev.png"  alt="Prev Slide" /></a>
						<a href="#" class="btn-play"><img  src="images/btn_play.png" alt="Start Slide" /></a> 
						<a href="#"	class="btn-pause"><img src="images/btn_pause.png" alt="Pause Slide" /></a> 
						<a href="#" class="btn-next"><img  src="images/btn_next.png" alt="Next Slide" /></a>
                    </div> -->
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
        <script type="text/javascript" src="js/pignose.layerslider.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $('#visual').pignoseLayerSlider({
                    play: '.btn-play',
                    pause: '.btn-pause',
                    next: '.btn-next',
                    prev: '.btn-prev'
                });
            });
        </script>
    </div>
    <br/>
    <div class="product-easy"  style="background-color:#dadbf5 ;">
        <div class="container">
            <div class="container">
                <h2 style=" font-family: 'Times New Roman', Times, serif; color: white;">
                    <span><center>Our Products</center></span>
                </h2>
            </div>
            <%
                ResultSet retriveProduct = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct");
                while (retriveProduct.next()) {
            %>
            <form action="AddToCart" method="post">
                <div class="single-pro" >
                    <div class="col-md-3 product-men" > 
                        <div class="men-pro-item simpleCart_shelfItem"  style="color: black; background-color: #e6e3e6;">
                            <div class="men-thumb-item">
                                <input type="hidden" name="productId"
                                       value="<%=retriveProduct.getInt("id")%>"> <img
                                       src="uploads/<%=retriveProduct.getString("image_name")%>"
                                       alt="" class="pro-image-front"> <img
                                       src="uploads/<%=retriveProduct.getString("image_name")%>"
                                       alt="" class="pro-image-back"> <span
                                       class="product-new-top">New</span>
                            </div>
                            <div class="item-info-product ">
                                <h4>
                                    <a href=""><%=retriveProduct.getString("name")%></a>
                                </h4>
                                <h5>
                                    Category: <%=retriveProduct.getString("product_category")%>
                                </h5>
                                <div class="info-product-price">
                                    <input type="hidden" name="price"
                                           value="<%=retriveProduct.getString("price")%>"> <input
                                           type="hidden" name="mrp_price"
                                           value="<%=retriveProduct.getString("mrp_price")%>"> <span
                                           class="item_price"><%=retriveProduct.getString("price")%> Rs.</span>
                                    <del><%=retriveProduct.getString("mrp_price")%> Rs.</del>
                                </div>
                                <input type="submit" value="Add to cart" class="btn btn-warning" onclick="return confirm('Are you sure Do you want to add this item in cart?');">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <%
                }
            %>
        </div>
    </div>
	<!--<section class="footer-section">
    <div class="row">
        <div class="col">
            <div class="sign-grds">
                <div class="col-md-3 sign-gd-two">
                    <h4 style="text-align: left;">Contact Us:</h4>
                    <ul style="text-align: left;">
                        <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Address :Gwalior, MP <span>India.</span></li>
                        <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : <a href="ElegtnShine@gmail.com">info@ElegentShine</a></li>
                        <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone : +91-1010010011</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col">
            <br/><br/><br/>
            <center>
                <div class="container">
				 <h2>Registered office</h2>
        <p>				Gwalior-474020. Person who may be contacted in case of any compliance related queries or grievances
									: Sarita Rathor:1010101010</p><br>
								<hr /><br>
                   <!-- <h4>
                        &copy;  <span id="year"></span> Elegent<a href="https://data-flair.training" target="_blank"> Designed by : DataFlair</a>
                    </h4> 
                </div>
            </center>
        </div>
    </div> 
	
</section> -->
 <jsp:include page="footer.jsp"></jsp:include>
<script>
    document.getElementById("year").innerHTML = new Date().getFullYear();
</script>
       
</body>
</html>