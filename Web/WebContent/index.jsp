<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ include file="./head.jsp" %>

<body>

    <!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" style="font-size: 2.25rem;" href="index.jsp"> <img src="img/logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item justify-content-end"
                            id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="index.jsp">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="study.jsp">Study</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Blog
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="blog.jsp">Blog</a>
                                        <a class="dropdown-item" href="single-blog.html">Single blog</a>
                                        <a class="dropdown-item" href="elements.html">Elements</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <%
							String userid = request.getParameter("id");
                 
                        	System.out.println("null");
                        	
                        	if (userid == null) {
                        %>
                        		<div class="menu_btn" style="margin: 0 20px;">
	                                <a href="login.jsp" class="btn_1 d-none d-sm-block">Login & Sign up</a>
	                            </div>
	                    <%
                        	} else if (userid.equals("admin")){
                        %>
                        		<div class="menu_btn" style="margin: 0">
	                                <a "href="index.jsp" class="genric-btn danger circle">관리자</a>
	                            </div>
                        		<div class="menu_btn" style="margin: 0 20px;">
	                                <a href="index.jsp" class="btn_1 d-none d-sm-block">Logout</a>
	                            </div>
	                    <%
                        	} else {
                        %>
                        		<div class="menu_btn" style="margin: 0 20px;">
	                                <a href="index.jsp" class="btn_1 d-none d-sm-block">Logout</a>
	                            </div>
	                    <%	
                        	}
						%>
                        
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->

    <!-- banner part start-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="banner_text">
                        <div class="banner_text_iner">
                            <h5>Simple but the best</h5>
                            <h1>The future is gained from present pains</h1>
                            <p>도움이 될 만한 사람과 그 일을 함께 하라. <br>누군가와 함께 하면 혼자 하는 것보다 효과적이고 포기하지 않는다.</p>
                            <div class="banner_btn">
                                <div class="banner_btn_iner">
                                    <a href="study.jsp" class="btn_2">Study List <img src="img/icon/left_1.svg" alt=""></a>
                                </div>
                                <a href="https://www.youtube.com/watch?v=pBFQdxA-apI" class="popup-youtube video_popup">
                                    <span><img src="img/icon/play.svg" alt=""></span> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- banner part start-->

    <!--::exclusive_item_part start::-->
    <section class="exclusive_item_part blog_item_section">
        <div class="container">
            <div class="row">
                <div class="col-xl-5">
                    <div class="section_tittle">
                        <p>Popular Studies</p>
                        <h2>Our Exclusive Studies</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="img/food_item/food_item_1.png" alt="">
                        </div>
                        <div class="single_blog_text">
                            <h3>Indian Burger</h3>
                            <p>Was brean shed moveth day yielding tree yielding day were female and </p>
                            <a href="#" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="img/food_item/food_item_2.png" alt="">
                        </div>
                        <div class="single_blog_text">
                            <h3>Cremy Noodles</h3>
                            <p>Was brean shed moveth day yielding tree yielding day were female and </p>
                            <a href="#" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="img/food_item/food_item_3.png" alt="">
                        </div>
                        <div class="single_blog_text">
                            <h3>Honey Meat</h3>
                            <p>Was brean shed moveth day yielding tree yielding day were female and </p>
                            <a href="#" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-4 d-none d-sm-block d-lg-none">
                    <div class="single_blog_item">
                        <div class="single_blog_img">
                            <img src="img/food_item/food_item_1.png" alt="">
                        </div>
                        <div class="single_blog_text">
                            <h3>Cremy Noodles</h3>
                            <p>Was brean shed moveth day yielding tree yielding day were female and </p>
                            <a href="#" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::exclusive_item_part end::-->

    <!-- about part start-->
    <section class="about_part">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-sm-4 col-lg-5 offset-lg-1">
                    <div class="about_img">
                        <img src="img/about.png" alt="">
                    </div>
                </div>
                <div class="col-sm-8 col-lg-4">
                    <div class="about_text">
                        <h5>Our History</h5>
                        <h2>Where The Food’s As Good
                            As The Root Beer.</h2>
                        <h4>Satisfying people hunger for simple pleasures</h4>
                        <p>May over was. Be signs two. Spirit. Brought said dry own firmament lesser best sixth deep
                            abundantly bearing, him, gathering you
                            blessed bearing he our position best ticket in month hole deep </p>
                        <a href="#" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- about part end-->

    <!-- jquery plugins here-->
    <!-- jquery -->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- swiper js -->
    <script src="js/slick.min.js"></script>
    <script src="js/gijgo.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>

</html>