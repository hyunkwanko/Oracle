<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

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

    <!--::chefs_part start::-->
    <!-- food_menu start-->
    <section class="food_menu gray_bg">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="section_tittle">
                        <p>Popular Study</p>
                        <h2>Awesome Study List</h2>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="nav nav-tabs food_menu_nav" id="myTab" role="tablist">
                        <a class="active" id="Special-tab" data-toggle="tab" href="#Special" role="tab"
                            aria-controls="Special" aria-selected="false">Web <img src="img/icon/play.svg" alt="play"></a>
                        <a id="Breakfast-tab" data-toggle="tab" href="#Breakfast" role="tab" aria-controls="Breakfast"
                            aria-selected="false">Database <img src="img/icon/play.svg" alt="play"></a>
                        <a id="Launch-tab" data-toggle="tab" href="#Launch" role="tab" aria-controls="Launch"
                            aria-selected="false">Security <img src="img/icon/play.svg" alt="play"></a>
                        <a id="Dinner-tab" data-toggle="tab" href="#Dinner" role="tab" aria-controls="Dinner"
                            aria-selected="false">Algorithm <img src="img/icon/play.svg" alt="play"> </a>
                        <a id="Sneaks-tab" data-toggle="tab" href="#Sneaks" role="tab" aria-controls="Sneaks"
                            aria-selected="false">AI <img src="img/icon/play.svg" alt="play"></a>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active single-member" id="Special" role="tabpanel" aria-labelledby="Special-tab">
                            <div class="row">
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
									int i = 1;
									
									st = conn.prepareStatement("SELECT * FROM MEMBER,STUDY WHERE member.id = study.id AND study.list = 'Web'");
									
									ResultSet rs = st.executeQuery();
									while (rs.next()){
										String ID = rs.getString("ID");
										String TITLE = rs.getString("TITLE");
										String SUBTITLE = rs.getString("SUBTITLE");
										String NAME = rs.getString("NAME");
										
										if (i % 2 == 1){
								%>
											<div class="col-sm-6 col-lg-6">
								<%
										}
								%>
										<div class="single_food_item media">
	                                        <img src="img/food_menu/single_food_<%=i %>.png" class="mr-3" alt="...">
	                                        <div class="media-body align-self-center">
	                                            <h3><%=TITLE %></h3>
	                                            <p><%=SUBTITLE %></p>
	                                            <h5><%=NAME %></h5>
	                                        </div>
	                                    </div>
								<%		
										if (i % 2 == 0){
								%>
											</div>
								<%
										}
										i++;
										
										if (i == 5) break;
									}
								%>
                            </div>
                        	<p style="text-align:center;"><a href="blog.jsp?list=Web" class="genric-btn info-border">More</a></p>
                        </div>
                        <div class="tab-pane fade single-member" id="Breakfast" role="tabpanel" aria-labelledby="Breakfast-tab">
                            <div class="row">
                                <%
									st = null;
                                	rs = null;
									i = 1;
									st = conn.prepareStatement("SELECT * FROM MEMBER,STUDY WHERE member.id = study.id AND study.list = 'Web'");
									
									rs = st.executeQuery();
									while (rs.next()){
										String ID = rs.getString("ID");
										String TITLE = rs.getString("TITLE");
										String SUBTITLE = rs.getString("SUBTITLE");
										String NAME = rs.getString("NAME");
										
										if (i % 2 == 1){
								%>
											<div class="col-sm-6 col-lg-6">
								<%
										}
								%>
										<div class="single_food_item media">
	                                        <img src="img/food_menu/single_food_<%=i %>.png" class="mr-3" alt="...">
	                                        <div class="media-body align-self-center">
	                                            <h3><%=TITLE %></h3>
	                                            <p><%=SUBTITLE %></p>
	                                            <h5><%=NAME %></h5>
	                                        </div>
	                                    </div>
								<%		
										if (i % 2 == 0){
								%>
											</div>
								<%
										}
										i++;
										
										if (i == 5) break;
									}
								%>
                            </div>
                        	<p style="text-align:center;"><a href="blog.jsp?list=Web" class="genric-btn info-border">More</a></p>
                        </div>
                        <div class="tab-pane fade single-member" id="Launch" role="tabpanel" aria-labelledby="Launch-tab">
                            <div class="row">
                                <%
									st = null;
                                	rs = null;
									i = 1;
									
									st = conn.prepareStatement("SELECT * FROM MEMBER,STUDY WHERE member.id = study.id AND study.list = 'Web'");
									
									rs = st.executeQuery();
									while (rs.next()){
										String ID = rs.getString("ID");
										String TITLE = rs.getString("TITLE");
										String SUBTITLE = rs.getString("SUBTITLE");
										String NAME = rs.getString("NAME");
										
										if (i % 2 == 1){
								%>
											<div class="col-sm-6 col-lg-6">
								<%
										}
								%>
										<div class="single_food_item media">
	                                        <img src="img/food_menu/single_food_<%=i %>.png" class="mr-3" alt="...">
	                                        <div class="media-body align-self-center">
	                                            <h3><%=TITLE %></h3>
	                                            <p><%=SUBTITLE %></p>
	                                            <h5><%=NAME %></h5>
	                                        </div>
	                                    </div>
								<%		
										if (i % 2 == 0){
								%>
											</div>
								<%
										}
										i++;
										
										if (i == 5) break;
									}
								%>
                            </div>
                        	<p style="text-align:center;"><a href="blog.jsp?list=Web" class="genric-btn info-border">More</a></p>
                        </div>
                        <div class="tab-pane fade single-member" id="Dinner" role="tabpanel" aria-labelledby="Dinner-tab">
                            <div class="row">
                                <%
									st = null;
                                	rs = null;
									i = 1;
									
									st = conn.prepareStatement("SELECT * FROM MEMBER,STUDY WHERE member.id = study.id AND study.list = 'Web'");
									
									rs = st.executeQuery();
									while (rs.next()){
										String ID = rs.getString("ID");
										String TITLE = rs.getString("TITLE");
										String SUBTITLE = rs.getString("SUBTITLE");
										String NAME = rs.getString("NAME");
										
										if (i % 2 == 1){
								%>
											<div class="col-sm-6 col-lg-6">
								<%
										}
								%>
										<div class="single_food_item media">
	                                        <img src="img/food_menu/single_food_<%=i %>.png" class="mr-3" alt="...">
	                                        <div class="media-body align-self-center">
	                                            <h3><%=TITLE %></h3>
	                                            <p><%=SUBTITLE %></p>
	                                            <h5><%=NAME %></h5>
	                                        </div>
	                                    </div>
								<%		
										if (i % 2 == 0){
								%>
											</div>
								<%
										}
										i++;
										
										if (i == 5) break;
									}
								%>
                            </div>
                        	<p style="text-align:center;"><a href="blog.jsp?list=Web" class="genric-btn info-border">More</a></p>
                        </div>
                        <div class="tab-pane fade single-member" id="Sneaks" role="tabpanel" aria-labelledby="Sneaks-tab">
                            <div class="row">
                                <%
									st = null;
                                	rs = null;
									i = 1;
									
									st = conn.prepareStatement("SELECT * FROM MEMBER,STUDY WHERE member.id = study.id AND study.list = 'Web'");
									
									rs = st.executeQuery();
									while (rs.next()){
										String ID = rs.getString("ID");
										String TITLE = rs.getString("TITLE");
										String SUBTITLE = rs.getString("SUBTITLE");
										String NAME = rs.getString("NAME");
										
										if (i % 2 == 1){
								%>
											<div class="col-sm-6 col-lg-6">
								<%
										}
								%>
										<div class="single_food_item media">
	                                        <img src="img/food_menu/single_food_<%=i %>.png" class="mr-3" alt="...">
	                                        <div class="media-body align-self-center">
	                                            <h3><%=TITLE %></h3>
	                                            <p><%=SUBTITLE %></p>
	                                            <h5><%=NAME %></h5>
	                                        </div>
	                                    </div>
								<%		
										if (i % 2 == 0){
								%>
											</div>
								<%
										}
										i++;
										
										if (i == 5) break;
									}
									
									rs.close();
									st.close();
									conn.close();
								%>
                            </div>
                        	<p style="text-align:center;"><a href="blog.jsp?list=Web" class="genric-btn info-border">More</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- food_menu part end-->

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