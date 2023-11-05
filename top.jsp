<html>
<head>
<title>top</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<header>
		<div class="wrapper">
			<span class="logoimg"> <a href="/AcornSHOP/index.jsp"> <img
					id="logoimg" src="/AcornSHOP/images/logo1.gif" width="200" height="130"></a>
			</span>
			<nav class="top-bar__menu-box">
				<ul class="menu">
					<li>
						<a class="jo" href="/AcornSHOP/about/about.jsp">About</a>
						<ul>
							<li><a href="/AcornSHOP/about/about.jsp">about</a>
							<li><a href="/AcornSHOP/about/map.jsp">map</a></li>
						</ul>
					</li>
					<li><a class="jo" href="/AcornSHOP/list.do">Product</a>
						<ul>
							<li><a href="/AcornSHOP/list.do">list</a>
						</ul></li>
					<li><a class="jo" href="/AcornSHOP/cs/faq.jsp">CustomerService</a>
						<ul>
							<li><a href="/AcornSHOP/cs/cs.jsp">list</a>
							<li><a href="/AcornSHOP/cs/faq.jsp">FAQ</a></li>
						</ul></li>
					<li class="jo"><jsp:include page="login/login.jsp"	flush="false" /></li>
					<li class="cartimg">
					<a href="/AcornSHOP/mypage/cart.jsp"><img id="cartimg" src="images/cart.png" width="50" height="50"></a>
					</li>
				</ul>
			</nav>
		</div>
	</header>
	<p style="margin-bottom: 135px"></p>
</body>
</html>