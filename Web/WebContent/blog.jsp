<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="en">

<%@ include file="./head.jsp" %>

<body>
    <%@ include file="./nav.jsp" %>

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner text-center">
                        <div class="breadcrumb_iner_item">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Blog Area =================-->
    <section class="blog_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="img/blog/single_blog_2.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>Google inks pact for new 35-storey office</h2>
                                </a>
                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that
                                    he earth it first without heaven in place seed it second morning saying.</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                                </ul>
                            </div>
                        </article>

                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="img/blog/single_blog_3.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3>15</h3>
                                    <p>Jan</p>
                                </a>
                            </div>

                            <div class="blog_details">
                                <a class="d-inline-block" href="single-blog.html">
                                    <h2>Google inks pact for new 35-storey office</h2>
                                </a>
                                <p>That dominion stars lights dominion divide years for fourth have don't stars is that
                                    he earth it first without heaven in place seed it second morning saying.</p>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="far fa-user"></i> Travel, Lifestyle</a></li>
                                    <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li>
                                </ul>
                            </div>
                        </article>
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='Search Keyword'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_4" type="submit">Search</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="blog.jsp?list=Web" class="d-flex">
                                        <p>Web</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="blog.jsp?list=Algorithm" class="d-flex">
                                        <p>Algorithm</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="blog.jsp?list=Security" class="d-flex">
                                        <p>Security</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="blog.jsp?list=Network" class="d-flex">
                                        <p>Network</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="blog.jsp?list=Mobile" class="d-flex">
                                        <p>Mobile</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">Recent Post</h3>
                            <div class="media post_item">
                                <img src="img/post/post_1.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>God IT</h3>
                                    </a>
                                    <p>January 12, 2019</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_2.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>God IT</h3>
                                    </a>
                                    <p>02 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_3.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>God IT</h3>
                                    </a>
                                    <p>03 Hours ago</p>
                                </div>
                            </div>
                            <div class="media post_item">
                                <img src="img/post/post_4.png" alt="post">
                                <div class="media-body">
                                    <a href="single-blog.html">
                                        <h3>God IT</h3>
                                    </a>
                                    <p>01 Hours ago</p>
                                </div>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

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