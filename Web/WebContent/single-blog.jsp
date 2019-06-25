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
								String ID_ = rs.getString("ID");
								String SNO_ = rs.getString("SNO");
								String MNO_ = rs.getString("MNO");
								String TITLE = rs.getString("TITLE");
								String SUBTITLE = rs.getString("SUBTITLE");
								String CONTENT = rs.getString("CONTENT");
								String VISIT = rs.getString("VISIT");
						%>
								<h2><%=TITLE %></h2>
								<p><%=SUBTITLE %></p>
								<%=CONTENT %>
							</div>
						<%
								if (userid.equals(ID_)) {
						%>			
									<div style="text-align:center; margin: 20px 0;">
										<a href="write_change.jsp?sno=<%=SNO_ %>&id=<%=userid %>" style="margin-right:20px" class="genric-btn primary">수정</a>
										<a href="lib/delete_process.jsp?sno=<%=SNO_ %>&id=<%=userid %>" class="genric-btn primary">삭제</a>
									</div>
						<%
								}
						%>
						</div>
						
						<div class="navigation-top">
							<div style="float:right" class="d-sm-flex justify-content-between text-center">
								<p class="like-info">
									<span class="align-middle"><i class="fas fa-user"></i></span>
									조회수 : <%=VISIT %>
								</p>
							</div>
						</div>
					<%
						}
					%>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
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
						
									st = conn.prepareStatement("SELECT * FROM MEMBER,STUDY WHERE member.id = study.id");
									int i = 0;
						
									rs = st.executeQuery();
									while (rs.next()) {
										String SNO_ = rs.getString("SNO");
										String MNO_ = rs.getString("MNO");
										String TITLE = rs.getString("TITLE");
										String YEAR = rs.getString("YEAR");
										String MONTH = rs.getString("MONTH");
										String DAY = rs.getString("DAY");
										String TIME = rs.getString("TIME");
								%>
										<div class="media post_item">
											<img src="img/post/post_1.png" alt="post">
											<div class="media-body">
												<a href="single-blog.jsp?sno=<%=SNO %>&mno=<%=MNO %>&id=<%=userid %>">
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