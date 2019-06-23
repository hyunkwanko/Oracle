<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!doctype html>
<html lang="en">

<%@ include file="./head.jsp"%>

<body>
	<%@ include file="./nav.jsp"%>

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner text-center">
						<div class="breadcrumb_iner_item"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid" src="img/blog/single_blog_2.png" alt="">
						</div>
						<div class="blog_details">
						<%
							String SNO = request.getParameter("sno");
							String MNO = request.getParameter("mno");
							
							request.setCharacterEncoding("UTF-8");
							Class.forName("oracle.jdbc.OracleDriver");
							Connection conn = DriverManager.getConnection(
									"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
									"db201312097",
									"201312097");
						%>
						<%
							PreparedStatement st = null;

							st = conn.prepareStatement("SELECT * FROM MEMBER,STUDY WHERE member.id = study.id AND MNO = " + MNO + " AND SNO = " + SNO);
							
							ResultSet rs = st.executeQuery();
							if (rs.next()) {
								String TITLE = rs.getString("TITLE");
								String SUBTITLE = rs.getString("SUBTITLE");
								String CONTENT = rs.getString("CONTENT");
						%>
								<h2><%=TITLE %></h2>
								<p><%=SUBTITLE %></p>
								<%=CONTENT %>
						<%
							}
							
							rs.close();
							st.close();
							conn.close();
						%>
						</div>
					</div>
					<div class="navigation-top">
						<div class="d-sm-flex justify-content-between text-center">
							<p class="like-info">
								<span class="align-middle"><i class="far fa-heart"></i></span>
								4 people like this
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<form action="#">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" class="form-control"
											placeholder='Search Keyword' onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Search Keyword'">
										<div class="input-group-append">
											<button class="btn" type="button">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_4"
									type="submit">Search</button>
							</form>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Category</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>Web</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Algorithm</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Security</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Network</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Mobile</p>
								</a></li>
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
	<!--================Blog Area end =================-->
	
	<div class="container border-top">
        <div id="disqus_thread" style="margin: 35px 0;"></div>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    </div>

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
	<script id="dsq-count-scr" src="//everyolo.disqus.com/count.js" async></script>
	<!-- Disqus -->
    <script>
        (function() {
            var d = document, s = d.createElement('script');
            s.src = 'https://everyolo.disqus.com/embed.js';
            s.setAttribute('data-timestamp', +new Date());
            (d.head || d.body).appendChild(s);
        })();
    </script>
</body>

</html>