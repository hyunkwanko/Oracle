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
	<section class="blog_area section_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="blog_left_sidebar">
						<%
							String list = request.getParameter("list");
						
							request.setCharacterEncoding("UTF-8");
							Class.forName("oracle.jdbc.OracleDriver");
							Connection conn = DriverManager.getConnection(
									"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
									"db201312097",
									"201312097");
						%>
						<%
							PreparedStatement st = null;
							
							st = conn.prepareStatement("SELECT * FROM MEMBER,STUDY WHERE member.id = study.id AND study.list = '" + list + "'");
							
							ResultSet rs = st.executeQuery();
							while (rs.next()) {
								String SNO = rs.getString("SNO");
								String MNO = rs.getString("MNO");
								String TITLE = rs.getString("TITLE");
								String SUBTITLE = rs.getString("SUBTITLE");
								String MONTH = rs.getString("MONTH");
								String DAY = rs.getString("DAY");
								String TIME = rs.getString("TIME");
								String NAME = rs.getString("NAME");
								String VISIT = rs.getString("VISIT");
								
						%>
								<article class="blog_item">
									<div class="blog_item_img">
										<img class="card-img rounded-0" src="img/blog/single_blog_2.png" alt=""> 
										<span class="blog_item_date">
											<h3><%=DAY %></h3>
											<p style="text-align: center;"><%=MONTH %></p>
										</span>
									</div>
		
									<div class="blog_details">
										<a class="d-inline-block" href="lib/visit_process.jsp?sno=<%=SNO %>&mno=<%=MNO %>&visit=<%=VISIT %>">
											<h2><%=TITLE %></h2>
										</a>
										<p><%=SUBTITLE %></p>
										<ul class="blog-info-link">
											<li><i class="fas fa-align-left"></i> <%=list %></li>
											<li><i class="far fa-clock"></i> <%=TIME %></li>
											<li><i class="fas fa-user-edit"></i> <%=NAME %></li>
											<li><i class="fas fa-eye"></i> <%=VISIT %></li>
										</ul>
									</div>
								</article>
						<%
							}
						%>
						
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Previous"> <i class="ti-angle-left"></i>
								</a></li>
								<li class="page-item active"><a href="#" class="page-link">1</a>
								</li>
								<li class="page-item"><a href="#" class="page-link">2</a></li>
								<li class="page-item"><a href="#" class="page-link"
									aria-label="Next"> <i class="ti-angle-right"></i>
								</a></li>
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
								<%
									st = null;
									
									st = conn.prepareStatement("SELECT * FROM LIST");
									
									rs = st.executeQuery();
									while (rs.next()){
										String TITLE = rs.getString("TITLE");
								%>
										<li><a href="blog.jsp?list=<%=TITLE %>" class="d-flex"><p><%=TITLE %></p></a></li>
								<%
									}
								%>
							</ul>
						</aside>

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Recent Post</h3>
							<ul class="list cat-list">
								<%
									st = null;
						
									st = conn.prepareStatement("SELECT * FROM STUDY");
									int i = 0;
						
									rs = st.executeQuery();
									while (rs.next()) {
										String TITLE = rs.getString("TITLE");
										String YEAR = rs.getString("YEAR");
										String MONTH = rs.getString("MONTH");
										String DAY = rs.getString("DAY");
										String TIME = rs.getString("TIME");
								%>
										<div class="media post_item">
											<img src="img/post/post_1.png" alt="post">
											<div class="media-body">
												<a href="single-blog.html">
													<h3><%=TITLE %></h3>
												</a>
												<p><%=YEAR %>/<%=MONTH %>/<%=DAY %>/<%=TIME %></p>
											</div>
										</div>
								<%
										if (i == 3) break;
										else i++;
									}

									rs.close();
									st.close();
									conn.close();
								%>
							</ul>
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