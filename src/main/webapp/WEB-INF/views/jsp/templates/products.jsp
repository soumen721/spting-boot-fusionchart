<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.11/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">


<script>
	function delFunction(context, id, type) {	  
	    if (confirm("Want to delete this Item!") == true) {
	        window.location=context+"/delproduct/"+id+"/"+type;
	    } else {
	        self.close;
	    }	
	}

	function callSearch(context){
		var str=$( "#myselect" ).val();
		 window.location=context+"/products/"+str;	 
	}
	
	$(document).ready(function(){
	    $("#myTable").dataTable({
	        "sPaginationType": "full_numbers",
	        "bJQueryUI": true
	    });
	});
</script>

<div class="container" >
	<form class="navbar-form navbar-right" role="search" method="GET" action="">
	Filter By Type : 
	<select id="myselect" onchange="callSearch('${pageContext.request.contextPath}')" style="width:175px">
	    <option value="all">All</option>
	    <option value="Mobile">Mobile</option>
	    <option value="Calc">Calculator</option>
	    <option value="Laptop">Laptop</option>
	    <option value="Tech">Technology</option>
	</select>
	</form><br/><br/>
	
	<div class="table-responsive">
		<table id="myTable" class="table table-striped table-bordered" cellspacing="0" width="100%">	
			<thead>
				<tr>
	                <th align="center"> Product Name</th>
	                <th align="center"> Product Img</th>
	                <th align="center"> Product Type</th>
	                <th align="center"> Product Price</th>
	                <th align="center"> Delete Product</th>
	            </tr>
           </thead>
           <tbody>
				<c:forEach items="${products}" var="product">
					<tr>
						<td align="center"> ${product.name} </td>
						<td align="center"> <img src="" alt="..." class="img-thumbnail"> </td>
						<td align="center"> ${product.type} </td>
						<td align="center"> ${product.price} </td>
						<td align="center"> 
							<img src="${pageContext.request.contextPath}/img/delete.jpg" alt="..." class="img-thumbnail" style="cursor: pointer;"
							width="40px" height="40px" onclick="delFunction('${pageContext.request.contextPath}', '${product.id}', '${product.type}')" />
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>		
	
	<%-- <div class="products">
		<c:forEach items="${products}" var="product">
		<div class="col-md-3" style="text-align: center">
			<p>${product.name}</p>
			<a href="#" onclick="delFunction('${pageContext.request.contextPath}', '${product.id}', '${product.type}')"><img src="" alt="..." class="img-thumbnail"> </a>
			<p>${product.type}</p>
			<p>${product.price}</p>
		</div>
	</c:forEach>
	</div> --%>
	
	<div>
		<div class="col-md-12" style="text-align: center">
			<jsp:include page="FusionChart.jsp" />
		</div>
	</div>
</div>