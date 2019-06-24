
<!--::header part start::-->
<header class="main_menu">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-12">
				<nav class="navbar navbar-expand-lg navbar-light">
					<%
						String userid = request.getParameter("id");
					
						if (userid == null) {
					%>
							<a class="navbar-brand" href="index.jsp"><img src="img/logo.png" alt="logo"></a>
					<%
						} else {
					%>
							<a class="navbar-brand" href="index.jsp?id=<%=userid %>"><img src="img/logo.png" alt="logo"></a>
					<%
						}
					%>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div
						class="collapse navbar-collapse main-menu-item justify-content-end"
						id="navbarSupportedContent">
						<ul class="navbar-nav">
								<%
									if (userid == null || userid.equals("null")) {
		                        %>
                                    	<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                                <%
		                        	} else {
		                        %>
		                        		<li class="nav-item"><a class="nav-link" href="index.jsp?id=<%=userid %>">Home</a></li>
		                        <%
		                        	}
		                        %>
							<li class="nav-item"><a class="nav-link" href="study.jsp">Study</a></li>
						</ul>
					</div>

					<div style="margin: 0 20px;">
						<a href="study.jsp" class="single_page_btn d-none d-sm-block">Logout</a>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- Header part end-->