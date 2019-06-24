
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
									if (userid == null) {
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
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="blog.jsp"
								id="navbarDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> Blog </a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="blog.jsp">Blog</a> <a
										class="dropdown-item" href="single-blog.jsp">Single blog</a>
									<a class="dropdown-item" href="elements.html">Elements</a>
								</div></li>
						</ul>
					</div>
					<div class="menu_btn">
						<%
							if (userid == null) {
		                %>
                                <a href="404.html" class="single_page_btn d-none d-sm-block">Write</a>
                        <%
		                        } else {
		                %>
		                		<a href="write.jsp?id=<%=userid %>" class="single_page_btn d-none d-sm-block">Write</a>
		                <%
		                        }
		                %>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- Header part end-->