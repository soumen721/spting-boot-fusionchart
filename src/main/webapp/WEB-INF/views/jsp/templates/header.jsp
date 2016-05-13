<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
	$( document ).ready(function() {
		$( "#myselect" ).val($( "#selType" ).val());
		
	});
</script>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Product Pricing System</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}">Home <span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/addproduct">Add Products</a></li>
				<li><a href="${pageContext.request.contextPath}/products/all">Products</a></li>
			</ul>
				
			   <form class="navbar-form navbar-right" role="search" method="GET" action="">
				<input type="hidden" id="selType"  name="seltype" value=${selType} />
			</form>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>