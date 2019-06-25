<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<%@ include file="./head.jsp" %>

<body>

    <!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
	                    <%
							String userid = request.getParameter("id");
						
							if (userid == null) {
						%>
								<a class="navbar-brand" href="index.jsp"> <img src="img/logo.png" alt="logo"> </a>
						<%
							} else {
						%>
								<a class="navbar-brand" href="index.jsp?id=<%=userid %>"> <img src="img/logo.png" alt="logo"> </a>
						<%
							}
						%>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item justify-content-end"
                            id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
	                                <%
	                                	if (userid == null) {
									%>
											<a class="nav-link" href="index.jsp">Home</a>
									<%
										} else {
									%>
											<a class="nav-link" href="index.jsp?id=<%=userid %>">Home</a>
									<%
										}
									%>
                                </li>
                                <li class="nav-item">
	                                <%
			                        	if (userid == null) {
			                        %>
	                                    	<a class="nav-link" href="study.jsp">Study</a>
	                                <%
			                        	} else {
			                        %>
			                        		<a class="nav-link" href="study.jsp?id=<%=userid %>">Study</a>
			                        <%
			                        	}
			                        %>
                                </li>
                            </ul>
                        </div>
                        <%
                        	if (userid == null || userid.equals("null")) {
                        %>
                        		<div class="menu_btn" style="margin: 0 20px;">
	                                <a href="login.jsp" class="btn_1 d-none d-sm-block">Login & Sign up</a>
	                            </div>
	                    <%
                        	} else if (userid.equals("admin")){
                        %>
                        		<div style="margin: 0">
	                                <a href="admin_member.jsp?id=<%=userid %>" class="genric-btn danger circle">관리자</a>
	                            </div>
                        		<div class="menu_btn" style="margin: 0 20px;">
	                                <a href="index.jsp" class="btn_1 d-none d-sm-block">Logout</a>
	                            </div>
	                    <%
                        	} else {
                        %>
                        		<div style="margin: 0">
	                                <a href="mypage.jsp?id=<%=userid %>" class="genric-btn info circle">마이페이지</a>
	                            </div>
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
                                    <a href="study.jsp?id=<%=userid %>" class="btn_2">Study List <img src="img/icon/left_1.svg" alt=""></a>
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
           		<%
					String list = request.getParameter("list");
						
					request.setCharacterEncoding("UTF-8");
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn = DriverManager.getConnection(
						"jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", 
						"db201312097",
						"201312097"
					);
				%>
				<%
					PreparedStatement st = null;
					int i = 1;
							
					st = conn.prepareStatement("SELECT * FROM STUDY,MEMBER WHERE member.id = study.id ORDER BY VISIT DESC");
							
					ResultSet rs = st.executeQuery();
					while (rs.next()) {
						String SNO = rs.getString("SNO");
						String MNO = rs.getString("MNO");
						String TITLE = rs.getString("TITLE");
						String SUBTITLE = rs.getString("SUBTITLE");
						String VISIT = rs.getString("VISIT");
						
				%>
						<div class="col-sm-6 col-lg-4">
		                    <div class="single_blog_item">
		                        <div class="single_blog_img">
		                            <img src="img/main/main_<%=i %>.png" alt="">
		                        </div>
		                        <div class="single_blog_text">
		                            <h3><%=TITLE %></h3>
		                            <p><%=SUBTITLE %></p>
		                            <a href="single-blog.jsp?sno=<%=SNO %>&mno=<%=MNO %>&id=<%=userid %>" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
		                        </div>
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
                        <h5>Our Goal</h5>
                        <h2>We want to study together!</h2>
                        <h4>A time when teamwork is important</h4>
                        <p>무엇이든 공부를 함께 하고싶을때, 마땅히 구할곳이 없을때
                           우리의 웹 서비를 활용하여 좋은 사람들과 함께 스터디해요.
   						   프로그래밍 언어, 함께 듣는 수업, 리눅스, 운영체제 등
    					   다양한 분야의 많은 스터디를 검색해보세요!</p>
						<%
							if (userid == null) {
						%>
							<a href="study.jsp" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
						<%
							} else {
						%>
							<a href="study.jsp?id=<%=userid %>" class="btn_3">Read More <img src="img/icon/left_2.svg" alt=""></a>
						<%
							}
						%>
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