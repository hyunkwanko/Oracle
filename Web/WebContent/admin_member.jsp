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
						<div class="section-top-border">
							<h3 class="mb-30">Member Table</h3>
							<div class="progress-table-wrap">
								<div class="progress-table">
									<div class="table-head">
										<div class="serial">#</div>
										<div class="country">NAME</div>
										<div class="visit">ID</div>
										<div class="percentage">가입일</div>
									</div>
									<%
										request.setCharacterEncoding("UTF-8");
										Class.forName("oracle.jdbc.OracleDriver");
										Connection conn = DriverManager.getConnection(
												"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
												"db201312097",
												"201312097");
									%>
									<%
										PreparedStatement st = null;
			
										st = conn.prepareStatement("SELECT * FROM MEMBER");
										int i = 1;
										ResultSet rs = st.executeQuery();
										while (rs.next()) {
											String NAME = rs.getString("NAME");
											String ID = rs.getString("ID");
									%>
											<div class="table-row">
												<div class="serial"><%=i %></div>
												<div class="country"><%=NAME %></div>
												<div class="visit"><%=ID %></div>
												<div class="percentage">1234</div>
											</div>
									<%
											i++;
										}
										
										rs.close();
										st.close();
										conn.close();
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Category</h4>
							<ul class="list cat-list">
								<li><a href="admin_member.jsp" class="d-flex"><p>Member</p></a></li>
								<li><a href="admin_study.jsp" class="d-flex"><p>Study</p></a></li>
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