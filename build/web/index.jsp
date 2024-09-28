<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<style>
		/* General Page Styles */
body {
    padding: 0;
    margin: 0;
    background-color: #d0bdf4; /* Light background for the whole page */
    font-family: 'Times New Roman', Times, serif;
}

/* Navigation Bar Styles */
.ban-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #333; /* Dark background for navbar */
    padding: 10px 20px;
}

.navbar-header .navbar-toggle {
    border-color: white;
}

.navbar-brand {
    font-family: 'Times New Roman', Times, serif;
    color: #e698a9; /* Custom shop name color */
    font-size: 28px;
}

.navbar-nav li a {
    color: white; /* White text for navbar links */
    font-size: 18px;
    padding: 10px;
}

.navbar-nav li a:hover {
    text-decoration: underline;
}

.cart {
    color: white;
    display: flex;
    align-items: center;
}

.cart .total {
    font-size: 18px;
    margin-right: 10px;
}

.glyphicon-shopping-cart {
    font-size: 24px;
}

/* Banner Grid Styling */
.banner-grid {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    background-color: #dedbe2; /* Light background for banner */
	 font-family: 'Times New Roman', Times, serif;
}

.banner-grid img {
    width: 100%;
    height: auto;
    max-width: 100%;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	 font-family: 'Times New Roman', Times, serif;
}

	

/* Product Section Styles */
.product-easy {
    padding: 30px 0;
    background-color: #e5eaf5; /* Light color for product section */
	 font-family: 'Times New Roman', Times, serif;
}

.product-men {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    border: 2px solid rgb(240, 206, 227);
    border-radius: 10px;
    padding: 15px;
    margin: 20px;
    transition: all 0.3s ease;
}


.item img {
    max-width: 150px;
    border-radius: 50%;
    box-shadow: 1px 1px 1px 1px black;
}

.item-info-product h4 {
    font-size: 20px;
    margin-top: 10px;
    color: #333;
}

.item-info-product h5 {
    font-size: 16px;
    color: #777;
}

.info-product-price .item_price {
    font-size: 20px;
    color: #ff6f61;
    font-weight: bold;
}

.info-product-price del {
    color: #999;
    margin-left: 10px;
}

.btn-warning {
    background-color: #ff6f61;
    border-color: #ff6f61;
    color: white;
    padding: 10px 20px;
    border-radius: 20px;
    transition: background-color 0.3s ease-in-out;
}

.btn-warning:hover {
    background-color: #ff4e42;
}

/* Footer Styles */
.footer-section {
    background-color: #25282b;
    color: white;
    padding: 40px;
    margin-top: 40px;
}

.footer-section h4 {
    font-size: 22px;
    color: #e698a9;
    text-align: left;
    font-family: 'Gill Sans', sans-serif;
    margin-bottom: 15px;
}

.footer-section ul {
    list-style: none;
    padding: 0;
    text-align: left;
}

.footer-section ul li {
    margin-bottom: 10px;
    font-size: 16px;
    color: #d3d3d3;
    font-family: 'Lato', sans-serif;
}

.footer-section ul li i {
    margin-right: 10px;
    color: #e698a9;
}

.footer-section ul li a {
    color: #e698a9;
    text-decoration: none;
    font-size: 16px;
    font-family: 'Lato', sans-serif;
}

.footer-section ul li a:hover {
    text-decoration: underline;
}

.registered-office {
    text-align: center;
    font-family: 'Gill Sans', sans-serif;
    color: white;
    margin-top: 30px;
}

.registered-office h2 {
    font-size: 22px;
    color: #e698a9;
    margin-bottom: 10px;
    font-family: 'Papyrus', Fantasy;
}

.registered-office p {
    font-size: 16px;
    color: #d3d3d3;
}

footer hr {
    border: 0;
    height: 1px;
    background-color: white;
    margin-top: 20px;
}

.footer-container {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}

.footer-social-links a {
    color: white;
    font-size: 20px;
    margin: 0 10px;
    transition: color 0.3s ease;
}

.footer-social-links a:hover {
    color: #e698a9;
}

	</style>
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
<body style="font-family: 'Times New Roman', Times, serif;">
<body>
    <div class="ban-top">
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
                    <div class="cart box_1">
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
                        <a href="javascript:;" class="simpleCart_empty">My Cart</a>
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
    <div class="product-easy">
        <div class="container">
            <div class="container">
                <h2>
                    <span><center>Our Products</center></span>
                </h2>
            </div>
            <%
                ResultSet retriveProduct = DatabaseConnection.getResultFromSqlQuery("select * from tblproduct");
                while (retriveProduct.next()) {
            %>
            <form action="AddToCart" method="post">
                <div class="single-pro">
                    <div class="col-md-3 product-men">
                        <div class="men-pro-item simpleCart_shelfItem">
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
	<section class="footer-section">
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
                    </h4> -->
                </div>
            </center>
        </div>
    </div>
</section>
<script>
    document.getElementById("year").innerHTML = new Date().getFullYear();
</script>
       
</body>
</html>